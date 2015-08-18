//
//  CPString.h
//  Pods
//
//  Created by Brian Vallelunga on 8/17/15.
//
//

#import <UIKit/UIKit.h>

#import "CPBlock.h"

@class  CPString;
@protocol CPBlockDelegate;
@interface CPString : NSObject <CPBlockDelegate>

@property (nonatomic, strong) NSString *blockTitle;
@property (nonatomic, strong) NSDictionary *variables;

+ (NSString *)createWithTitle:(NSString *)title
    andVariables:(NSDictionary *)variables withDefault:(NSString *)defaultValue;

@end
