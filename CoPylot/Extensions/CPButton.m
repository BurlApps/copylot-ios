//
//  CPButton.m
//  CoPylot-Example
//
//  Created by Brian Vallelunga on 7/17/15.
//  Copyright (c) 2015 Brian Vallelunga. All rights reserved.
//

#import "CPButton.h"

@interface CPButton()

@property (nonatomic, strong) CPBlock *block;
@property (nonatomic, assign) BOOL isVisible;

@end

@implementation CPButton

- (instancetype)init {
    self = [super init];
    
    if (self) {
        [self setUp];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setUp];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self setUp];
    }
    
    return self;
}

- (instancetype)initWithTitle:(NSString *)title {
    self = [super init];
    
    [self setBlockTitle: title];
    
    return self;
}

- (void)setUp {
    self.block = [[CPBlock alloc] init];
    self.block.delegate = self;
    
    self.variables = [NSDictionary dictionary];
    
    if([self respondsToSelector:@selector(blockTitle)]) {
        [self setBlockTitle: [self valueForKey: @"blockTitle"]];
    }
}

- (void)setBlockTitle:(NSString *)title {
    [self.block setBlockTitle: title];
}

-(void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    [self wasUpdated];
}

- (void)wasUpdated {
    if(self.block.data != nil) {
        [self setAttributedTitle: [self.block buildAttrText:self.currentAttributedTitle withVariables:self.variables] forState:UIControlStateNormal];
        [self sizeToFit];
    }
}

- (void)blockDataWithHandler:(void(^)(NSString *text, NSDictionary *variables))handler {
    handler(self.currentTitle, self.variables);
}

@end
