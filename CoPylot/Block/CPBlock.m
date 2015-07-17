
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
        [self registerBlock];
    }
    
    return self;
}

- (void)newPayload:(CoPylotBlock *)block {
    self.data = block;
    [self.delegate wasUpdated];
    [self hasNewVariables];
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
    if(self.copylot.hasLoaded) {
        [self.delegate blockDataWithHandler:^(NSString *text, NSDictionary *variables) {
            [self.copylot.requestHandler registerBlockWithTitle:self.title andText:text andVariables:variables];
        }];
    }
}

- (NSString *)buildText:(NSDictionary *)variables {
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

- (NSAttributedString *)buildAttrText:(NSDictionary *)variables {
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] init];
    
    for(CoPylotBlockSegment *segment in self.data.segments) {
        if([segment.type isEqual: @"text"]) {
            NSMutableAttributedString *attrText = [[NSMutableAttributedString alloc] initWithString:segment.text];
            
            [text appendAttributedString:attrText];
        } else if([segment.type isEqual: @"variable"]) {
            NSDictionary *source = variables;
            
            if([segment.source isEqual: @"global"]) {
                source = self.copylot.variables;
            }
            
            if([source objectForKey:segment.variable]) {
                NSString *variable = [NSString stringWithFormat: @"%@", [source objectForKey: segment.variable]];
                NSMutableAttributedString *attrText = [[NSMutableAttributedString alloc] initWithString:variable];
                
                [text appendAttributedString:attrText];
            }
        }
    }
    
    return text;
}

@end
