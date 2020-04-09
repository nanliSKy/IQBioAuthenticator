//
//  IQBioErrors.h
//  IQBioAuthenticator
//
//  Created by nanli on 2020/4/9.
//  Copyright © 2020 darchain. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <LocalAuthentication/LocalAuthentication.h>

typedef NS_ENUM(NSInteger, IQAuthErrors) {
    appCancel,
    failed,
    userCancel,
    userFallback,
    systemCancel,
    passcodeNotSet,
    biometryNotEnrolled,
    biometryLockedout,
    invalidContext,
    biometryNotAvailable,
    other
};
NS_ASSUME_NONNULL_BEGIN

@interface IQBioErrors : NSObject

/** */
@property (nonatomic, assign) IQAuthErrors error;

- (IQAuthErrors)errorType:(LAError)error;

- (NSString *)getMessage;

@end

NS_ASSUME_NONNULL_END
