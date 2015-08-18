//
//  CPAttributedString.h
//  Pods
//
//  Created by Brian Vallelunga on 8/17/15.
//
//

#import <UIKit/UIKit.h>

#import "CPBlock.h"

@class  CPAttributedString;
@protocol CPBlockDelegate;
@interface CPAttributedString : NSObject <CPBlockDelegate>

@property (nonatomic, strong) NSString *blockTitle;
@property (nonatomic, strong) NSDictionary *variables;

+ (NSAttributedString *)createWithTitle:(NSString *)title
                 andVariables:(NSDictionary *)variables withDefault:(NSAttributedString *)defaultValue;

@end