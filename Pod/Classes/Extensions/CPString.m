//
//  CPString.m
//  Pods
//
//  Created by Brian Vallelunga on 8/17/15.
//
//

#import "CPString.h"

@interface CPString()

@property (nonatomic, strong) CPBlock *block;
@property (nonatomic, strong) NSString *text;

@end

@implementation CPString

+ (NSString *)createWithTitle:(NSString *)title andVariables:(NSDictionary *)variables withDefault:(NSString *)defaultValue {
    CPString *cpstring = [[CPString alloc] init];

    CPBlock *block = [[CPBlock alloc] init];
    
    block.delegate = cpstring;
    
    cpstring.block = block;
    cpstring.variables = variables;
    cpstring.text = defaultValue;
    
    [block setBlockTitle: title];
    [block prepare];
    
    NSString *text = [cpstring.block buildText:variables];
    
    if(text != nil) {
        cpstring.text = text;
    }
    
    return cpstring.text;
}

- (void)wasUpdated {
    
}

- (void)blockDataWithHandler:(void(^)(NSString *text, NSDictionary *variables))handler {
    handler(self.text, self.variables);
}

@end
