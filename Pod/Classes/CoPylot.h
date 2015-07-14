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
#import "CPRequestHandler.h"

@interface CoPylot : NSObject

#pragma mark CoPylot Initialization
+ (CoPylot *)sharedInstanceWithAppID:(NSString *)appID andSecret:(NSString *)secret;
+ (instancetype)sharedInstance;

@property (nonatomic, copy) NSString *appId;
@property (nonatomic, copy) NSString *appSecret;
@property (nonatomic, copy) NSString *appInstallation;

#pragma mark Core Utilities
@property (nonatomic, strong) CPRequestHandler *requestHandler;


#pragma mark Block Tracking
@property (nonatomic, copy) NSMutableDictionary *blocks;

@end