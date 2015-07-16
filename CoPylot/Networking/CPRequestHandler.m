//
//  CPRequestHandler.m
//  Pods
//
//  Created by Brian Vallelunga on 7/14/15.
//
//

#import "CPConstants.h"
#import "CPRequestHandler.h"

@implementation CPRequestHandler

- (instancetype)initWithAppID:(NSString *)appId andSecret:(NSString *)secret {
    if (self = [self init]) {
        self.appId = appId;
        self.appSecret = secret;
        self.installationID = @"";
        self.payloadVersion = @"";
    }
    
    return self;
}

- (void)getPayloadwithHandler:(void(^)(id response, NSError *error))handler {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *url = [NSString stringWithFormat: @"%@%@", CoPylotAPIBaseURL, @"payload"];
    
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    [manager.requestSerializer setAuthorizationHeaderFieldWithUsername: self.appId password: self.appSecret];
    
    [manager GET:url parameters:@{
        @"installation": self.installationID,
        @"version": self.payloadVersion
    } success:^(AFHTTPRequestOperation *operation, id response) {        
        self.installationID = [response[@"installation"] stringValue];
        BOOL isNew = [response[@"newPayload"] boolValue];
        
        if(isNew) {
            self.payloadVersion = [response[@"platform"][@"version"] stringValue];
            handler(response[@"platform"], nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
        handler(nil, error);
    }];
}

@end
