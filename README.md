# IQBioAuthenticator
支持 touchID/FaceID 

## Usage

### Check biometric authentication is available or not.

```objective-c
[IQBioAuthenticator.share isBiometricAuthenticationAvailable];
```

### Check faceID authentication is available or not.

```objective-c
[IQBioAuthenticator.share isFaceIDAvailable];
```

### Authentication using bioMetric.

```objective-c
[IQBioAuthenticator.share authenticateUserWithBiometrics:@"verify biometrices" success:^{
        NSLog(@"success");
    } failure:^(IQAuthErrors error) {

        NSLog(@"%i", error);
 }];
```

### Authentication using  bioMetric or passcode.

```objective-c
[IQBioAuthenticator.share authenticateUserWithPasscode:@"biometrices or passCode" 		   success:^{
         NSLog(@"success");
    } failure:^(IQAuthErrors error) {
        NSLog(@"%i", error);
 }];
```

