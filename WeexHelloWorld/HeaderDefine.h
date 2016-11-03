//
//  HeaderDefine.h
//  WeexHelloWorld
//
//  Created by Dongdong on 16/11/3.
//  Copyright © 2016年 com. All rights reserved.
//

#ifndef HeaderDefine_h
#define HeaderDefine_h


#define CURRENT_IP @"172.18.16.163"

#if TARGET_IPHONE_SIMULATOR
#define DEMO_HOST @"127.0.0.1"
#else
#define DEMO_HOST CURRENT_IP
#endif

#define DEMO_URL(path) [NSString stringWithFormat:@"http://%@:12580/%s", DEMO_HOST, #path]

#define HOME_URL [NSString stringWithFormat:@"http://%@:12580/examples/build/main.js", DEMO_HOST]

#define BUNDLE_URL [NSString stringWithFormat:@"file://%@/bundlejs/index.js",[NSBundle mainBundle].bundlePath]

#define UITEST_HOME_URL @"http://test?_wx_tpl=http://localhost:12580/test/build/TC__Home.js"


#endif /* HeaderDefine_h */
