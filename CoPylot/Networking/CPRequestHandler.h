//
//  CPRequestHandler.h
//  Pods
//
//  Created by Brian Vallelunga on 7/14/15.
//
//

#include <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "CoPylot.h"

@class CPRequestHandler;
@interface CPRequestHandler : NSObject

#pragma mark Request Handler Initialization
- (instancetype)initWithAppID:(NSString *)appId andSecret:(NSString *)secret;

@property (nonatomic, copy) NSString *appId;
@property (nonatomic, copy) NSString *appSecret;
@property (nonatomic, copy) NSString *installationID;
@property (nonatomic, copy) NSString *payloadVersion;

# pragma mark API Routes
- (void)getPayloadwithHandler:(void(^)(id response, NSError *error))handler;
- (void)registerGlobalVariables:(NSDictionary *)variables;
- (void)registerBlockVariables:(NSDictionary *)variables andID:(NSString *)blockID;
- (void)registerBlockWithTitle:(NSString *)title andText:(NSString *)text andVariables:(NSDictionary *)variables;

@end
