
//
//  CPBlock.m
//  Pods
//
//  Created by Brian Vallelunga on 7/14/15.
//
//

#import "CPBlock.h"
#import "CoPylotBlockSegment.h"
#import "CoPylotBlock.h"
#import "CPRequestHandler.h"

@implementation CPBlock

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.copylot = [CoPylot sharedInstance];
        [self.copylot.blocks addObject:self];
    }
    
    return self;
}

- (void)setBlockTitle:(NSString *)title {
    self.title = title;
    self.slug = [title lowercaseString];
    
    [self registerBlock];
}

- (void)newPayload:(CoPylotBlock *)block {
    self.data = block;
    
    if(self.delegate != nil) {
        [self.delegate wasUpdated];
        [self hasNewVariables];
    }
}

- (void)hasNewVariables {
    [self.delegate blockDataWithHandler:^(NSString *text, NSDictionary *variables) {
        NSMutableDictionary *newVariables = [NSMutableDictionary dictionary];
        
        for(NSString *key in variables) {
            if(![self.data.variables objectForKey:key]) {
                [newVariables setValue:[variables objectForKey:key] forKey:key];
            }
        }
        
        if(newVariables.count > 0) {
            [self.copylot.requestHandler registerBlockVariables:newVariables andID: self.data.ID];
        }
    }];
}

- (void)registerBlock {
    if(self.copylot.hasLoaded && self.slug != nil && ![self.copylot.payload.blocks objectForKey:self.slug]) {
        [self.delegate blockDataWithHandler:^(NSString *text, NSDictionary *variables) {
            [self.copylot.requestHandler registerBlockWithTitle:self.title andText:text andVariables:variables];
        }];
    }
}

- (NSString *)buildText:(NSDictionary *)variables {
    if(self.data == nil) return nil;
    
    NSMutableString *text = [NSMutableString string];
    
    for(CoPylotBlockSegment *segment in self.data.segments) {
        if([segment.type isEqual: @"text"]) {
            [text appendString: segment.text];
        } else if([segment.type isEqual: @"variable"]) {
            NSDictionary *source = variables;
            
            if([segment.source isEqual: @"global"]) {
                source = self.copylot.variables;
            }
            
            if([source objectForKey:segment.variable]) {
                [text appendString: [NSString stringWithFormat: @"%@", [source objectForKey: segment.variable]]];
            }
        }
    }
    
    return text;
}

- (NSAttributedString *)buildAttrText:(NSAttributedString *)originalText withVariables:(NSDictionary *)variables {
    if(self.data == nil) return nil;
    
    NSDictionary *attrs = [originalText attributesAtIndex:0 effectiveRange:&((NSRange){0, [originalText length]})];
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] init];
    [text addAttributes:attrs range: (NSRange){0, [text length]}];
    
    [text beginEditing];
    
    for(CoPylotBlockSegment *segment in self.data.segments) {
        NSMutableAttributedString *attrText;
        
        if([segment.type isEqual: @"text"]) {
            attrText = [[NSMutableAttributedString alloc] initWithString:segment.text];
        } else if([segment.type isEqual: @"variable"]) {
            NSDictionary *source = variables;
            
            if([segment.source isEqual: @"global"]) {
                source = self.copylot.variables;
            }
            
            if([source objectForKey:segment.variable]) {
                NSString *variable = [NSString stringWithFormat: @"%@", [source objectForKey: segment.variable]];
                attrText = [[NSMutableAttributedString alloc] initWithString:variable];
            }
        }
        
        [self fontString:attrText andAttr:attrs withNewAttr: segment.attributes];
        [text appendAttributedString:attrText];
    }
    
    [text endEditing];
    
    return text;
}

-(void)fontString:(NSMutableAttributedString *)attrText andAttr:(NSDictionary *)attrs withNewAttr:(NSDictionary *)newAttrs {
    NSRange range = NSMakeRange(0, attrText.length);
    
    UIFontDescriptorSymbolicTraits traits = 0;
    if([newAttrs objectForKey:@"bold"] != nil) {
        traits |= UIFontDescriptorTraitBold;
    }
    
    if([newAttrs objectForKey:@"italic"] != nil) {
        traits |= UIFontDescriptorTraitItalic;
    }
    
    if([newAttrs objectForKey:@"underline"] != nil) {
        [attrText addAttribute:NSUnderlineStyleAttributeName value: @(NSUnderlineStyleSingle) range:range];
    }
    
    if([newAttrs objectForKey:@"strikethrough"] != nil) {
        [attrText addAttribute:NSStrikethroughStyleAttributeName value: @(NSUnderlineStyleSingle) range:range];
    }
    
    if([newAttrs objectForKey:@"alignment"] != nil) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init] ;
        NSString *alignment = [newAttrs objectForKey:@"alignment"];
        
        if([alignment isEqualToString:@"left"]) {
            [paragraphStyle setAlignment:NSTextAlignmentLeft];
        } else if([alignment isEqualToString:@"right"]) {
            [paragraphStyle setAlignment:NSTextAlignmentRight];
        } else if([alignment isEqualToString:@"center"]) {
            [paragraphStyle setAlignment:NSTextAlignmentCenter];
        } else {
            [paragraphStyle setAlignment:NSTextAlignmentJustified];
        }
        
        [attrText addAttribute:NSParagraphStyleAttributeName value: paragraphStyle range:range];
    }
    
    UIFont* font = attrs[NSFontAttributeName];
    
    if (font == nil) font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    
    UIFont* newFont = [UIFont fontWithDescriptor:[[font fontDescriptor] fontDescriptorWithSymbolicTraits:traits] size:font.pointSize];
    
    if (newFont != nil) font = newFont;
    
    [attrText removeAttribute: NSFontAttributeName range: range];
    [attrText addAttribute: NSFontAttributeName value: font range: range];
}


@end
