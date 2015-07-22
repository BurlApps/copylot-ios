//
//  CPBlock.h
//  Pods
//
//  Created by Brian Vallelunga on 7/14/15.
//
//

#import <Foundation/Foundation.h>

#import "CPCore.h"
#import "CoPylotBlock.h"

@class CoPylot, CPBlock, CPBlockDelegate;
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
- (void)setBlockTitle:(NSString *)title;
- (NSString *)buildText:(NSDictionary *)variables;
- (NSAttributedString *)buildAttrText:(NSAttributedString *)originalText withVariables:(NSDictionary *)variables;

@end

@protocol CPBlockDelegate <NSObject>

- (void)wasUpdated;
- (void)blockDataWithHandler:(void(^)(NSString *text, NSDictionary *variables))handler;

@end
