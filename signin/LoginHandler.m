//
//  LoginHandler.m
//  RTLibrary-ios
//
//  Created by Ryan on 14-8-3.
//  Copyright (c) 2014年 zlycare. All rights reserved.
//

#import "LoginHandler.h"
#import "RTHttpClient.h"
#import "UserEntity.h"


@implementation LoginHandler

#pragma mark 用户登录
 -(void) executeLoginTaskWithUser:(id)parameters success:(SuccessBlock)success failed:(FailedBlock)failed
{
    
    [[RTHttpClient defaultClient]requestWithPath: [LoginHandler requestUrlWithPath:API_LOGIN] method:RTHttpRequestPost parameters:parameters prepareExecute:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        success([UserEntity parseResponseStatusJSON:[responseObject objectForKey:@"frf_resultModel"]]);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failed(error);
    }];
    
    
}


@end
