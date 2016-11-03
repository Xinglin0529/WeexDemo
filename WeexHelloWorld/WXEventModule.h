//
//  WXEventModule.h
//  WeexHelloWorld
//
//  Created by Dongdong on 16/11/3.
//  Copyright © 2016年 com. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <WeexSDK/WXEventModuleProtocol.h>
#import <WeexSDK/WXModuleProtocol.h>

@interface WXEventModule : NSObject <WXEventModuleProtocol, WXModuleProtocol>

@end
