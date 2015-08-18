//
//  CPAttributedString.m
//  Pods
//
//  Created by Brian Vallelunga on 8/17/15.
//
//

#import "CPAttributedString.h"

@interface CPAttributedString()

@property (nonatomic, strong) CPBlock *block;
@property (nonatomic, strong) NSAttributedString *text;

@end

@implementation CPAttributedString

+ (NSAttributedString *)createWithTitle:(NSString *)title andVariables:(NSDictionary *)variables withDefault:(NSAttributedString *)defaultValue {
    CPAttributedString *cpstring = [[CPAttributedString alloc] init];
    
    CPBlock *block = [[CPBlock alloc] init];
    
    block.delegate = cpstring;
    
    cpstring.block = block;
    cpstring.variables = variables;
    cpstring.text = defaultValue;
    
    [block setBlockTitle: title];
    [block prepare];
    
    NSAttributedString *text = [cpstring.block buildAttrText:defaultValue withVariables:variables];
    
    if(text != nil) {
        cpstring.text = text;
    }
    
    return cpstring.text;
}

- (void)wasUpdated {
    
}

- (void)blockDataWithHandler:(void(^)(NSString *text, NSDictionary *variables))handler {
    handler([self.text string], self.variables);
}

@end