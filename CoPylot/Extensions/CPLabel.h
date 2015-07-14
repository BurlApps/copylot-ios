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

- (instancetype)initWithName:(NSString *)title;

@end
