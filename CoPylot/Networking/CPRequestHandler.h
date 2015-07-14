//
//  CPRequestHandler.h
//  Pods
//
//  Created by Brian Vallelunga on 7/14/15.
//
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "CoPylot.h"

@interface CPRequestHandler : NSObject

#pragma mark Request Handler Initialization
- (instancetype)initWithCoPylot:(CoPylot *)copylot;

@property (nonatomic, strong) CoPylot *copylot;

# pragma mark API Routes
- (void)getPayloadwithHandler:(void(^)(BOOL, *NSError))handler;

@end