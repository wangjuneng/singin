//
//  LoginViewController.m
//  signin
//
//  Created by apple on 15/6/4.
//  Copyright (c) 2015年 gense. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginHandler.h"
#import "UserEntity.h"
#import "MainViewController.h"

@interface LoginViewController()

//服务请求
@property(strong,nonatomic) LoginHandler * loginHandler;


@end

@implementation LoginViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    //首页面不显示导航栏
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    //初始化服务请求
    _loginHandler = [[LoginHandler alloc] init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma  mark 事件处理
#pragma mark 点击背景 隐藏键盘
- (IBAction)mainViewAction:(id)sender {
    // 发送resignFirstResponder.
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

#pragma mark 登录按钮事件
- (IBAction)loginBtnAction:(UIButton *)sender {
    
    [self checkLogin];
}

#pragma mark 帐号输入完成
- (IBAction)loginId_didEndOnExit:(id)sender {
    [_password becomeFirstResponder];
}

#pragma mark 密码输入完成
- (IBAction)password_didEndOnExit:(id)sender {
    
    [self checkLogin];
}

#pragma mark 登录
-(void) checkLogin{
    //帐号和密码输入验证
    
    NSString * loginIdTxt = [_loginId text];
    
    if([loginIdTxt isEqualToString: @""])
    {
        [AppUtils showAlertMessage:@"请输入帐号"];
        
        return;
    }
    
    NSString * passwordTxt = [_password text];
    
    if([passwordTxt isEqualToString: @""])
    {
        [AppUtils showAlertMessage:@"请输入密码"];
        
        return;
    }
    
    NSString * passwordMd5Txt = [AppUtils md5FromString:passwordTxt];
    
    [AppUtils showProgressMessageWithGradient: @"数据加载中..."];
    
    //手机唯一标识
    NSString * imei = [OpenUDID value];
    
    //生成签名
    NSString * sign = [AppUtils createSignString:@[loginIdTxt,passwordMd5Txt,imei]];
    
    
    NSDictionary *parameters = @{@"loginId":loginIdTxt,@"loginPassword":passwordMd5Txt,@"sign":sign,@"imei":imei};
    
    [_loginHandler executeLoginTaskWithUser: parameters success:^(UserEntity * obj) {
   
        //验证成功
        if([obj success])
        {
            [AppUtils dismissHUD];
            //跳转至主页面
            MainViewController * mainViewController = [MainViewController newInstance];
            [self.navigationController pushViewController:mainViewController animated:YES];
        }
        else
        {
            [AppUtils dismissHUD];
            [AppUtils showAlertMessage:[obj msg]];
        }
        
    } failed:^(id obj) {
        [AppUtils dismissHUD];
    }];
   
    
}
@end
