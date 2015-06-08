//
//  UserEntity.h
//  RTLibrary-ios
//
//  Created by Ryan on 14-8-3.
//  Copyright (c) 2014年 zlycare. All rights reserved.
//

#import "BaseEntity.h"

@interface UserEntity : BaseEntity
@property(copy,nonatomic) NSString *loginId;  //帐号
@property(copy,nonatomic) NSString *loginPassword; //密码

/**
 *  UserEntity 构造方法
 *
 *  @param loginId
 *  @param password
 *
 *  @return
 */
+(UserEntity *) initWithLoginId:(NSString *) loginId andPassword:(NSString * ) password;

@end
