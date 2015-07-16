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
#import "CoPylotBlock.h"

@implementation CoPylot

- (instancetype)initWithAppId:(NSString *)appId andSecret:(NSString *)secret {
    if (self = [self init]) {
        self.blocks = [NSMutableArray array];
        self.hasLoaded = false;
        self.requestHandler = [[CPRequestHandler alloc] initWithAppID:appId andSecret:secret];
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

-(void)statusCheck {
    [self.requestHandler getPayloadwithHandler:^(id response, NSError *error) {
        self.hasLoaded = true;
        self.payload = [[CoPyotPayload alloc] initWithPayload:response];
        
        for(CPBlock *block in self.blocks) {
            CoPylotBlock *blockModel = [self.payload.blocks objectForKey:block.slug];
            
            if(blockModel != nil) {
                [block newPayload:blockModel];
            } else {
                [block registerBlock];
            }
        }
    }];
}

@end
