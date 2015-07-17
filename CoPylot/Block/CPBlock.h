//
//  CPBlock.h
//  Pods
//
//  Created by Brian Vallelunga on 7/14/15.
//
//

#import <Foundation/Foundation.h>

#import "CoPylot.h"
#import "CoPylotBlock.h"

@class CoPylot, CPBlock;
@protocol CPBlockDelegate;

@interface CPBlock : NSObject

@property (nonatomic, assign) CoPylot *copylot;
@property (nonatomic, strong) id delegate;
@property (nonatomic, strong) NSString *slug;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) CoPylotBlock *data;

- (instancetype)init;
- (void)newPayload:(CoPylotBlock *)block;
- (void)registerBlock;
- (void)hasNewVariables;
- (NSString *)buildText:(NSDictionary *)variables;
- (NSAttributedString *)buildAttrText:(NSDictionary *)variables;

@end

@protocol CPBlockDelegate <NSObject>

- (void)wasUpdated;
- (void)blockDataWithHandler:(void(^)(NSString *text, NSDictionary *variables))handler;

@end
