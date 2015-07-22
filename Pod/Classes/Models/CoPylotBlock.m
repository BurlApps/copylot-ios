//
//  CPBlock.m
//  CoPylot-Example
//
//  Created by Brian Vallelunga on 7/15/15.
//  Copyright (c) 2015 Brian Vallelunga. All rights reserved.
//

#import "CoPylotBlockSegment.h"
#import "CoPylotBlock.h"

@implementation CoPylotBlock

- (instancetype)initWithPayload:(id)payload {
    if (self = [self init]) {
        self.ID = payload[@"id"];
        self.slug = payload[@"slug"];
        self.variables = payload[@"variables"];
        self.segments = [NSMutableArray array];
        
        for(id segment in payload[@"segments"]) {
            [self.segments addObject: [[CoPylotBlockSegment alloc] initWithPayload:segment]];
        }
    }
    
    return self;
}

@end
