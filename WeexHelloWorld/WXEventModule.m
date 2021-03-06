//
//  WXEventModule.m
//  WeexHelloWorld
//
//  Created by Dongdong on 16/11/3.
//  Copyright © 2016年 com. All rights reserved.
//

#import "WXEventModule.h"
#import <WeexSDK/WXBaseViewController.h>
#import "ViewController.h"

@implementation WXEventModule

@synthesize weexInstance;

WX_EXPORT_METHOD(@selector(openURL:))

- (void)openURL:(NSString *)url {
    NSString *newURL = url;
    
    //注意。真机和模拟器的目录结构不同，所以替换的字符串就不同，这里自己简单的进行替换
    newURL = [newURL stringByReplacingOccurrencesOfString:@"//Users/examples/build/" withString:@"/bundlejs/"]; //模拟器的目录结果
    // newURL = [newURL stringByReplacingOccurrencesOfString:@"//var/examples/build/" withString:@"/bundlejs/"]; //真机的目录结构
    
    newURL = [[[NSBundle mainBundle] bundlePath] stringByAppendingString:newURL];
    UIViewController *controller = [[ViewController alloc] init];
    ((ViewController *)controller).url = newURL;
    [weexInstance.viewController.navigationController pushViewController:controller animated:YES];
}

@end
