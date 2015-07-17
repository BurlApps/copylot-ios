//
//  CPLabel.m
//  Pods
//
//  Created by Brian Vallelunga on 7/14/15.
//
//

#import "CPLabel.h"

@implementation CPLabel


- (instancetype)initWithTitle:(NSString *)title {
    self = [super init];
    
    if (self) {
        CPBlock *block = [[CPBlock alloc] init];
        
        self.block = block;
        self.variables = [NSDictionary dictionary];
        self.numberOfLines = 0;
        
        block.delegate = self;
        block.title = title;
        block.slug = [title lowercaseString];
    }
    
    return self;
}

-(void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    [self wasUpdated];
}

- (void)wasUpdated {
    if(self.block.data != nil) {
        self.text = [self.block buildText:self.variables];
    }
}

- (void)blockDataWithHandler:(void(^)(NSString *text, NSDictionary *variables))handler {
    handler(self.text, self.variables);
}

@end
