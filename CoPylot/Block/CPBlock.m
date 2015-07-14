
//
//  CPBlock.m
//  Pods
//
//  Created by Brian Vallelunga on 7/14/15.
//
//

#import "CPBlock.h"

@implementation CPBlock

- (void)newPayload:(id)payload {
    [self.delegate blockUpdated:payload[0][@"text"]];
}

@end
