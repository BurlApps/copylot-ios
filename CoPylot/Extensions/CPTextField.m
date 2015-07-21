//
//  CPTextField.m
//  CoPylot-Example
//
//  Created by Brian Vallelunga on 7/20/15.
//  Copyright (c) 2015 Brian Vallelunga. All rights reserved.
//

#import "CPTextField.h"

@interface CPTextField()

@property (nonatomic, strong) CPBlock *block;
@property (nonatomic, assign) BOOL isVisible;

@end

@implementation CPTextField

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
    
    if([self respondsToSelector:@selector(title)]) {
        [self setBlockTitle: [self valueForKey: @"title"]];
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
        self.attributedText = [self.block buildAttrText:self.attributedText withVariables:self.variables];
        [self sizeToFit];
    }
}

- (void)blockDataWithHandler:(void(^)(NSString *text, NSDictionary *variables))handler {
    handler(self.text, self.variables);
}

@end
