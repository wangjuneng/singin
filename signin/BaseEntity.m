//
//  BaseEntity.m
//  ZLYDoc
//
//  Created by Ryan on 14-4-3.
//  Copyright (c) 2014年 ZLY. All rights reserved.
//

#import "BaseEntity.h"

static NSString * const MSG = @"message";
static NSString * const SUCCESS = @"success";
static NSString * const RES = @"res";

@implementation BaseEntity

+(BaseEntity* )parseResponseErrorJSON:(id)json
{
    NSString *responseJSON = [NSString stringWithFormat:@"%@",json];
    DLog(@"%@",responseJSON);
    if ([NSJSONSerialization isValidJSONObject:json]) {
        BaseEntity *baseEntity = [[BaseEntity alloc] init];
        baseEntity.success =  [[json objectForKey:SUCCESS] boolValue] ;
        baseEntity.msg = [json objectForKey:MSG];
        return baseEntity;
    }
    return nil;
}

+ (BaseEntity *)parseResponseStatusJSON:(id)json
{
    
    //格式化打印输出至控制台
    DLog(@"%@",json);
    
    if ([NSJSONSerialization isValidJSONObject:json]) {
        
        BaseEntity *baseEntity = [[BaseEntity alloc] init];
        baseEntity.success =  [[json objectForKey:SUCCESS] boolValue] ;
        baseEntity.msg = [json objectForKey:MSG];
        return baseEntity;
    }
    return nil;
}

+(BaseEntity *)parseResponseUpdateJSON:(id)dic_json
{
    //格式化打印输出至控制台
    DLog(@"%@",dic_json);
    
    if ([NSJSONSerialization isValidJSONObject:dic_json]) {
        BaseEntity *baseEntity = [[BaseEntity alloc] init];
        baseEntity.success =  [[dic_json objectForKey:SUCCESS] boolValue] ;
        id res = [dic_json objectForKey:RES];
        baseEntity.version = [res objectForKey:@"versionName"];
        baseEntity.updateURL = [res objectForKey:@"updateURL"];
        return baseEntity;
    }
    return nil;
}

@end
