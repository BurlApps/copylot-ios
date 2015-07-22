//
//  CPTextField.h
//  CoPylot-Example
//
//  Created by Brian Vallelunga on 7/20/15.
//  Copyright (c) 2015 Brian Vallelunga. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CPTextField;
@protocol CPBlockDelegate;
@interface CPTextField : UITextField <CPBlockDelegate>

@property (nonatomic, strong) NSDictionary *variables;

- (instancetype)initWithTitle:(NSString *)title;
- (void)setBlockTitle:(NSString *)title;

@end
