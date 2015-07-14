//
//  CPBlock.h
//  Pods
//
//  Created by Brian Vallelunga on 7/14/15.
//
//

#import <Foundation/Foundation.h>

@class CPBlock;
@protocol CPBlockDelegate;

@interface CPBlock : NSObject

@property (nonatomic, assign) id delegate;

- (void)newPayload:(id)payload;

@end

@protocol CPBlockDelegate <NSObject>
- (void)blockUpdated:(NSString *)text;
@end