//
//  ViewController.m
//  CoPylot-Example
//
//  Created by Brian Vallelunga on 7/14/15.
//  Copyright (c) 2015 Brian Vallelunga. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoPylot/CoPylot.h>
#import "CPViewController.h"

@interface CPViewController ()

@property (weak, nonatomic) IBOutlet CPButton *button;
@property (weak, nonatomic) IBOutlet CPButton *marksButton;

@end

@implementation CPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    CPLabel *label = [[CPLabel alloc] initWithTitle:@"welcome"];
    
    [label setVariables:@{
                         @"Referrer's Name": @"Chris"
                         }];
    
    label.text = @"Start Test String!";
    label.frame = CGRectMake(0, 40, self.view.frame.size.width, 250);
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [label.font fontWithSize:35];
    [self.view addSubview:label];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
