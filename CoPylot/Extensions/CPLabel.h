//
//  CPLabel.h
//  Pods
//
//  Created by Brian Vallelunga on 7/14/15.
//
//

#import <UIKit/UIKit.h>

#import "CPBlock.h"

@class CPLabel;
@interface CPLabel : UILabel <CPBlockDelegate>

@property (nonatomic, strong) NSDictionary *variables;

- (instancetype)init;
- (instancetype)initWithFrame:(CGRect)frame;
- (instancetype)initWithCoder:(NSCoder *)aDecoder;
- (instancetype)initWithTitle:(NSString *)title;
- (void)setBlockTitle:(NSString *)title;

@end
