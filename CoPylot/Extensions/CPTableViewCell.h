//
//  CPTableViewCell.h
//  CoPylot-Example
//
//  Created by Brian Vallelunga on 7/20/15.
//  Copyright (c) 2015 Brian Vallelunga. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPBlock.h"

@class CPTableViewCell;
@interface CPTableViewCell : UITableViewCell  <CPBlockDelegate>

@property (nonatomic, strong) NSDictionary *variables;

- (instancetype)init;
- (instancetype)initWithFrame:(CGRect)frame;
- (instancetype)initWithCoder:(NSCoder *)aDecoder;
- (instancetype)initWithTitle:(NSString *)title;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
- (void)setBlockTitle:(NSString *)title;

@end
