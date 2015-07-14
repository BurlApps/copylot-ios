//
//  CoPylot.h
//  Pods
//
//  Created by Brian Vallelunga on 7/13/15.
//
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#import "CPBlock.h"
#import "CPUtils.h"
#import "CPLogger.h"
#import "CPExtensions.h"

@class CoPylot;
@interface CoPylot : NSObject

// CoPylot Initialization
+ (CoPylot *)sharedInstanceWithAppID:(NSString *)appID andSecret:(NSString *)secret;
+ (instancetype)sharedInstance;

// Block Tracking
@property (nonatomic, strong) NSMutableDictionary *blocks;

// Status Check
-(void)statusCheck;

@end
