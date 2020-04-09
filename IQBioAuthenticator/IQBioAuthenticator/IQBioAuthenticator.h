//
//  IQBioAuthenticator.h
//  IQBioAuthenticator
//
//  Created by nanli on 2020/4/9.
//  Copyright © 2020 darchain. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IQBioErrors.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^AuthenticationSuccess)(void);
typedef void (^AuthenticationFailure)(IQAuthErrors error);

@interface IQBioAuthenticator : NSObject

+ (instancetype)share;

- (BOOL)isBiometricAuthenticationAvailable;

- (BOOL)isFaceIDAvailable;

- (void)authenticateUserWithBiometrics:(NSString *)reason success:(AuthenticationSuccess)successBlock failure:(AuthenticationFailure)failureBlock;

- (void)authenticateUserWithPasscode:(NSString *)reason success:(AuthenticationSuccess)successBlock failure:(AuthenticationFailure)failureBlock;

@end

NS_ASSUME_NONNULL_END
