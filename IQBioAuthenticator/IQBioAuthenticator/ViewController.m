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
    [IQBioAuthenticator.share isFaceIDAvailable];
//
    [IQBioAuthenticator.share authenticateUserWithBiometrics:@"verify biometrices" success:^{
        NSLog(@"success");
    } failure:^(IQAuthErrors error) {

        NSLog(@"%i", error);
    }];
    
//    [IQBioAuthenticator.share authenticateUserWithPasscode:@"biometrices or passCode" success:^{
//         NSLog(@"success");
//    } failure:^(IQAuthErrors error) {
//        NSLog(@"%i", error);
//    }];
}

@end
