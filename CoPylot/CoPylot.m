//
//  CoPylot.m
//  Pods
//
//  Created by Brian Vallelunga on 7/13/15.
//
//


#if ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Either turn on ARC for the project or use -fobjc-arc flag on this file.
#endif

#import "CoPylot.h"

@implementation CoPylot

//
// Init and handling shared instance & needed data
//
- (instancetype)initWithAppId:(NSString *)appId andSecret:(NSString *)secret {
    if (self = [self init]) {
        self.appId = appId;
        self.appSecret = secret;
        self.blocks = [[NSMutableDictionary alloc] init];
        self.requestHandler = [[CPRequestHandler alloc] initWithCoPylot:self];
    }
    
    return self;
}

static CoPylot *sharedInstance = nil;
static dispatch_once_t sharedInstancedWithAppID;

+ (CoPylot *)sharedInstanceWithAppID:(NSString *)appID andSecret:(NSString *)secret {
    dispatch_once(&sharedInstancedWithAppID, ^{
        sharedInstance = [[self alloc] initWithAppId:appID andSecret:secret];
    });
                  
    return sharedInstance;
}

+ (instancetype)sharedInstance {
    if (sharedInstance == nil) {
        CPLog(@"warning sharedInstance called before sharedInstanceWithAppID:");
    }
    
    return sharedInstance;
}

@end
