//
//  UserEntity.m
//  RTLibrary-ios
//
//  Created by Ryan on 14-8-3.
//  Copyright (c) 2014年 zlycare. All rights reserved.
//

#import "UserEntity.h"

@implementation UserEntity

+(UserEntity *) initWithLoginId:(NSString *)loginId andPassword:(NSString *)password
{
    UserEntity * userEntity = [[UserEntity alloc] init];
    userEntity.loginId= loginId;
    userEntity.loginPassword = password;
    return userEntity;
}
@end
