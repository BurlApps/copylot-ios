//
//  CPPayload.h
//  CoPylot-Example
//
//  Created by Brian Vallelunga on 7/15/15.
//  Copyright (c) 2015 Brian Vallelunga. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CoPyotPayload;
@interface CoPyotPayload : NSObject

- (instancetype)initWithPayload:(id)payload;

@property (nonatomic, assign) id json;
@property (nonatomic, strong) NSString *version;
@property (nonatomic, strong) NSMutableDictionary *blocks;
@property (nonatomic, strong) NSMutableDictionary *variables;

@end
