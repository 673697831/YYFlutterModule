//
//  YYViewController.m
//  YYFlutterModule
//
//  Created by 673697831 on 03/19/2019.
//  Copyright (c) 2019 673697831. All rights reserved.
//

#import "YYViewController.h"
#import <Flutter/Flutter.h>

@interface YYViewController ()

@end

@implementation YYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor lightGrayColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(handleButtonAction)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Press me" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor blueColor]];
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    [self.view addSubview:button];
}

- (void)handleButtonAction {
    FlutterViewController *flutterViewController = [[FlutterViewController alloc] init];
    flutterViewController.view.backgroundColor = [UIColor cyanColor];
    [flutterViewController setInitialRoute:@"route1"];
    [self presentViewController:flutterViewController animated:YES completion:nil];
}

@end
