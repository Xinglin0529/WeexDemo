//
//  ViewController.m
//  HelloWeex
//
//  Created by xvxinglin on 16/9/25.
//  Copyright © 2016年 xvxinglin. All rights reserved.
//

#import "ViewController.h"
#import <WeexSDK/WXSDKInstance.h>
#import "HeaderDefine.h"

@interface ViewController ()

@property (nonatomic, strong) WXSDKInstance *instance;
@property (nonatomic, strong) UIView *weexView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    if (!self.url) {
        self.url = HOME_URL;
    }
    
    if (!self.url) {
        return;
    }
    
    NSURL *URL = [NSURL URLWithString:self.url];
    
    [_instance destroyInstance];
    _instance = [[WXSDKInstance alloc] init];
    _instance.viewController = self;
    _instance.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64);
    
    __weak typeof(self) weakself = self;
    _instance.onCreate = ^(UIView *view) {
        view.backgroundColor = [UIColor whiteColor];
        [weakself.weexView removeFromSuperview];
        weakself.weexView = view;
        [weakself.view addSubview:weakself.weexView];
    };
    
    _instance.onFailed = ^(NSError *error) {
        
    };
    _instance.updateFinish = ^(UIView *view){
        
    };
    NSString *randomURL = [NSString stringWithFormat:@"%@?random=%d",URL.absoluteString,arc4random()];
    [_instance renderWithURL:[NSURL URLWithString:randomURL] options:@{@"bundleUrl":URL.absoluteString} data:nil];
}

- (void)dealloc
{
    [_instance destroyInstance];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
