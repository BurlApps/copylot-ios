//
//  CoPylotBlockSegment.m
//  CoPylot-Example
//
//  Created by Brian Vallelunga on 7/15/15.
//  Copyright (c) 2015 Brian Vallelunga. All rights reserved.
//

#import "CoPylotBlockSegment.h"

@implementation CoPylotBlockSegment

- (instancetype)initWithPayload:(id)payload {
    if (self = [self init]) {
        self.text = payload[@"text"];
        self.type = payload[@"type"];
        self.variable = payload[@"variable"];
        self.source = payload[@"source"];
        self.attributes = payload[@"attributes"];
    }
    
    return self;
}

@end
