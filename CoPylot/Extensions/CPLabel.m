//
//  CPLabel.m
//  Pods
//
//  Created by Brian Vallelunga on 7/14/15.
//
//

#import "CoPylot.h"
#import "CPLabel.h"

@implementation CPLabel

- (instancetype)initWithName:(NSString *)title {
    self = [super init];
    if (self) {
        CoPylot *copylot = [CoPylot sharedInstance];
        CPBlock *block = [[CPBlock alloc] init];
        
        block.delegate = self;
        copylot.blocks[title] = block;
    }
    return self;
}

- (void)blockUpdated:(NSString *)text {
    self.text = text;
}

@end
