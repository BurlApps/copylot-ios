//
//  CPButton.h
//  CoPylot-Example
//
//  Created by Brian Vallelunga on 7/17/15.
//  Copyright (c) 2015 Brian Vallelunga. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CPBlock.h"

@class CPButton;
@interface CPButton : UIButton <CPBlockDelegate>

@property (nonatomic, strong) NSDictionary *variables;

- (instancetype)init;
- (instancetype)initWithFrame:(CGRect)frame;
- (instancetype)initWithCoder:(NSCoder *)aDecoder;
- (instancetype)initWithTitle:(NSString *)title;
- (void)setBlockTitle:(NSString *)title;

@end
