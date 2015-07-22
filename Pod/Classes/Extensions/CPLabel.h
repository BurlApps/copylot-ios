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
@protocol CPBlockDelegate;
@interface CPLabel : UILabel <CPBlockDelegate>

@property (nonatomic, strong) NSString *blockTitle;
@property (nonatomic, strong) NSDictionary *variables;

- (instancetype)initWithTitle:(NSString *)title;
- (void)setBlockTitle:(NSString *)title;

@end
