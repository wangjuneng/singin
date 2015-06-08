//
//  BaseHandler.h
//  firefly
//  BaseHandler : Every subclass handler should extends
//  Created by J.Wang on 14-6-25.
//  Copyright (c) 2014年 gense. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APIConfig.h"

/**
 *  Handler处理完成后调用的Block
 */
typedef void (^CompleteBlock)();

/**
 *  Handler处理成功时调用的Block
 */
typedef void (^SuccessBlock)(id obj);

/**
 *  Handler处理失败时调用的Block
 */
typedef void (^FailedBlock)(id obj);

@interface BaseHandler : NSObject

/**
 *  获取请求URL
 *
 *  @param path
 *  @return 拼装好的URL
 */
+ (NSString *)requestUrlWithPath:(NSString *)path;

@end
