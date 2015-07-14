//
//  CPBlock.h
//  Pods
//
//  Created by Brian Vallelunga on 7/14/15.
//
//

#import <Foundation/Foundation.h>

@protocol CPBlockDelegate;

@interface CPBlock : NSObject

@end

@protocol CPBlockDelegate <NSObject>
- (void)blockUpdated;
@end