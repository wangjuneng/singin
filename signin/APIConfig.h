//
//  APIConfig.h
//  ZLYDoc
//  API信息
//  Created by Ryan on 14-4-14.
//  Copyright (c) 2014年 ZLY. All rights reserved.
//

#import <Foundation/Foundation.h>
/***************SERVER HOST***************/

#define SERVER_HOST @"192.168.1.101:8080/"
#define SERVER_NAME @"signin/app/"

/***************SERVER API***************/
//登录
#define API_LOGIN @"appv1!checkUser.json"

@interface APIConfig : NSObject

@end