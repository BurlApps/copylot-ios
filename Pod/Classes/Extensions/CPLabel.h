//
//  CPLabel.h
//  Pods
//
//  Created by Brian Vallelunga on 7/14/15.
//
//

#import <UIKit/UIKit.h>

@class CPLabel;
@protocol CPBlockDelegate;
@interface CPLabel : UILabel <CPBlockDelegate>

@property (nonatomic, strong) NSDictionary *variables;

- (instancetype)initWithTitle:(NSString *)title;
- (void)setBlockTitle:(NSString *)title;

@end
