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
    CPLabel *label = [[CPLabel alloc] initWithName:@"test"];
    label.text = @"Start Test String!";
    label.frame = self.view.frame;
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
