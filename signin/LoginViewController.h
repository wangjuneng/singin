//
//  LoginViewController.h
//  signin
//
//  Created by apple on 15/6/4.
//  Copyright (c) 2015年 gense. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "OpenUDID.h"

@interface LoginViewController : BaseViewController

#pragma mark 属性定义
//帐号
@property (weak, nonatomic) IBOutlet UITextField *loginId;
//密码
@property (weak, nonatomic) IBOutlet UITextField *password;

#pragma mark 事件定义
- (IBAction)mainViewAction:(id)sender;

- (IBAction)loginBtnAction:(UIButton *)sender;

- (IBAction)loginId_didEndOnExit:(id)sender;

- (IBAction)password_didEndOnExit:(id)sender;

@end
