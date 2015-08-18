//
//  TableViewController.m
//  CoPylot-Example
//
//  Created by Brian Vallelunga on 7/21/15.
//  Copyright (c) 2015 Brian Vallelunga. All rights reserved.
//

#import <CoPylot/CoPylot.h>

#import "CPTableViewController.h"

@implementation CPTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //
    self.navigationController.navigationBarHidden = NO;

    self.data = @[
                  @"Brian", @"Nelson", @"Mark",
                  @"Bob", @"Jen", @"Tom", @"Mara",
                  @"Diana", @"Bob's Friend"
                  ];
    
    // Register Class for Cell Reuse Identifier
    [self.tableView registerClass:[CPTableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.data count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CPTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    [cell setBlockTitle: @"friend cell"];
    
    NSString *friend = [self.data objectAtIndex:indexPath.row];
    cell.textLabel.text = friend;
    
    cell.variables = @{
        @"friend": friend
    };
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *message = [CPString createWithTitle: @"popup" andVariables: @{
        @"friend": [self.data objectAtIndex:indexPath.row]
    } withDefault: @"hellow world"];
    
    [[[UIAlertView alloc] initWithTitle: @"Test Message" message:message
                               delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil] show];
    
    [tableView deselectRowAtIndexPath:indexPath animated:true];
}


@end
