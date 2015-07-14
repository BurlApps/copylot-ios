//
//  CoPylot.h
//  Pods
//
//  Created by Brian Vallelunga on 7/13/15.
//
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#import "CPLogger.h"
#import "CPRequestHandler.h"
#import "CPUtils.h"

@interface CoPylot : NSObject

#pragma mark CoPylot Initialization
+ (CoPylot *)sharedInstanceWithAppID:(NSString *)appID andSecret:(NSString *)secret;
+ (instancetype)sharedInstance;

@property (nonatomic, copy) NSString *appId;
@property (nonatomic, copy) NSString *appSecret;
@property (nonatomic, copy) NSString *appInstallation;

@property (nonatomic, strong) CPRequestHandler *requestHandler;

@end
