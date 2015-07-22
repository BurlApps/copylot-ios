//
//  CPCore.m
//  Pods
//
//  Created by Brian Vallelunga on 7/21/15.
//
//

#import "CPCore.h"
#import "CPBlock.h"
#import "CPLogger.h"
#import "CoPylotBlock.h"
#import "CoPyotPayload.h"
#import "CPRequestHandler.h"

@implementation CoPylot

- (instancetype)initWithAppId:(NSString *)appId andSecret:(NSString *)secret {
    if (self = [self init]) {
        self.blocks = [NSMutableArray array];
        self.hasLoaded = NO;
        self.requestHandler = [[CPRequestHandler alloc] initWithAppID:appId andSecret:secret];
        
        _variables = [NSMutableDictionary dictionary];
    }
    
    return self;
}

static CoPylot *sharedInstance = nil;
static dispatch_once_t sharedInstancedWithAppID;

+ (CoPylot *)sharedInstanceWithAppID:(NSString *)appID andSecret:(NSString *)secret {
    if(appID == nil || [appID isEqual:@""] || secret == nil || [secret isEqual:@""]) {
        CPLog(@"App ID and Secret can't be nil or empty");
    } else {
        dispatch_once(&sharedInstancedWithAppID, ^{
            sharedInstance = [[self alloc] initWithAppId:appID andSecret:secret];
        });
    }
    
    return sharedInstance;
}

+ (instancetype)sharedInstance {
    if (sharedInstance == nil) {
        CPLog(@"warning sharedInstance called before sharedInstanceWithAppID:");
    }
    
    return sharedInstance;
}

-(CoPylotBlock *)blockForSlug:(NSString *)slug {
    return [self.payload.blocks objectForKey:slug];
}

- (void)hasNewVariables {
    if(self.hasLoaded) {
        NSMutableDictionary *newVariables = [NSMutableDictionary dictionary];
        
        for(NSString *key in self.variables) {
            if(![self.payload.variables objectForKey:key]) {
                [newVariables setValue:[self.variables objectForKey:key] forKey:key];
            }
        }
        
        if(newVariables.count > 0) {
            [self.requestHandler registerGlobalVariables: newVariables];
        }
    }
}

-(void)setVariables:(NSDictionary *)variables {
    for(NSString *key in variables) {
        id variable = [variables objectForKey:key];
        [_variables setObject:variable forKey:key];
    }
    
    [self hasNewVariables];
}

-(void)statusCheck {
    [self.requestHandler getPayloadwithHandler:^(id response, NSError *error) {
        self.hasLoaded = YES;
        self.payload = [[CoPyotPayload alloc] initWithPayload:response];
        
        [self hasNewVariables];
        
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
