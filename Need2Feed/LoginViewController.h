//
//  LoginViewController.h
//  Need2Feed
//
//  Created by Peter Bayiokos on 1/28/16.
//  Copyright © 2016 Pace University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <TwitterKit/TwitterKit.h>


@interface LoginViewController : UIViewController <UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UITextField *phoneNumber;

@property (strong, nonatomic) IBOutlet UIButton *login;

@property (strong, nonatomic) IBOutlet UIButton *createaccount;

@property (strong, nonatomic) IBOutlet FBSDKLoginButton *loginButton;

@property (strong, nonatomic) IBOutlet TWTRLogInButton *logInButton;

- (IBAction)login:(id)sender;




@end
