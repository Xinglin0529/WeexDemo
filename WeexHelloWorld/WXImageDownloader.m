//
//  WXImageDownloader.m
//  HelloWeex
//
//  Created by xvxinglin on 16/9/25.
//  Copyright © 2016年 xvxinglin. All rights reserved.
//

#import "WXImageDownloader.h"
#import "SDWebImageManager.h"

@implementation WXImageDownloader

- (id<WXImageOperationProtocol>)downloadImageWithURL:(NSString *)url imageFrame:(CGRect)imageFrame userInfo:(NSDictionary *)options completed:(void (^)(UIImage *, NSError *, BOOL))completedBlock
{
    return (id<WXImageOperationProtocol>)[[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:url] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        if (completedBlock) {
            completedBlock(image, error, finished);
        }
    }];
}

@end
