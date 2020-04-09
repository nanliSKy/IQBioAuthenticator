//
//  IQBioAuthenticator.m
//  IQBioAuthenticator
//
//  Created by nanli on 2020/4/9.
//  Copyright © 2020 darchain. All rights reserved.
//

#import "IQBioAuthenticator.h"

#import <LocalAuthentication/LocalAuthentication.h>



@implementation IQBioAuthenticator

+ (instancetype)share {
    static dispatch_once_t onceToken;
    static IQBioAuthenticator *_bioAuthenticator = nil;
    dispatch_once(&onceToken, ^{
        _bioAuthenticator = [[IQBioAuthenticator alloc] init];
    });
    return _bioAuthenticator;
}

- (BOOL)isBiometricAuthenticationAvailable {
    NSError *error = nil;
    LAContext *context = [[LAContext alloc] init];
    
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
        return error == nil;
    }
    
    return NO;
}

- (BOOL)isFaceIDAvailable {
    if (@available(iOS 11.0, *)) {
        LAContext *context = [[LAContext alloc] init];
        return context.biometryType == LABiometryTypeFaceID;
    }
    return NO;
}

- (void)authenticateUserWithBiometrics:(NSString *)reason success:(AuthenticationSuccess)successBlock failure:(AuthenticationFailure)failureBlock {
    if (!reason || [reason isEqualToString:@""]) {
        reason = @"Authentication is needed to access your app.";
    }
    LAContext *context = [[LAContext alloc] init];
    
    context.localizedFallbackTitle = @"";
    [self evaluate:LAPolicyDeviceOwnerAuthenticationWithBiometrics context:context reason:reason success:successBlock failure:failureBlock];
}

- (void)authenticateUserWithPasscode:(NSString *)reason success:(AuthenticationSuccess)successBlock failure:(AuthenticationFailure)failureBlock {
    if (!reason || [reason isEqualToString:@""]) {
        reason = @"Too many failed attempts.";
    }
    LAContext *context = [[LAContext alloc] init];
    [self evaluate:LAPolicyDeviceOwnerAuthentication context:context reason:reason success:successBlock failure:failureBlock];
}

- (void)evaluate:(LAPolicy)policy context:(LAContext *)context reason:(NSString *)reason success:(AuthenticationSuccess)successBlock failure:(AuthenticationFailure)failureBlock {
    
    [context evaluatePolicy:policy localizedReason:reason reply:^(BOOL success, NSError * _Nullable error) {
        if (success) {
            successBlock();
        }else {
            IQBioErrors *bioErrors = [[IQBioErrors alloc] init];
            bioErrors.error = [bioErrors errorType:error.code];
            NSLog(@"failure:%@", bioErrors.getMessage);
            failureBlock(bioErrors.error);
        }
    }];
}

@end


