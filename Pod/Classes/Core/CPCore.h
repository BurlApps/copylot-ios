//
//  CPCore.h
//  Pods
//
//  Created by Brian Vallelunga on 7/21/15.
//
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@class CoPylot, CoPyotPayload, CoPylotBlock, CPRequestHandler;
@interface CoPylot : NSObject

// CoPylot Initialization
+ (CoPylot *)sharedInstanceWithAppID:(NSString *)appID andSecret:(NSString *)secret;
+ (instancetype)sharedInstance;

// Payload Storage
@property (nonatomic, assign) BOOL hasLoaded;
@property (nonatomic, strong) CoPyotPayload *payload;
@property (nonatomic, strong) NSMutableArray *blocks;
@property (nonatomic, strong) NSMutableDictionary *variables;

// Request Handler
@property (nonatomic, strong) CPRequestHandler *requestHandler;

// Status Check
-(void)statusCheck;
-(void)setVariables:(NSMutableDictionary *)variables;
-(CoPylotBlock *)blockForSlug:(NSString *)slug;

@end
