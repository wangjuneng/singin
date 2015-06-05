//
//  LoginViewController.m
//  signin
//
//  Created by apple on 15/6/4.
//  Copyright (c) 2015年 gense. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *loginId;

@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _loginId.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(void) textFieldDidBeginEditing:(UITextField *)textField
{
    [textField becomeFirstResponder];
}



@end
