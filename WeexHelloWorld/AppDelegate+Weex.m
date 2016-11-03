//
//  AppDelegate+Weex.m
//  WeexHelloWorld
//
//  Created by Dongdong on 16/11/2.
//  Copyright © 2016年 com. All rights reserved.
//

#import "AppDelegate+Weex.h"

#import <WeexSDK/WXSDKEngine.h>
#import <WeexSDK/WXSDKManager.h>
#import <WeexSDK/WXAppConfiguration.h>
#import <WeexSDK/WXLog.h>
#import "WXEventModule.h"
#import "WXImageDownloader.h"

@implementation AppDelegate (Weex)

- (void)initWeexSDK
{
    [WXAppConfiguration setAppGroup:@"AliApp"];
    [WXAppConfiguration setAppName:@"WeexHelloWorld"];
    [WXAppConfiguration setAppVersion:@"1.0.0"];
    
    [WXSDKEngine registerHandler:[WXImageDownloader new] withProtocol:@protocol(WXImgLoaderProtocol)];
    [WXSDKEngine registerModule:@"event" withClass:[WXEventModule class]];
    //init sdk enviroment
    [WXSDKEngine initSDKEnviroment];
    
    [WXLog setLogLevel: WXLogLevelAll];
}

@end
