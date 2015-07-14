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

- (instancetype)initWithCoPylot:(CoPylot *)copylot {
    self = [super init];
    
    if (self) {
        self.copylot = copylot;
    }
    
    return self;
}

- (void)getPayload:withHandler(void(^)(BOOL, *NSError))handler {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *url = [NSString stringWithFormat: @"%@%@", CoPylotAPIBaseURL, @"payload"];
    
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:
        [self.copylot appId] password: [self.copylot appSecret]];
    
    [manager GET:url parameters:@[
        "installation" : [self.copylot installationID]
    ] success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

@end
