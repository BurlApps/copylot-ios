//
//  CoPylotBlockSegment.h
//  CoPylot-Example
//
//  Created by Brian Vallelunga on 7/15/15.
//  Copyright (c) 2015 Brian Vallelunga. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CoPylotBlockSegment;
@interface CoPylotBlockSegment : NSObject

- (instancetype)initWithPayload:(id)payload;

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *variable;
@property (nonatomic, strong) NSDictionary *attributes;

@end
