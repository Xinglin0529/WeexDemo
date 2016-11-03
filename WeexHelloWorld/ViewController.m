//
//  ViewController.m
//  HelloWeex
//
//  Created by xvxinglin on 16/9/25.
//  Copyright © 2016年 xvxinglin. All rights reserved.
//

#import "ViewController.h"
#import <WeexSDK/WXSDKInstance.h>

@interface ViewController ()

@property (nonatomic, strong) WXSDKInstance *instance;
@property (nonatomic, strong) UIView *weexView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    if (!self.url) {
        self.url = [NSURL URLWithString:@"http://localhost:8081/main.js"];
    }
    
    if (!self.url) {
        return;
    }
    
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
    [_instance renderWithURL:self.url options:@{@"bundleUrl":self.url.absoluteString} data:nil];
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
