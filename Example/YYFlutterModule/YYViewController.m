//
//  YYViewController.m
//  YYFlutterModule
//
//  Created by 673697831 on 03/19/2019.
//  Copyright (c) 2019 673697831. All rights reserved.
//

#import "YYViewController.h"
#import "YYModel.h"
#import <Flutter/Flutter.h>

@interface YYViewController ()<FlutterStreamHandler>

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
    
    NSString *channelName = @"com.pages.your/native_post";
    
    FlutterEventChannel *evenChannal = [FlutterEventChannel eventChannelWithName:channelName binaryMessenger:flutterViewController];
    // 代理FlutterStreamHandler
    [evenChannal setStreamHandler:self];
    
    [self presentViewController:flutterViewController animated:YES completion:nil];
}

#pragma mark - <FlutterStreamHandler>
// // 这个onListen是Flutter端开始监听这个channel时的回调，第二个参数 EventSink是用来传数据的载体。
- (FlutterError* _Nullable)onListenWithArguments:(id _Nullable)arguments
                                       eventSink:(FlutterEventSink)events {
    // arguments flutter给native的参数
    // 回调给flutter， 建议使用实例指向，因为该block可以使用多次
    if (events) {
        NSMutableDictionary * params = [NSMutableDictionary dictionaryWithCapacity:0];
        [params setValue:@"1_1" forKey:@"first"];
        [params setValue:@"1_2" forKey:@"second"];
        events([params yy_modelToJSONString]);
        
        params = [NSMutableDictionary dictionaryWithCapacity:0];
        [params setValue:@"2_1" forKey:@"first"];
        [params setValue:@"2_2" forKey:@"second"];
        events([params yy_modelToJSONString]);
        
        params = [NSMutableDictionary dictionaryWithCapacity:0];
        [params setValue:@"3_1" forKey:@"first"];
        [params setValue:@"3_2" forKey:@"second"];
        events([params yy_modelToJSONString]);
        
        params = [NSMutableDictionary dictionaryWithCapacity:0];
        [params setValue:@"4_1" forKey:@"first"];
        [params setValue:@"4_2" forKey:@"second"];
        events([params yy_modelToJSONString]);
        
        params = [NSMutableDictionary dictionaryWithCapacity:0];
        [params setValue:@"5_1" forKey:@"first"];
        [params setValue:@"5_2" forKey:@"second"];
        events([params yy_modelToJSONString]);
        
        params = [NSMutableDictionary dictionaryWithCapacity:0];
        [params setValue:@"6_1" forKey:@"first"];
        [params setValue:@"6_2" forKey:@"second"];
        events([params yy_modelToJSONString]);
    }
    return nil;
}

/// flutter不再接收
- (FlutterError* _Nullable)onCancelWithArguments:(id _Nullable)arguments {
    // arguments flutter给native的参数
    NSLog(@"%@", arguments);
    return nil;
}

@end
