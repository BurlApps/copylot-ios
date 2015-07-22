//
//  CPBlock.h
//  CoPylot-Example
//
//  Created by Brian Vallelunga on 7/15/15.
//  Copyright (c) 2015 Brian Vallelunga. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CoPylotBlock;
@interface CoPylotBlock : NSObject

- (instancetype)initWithPayload:(id)payload;

@property (nonatomic, strong) NSString *ID;
@property (nonatomic, strong) NSString *slug;
@property (nonatomic, strong) NSDictionary *variables;
@property (nonatomic, strong) NSMutableArray *segments;

@end
