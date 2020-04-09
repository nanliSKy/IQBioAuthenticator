//
//  IQBioErrors.m
//  IQBioAuthenticator
//
//  Created by nanli on 2020/4/9.
//  Copyright © 2020 darchain. All rights reserved.
//

#import "IQBioErrors.h"

@implementation IQBioErrors

- (IQAuthErrors)errorType:(LAError)error {
    switch (error) {
        case kLAErrorAuthenticationFailed:
            return failed;
            
        case kLAErrorUserCancel:
            return userCancel;
            
        case kLAErrorUserFallback:
            return userFallback;
            
        case kLAErrorSystemCancel:
            return systemCancel;
            
        case kLAErrorPasscodeNotSet:
            return passcodeNotSet;
            
        case kLAErrorBiometryNotEnrolled:
            return biometryNotEnrolled;
            
        case kLAErrorBiometryLockout:
            return biometryLockedout;
            
        case kLAErrorAppCancel:
            return appCancel;
            
        case kLAErrorInvalidContext:
            return invalidContext;
            
        case kLAErrorBiometryNotAvailable:
            return biometryNotAvailable;
            
        default:
            return other;
    }
}

- (NSString *)getMessage {
    switch (self.error) {
        case appCancel:
            return @"Authentication was cancelled by application.";
            
        case failed:
            return @"The user failed to provide valid credentials.";
        
        case invalidContext:
            return @"The context is invalid.";
        
        case userFallback:
            return @"The user chose to use the fallback.";
        
        case userCancel:
            return @"The user did cancel.";
        
        case passcodeNotSet:
            return @"Passcode is not set on the device.";
        
        case systemCancel:
            return @"Authentication was cancelled by the system.";
        
        case biometryNotEnrolled:
            return @"Biometric is not enrolled on the device.";
        
        case biometryLockedout:
            return @"Too many failed attempts.";
            
        case biometryNotAvailable:
            return @"Biometric is not available on the device.";
            
        case other:
            return @"Did not find error code on LAError object.";
   
    }
}

@end
