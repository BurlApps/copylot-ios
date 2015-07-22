//
//  CPPayload.m
//  CoPylot-Example
//
//  Created by Brian Vallelunga on 7/15/15.
//  Copyright (c) 2015 Brian Vallelunga. All rights reserved.
//

#import "CoPylotBlock.h"
#import "CoPyotPayload.h"

@implementation CoPyotPayload

- (instancetype)initWithPayload:(id)payload {
    if (self = [self init]) {
        self.json = payload;
        self.version = payload[@"version"];
        self.variables = payload[@"variables"];
        self.blocks = [NSMutableDictionary dictionary];
        
        id jsonBlocks = payload[@"blocks"];
        
        for(NSString *slug in jsonBlocks) {
            self.blocks[slug] = [[CoPylotBlock alloc] initWithPayload:jsonBlocks[slug]];
        }
    }
    
    return self;
}

@end
