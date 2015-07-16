//
//  ViewController.m
//  CoPylot-Example
//
//  Created by Brian Vallelunga on 7/14/15.
//  Copyright (c) 2015 Brian Vallelunga. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPLabel.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CPLabel *label = [[CPLabel alloc] initWithTitle:@"test"];
    label.variables = @{
        @"user name": @"Chris"
    };
    
    label.text = @"Start Test String!";
    label.frame = CGRectMake(0, 40, self.view.frame.size.width, 400);
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [label.font fontWithSize:35];
    [self.view addSubview:label];
    
    CPLabel *label2 = [[CPLabel alloc] initWithTitle:@"login label"];
    label2.text = @"Bob";
    label2.variables = @{ @"price": @123 };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
