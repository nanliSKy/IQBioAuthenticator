//
//  ViewController.m
//  IQBioAuthenticator
//
//  Created by nanli on 2020/4/9.
//  Copyright © 2020 darchain. All rights reserved.
//

#import "ViewController.h"

#import "IQBioAuthenticator.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)bioAuthenticator:(UIButton *)sender {
    
//   BOOL result = [IQBioAuthenticator.share isBiometricAuthenticationAvailable];
//
    [IQBioAuthenticator.share authenticateUserWithBiometrics:@"验证生物特征" success:^{
        NSLog(@"success");
    } failure:^(IQAuthErrors error) {

        NSLog(@"%i", error);
    }];
    
//    [IQBioAuthenticator.share authenticateUserWithPasscode:@"生物特征+密码" success:^{
//         NSLog(@"success");
//    } failure:^(IQAuthErrors error) {
//        NSLog(@"%i", error);
//    }];
}

@end
