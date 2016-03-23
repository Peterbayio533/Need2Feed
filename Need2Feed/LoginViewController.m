//
//  LoginViewController.m
//  Need2Feed
//
//  Created by Peter Bayiokos on 1/28/16.
//  Copyright © 2016 Pace University. All rights reserved.
//

#import "LoginViewController.h"
#import "SBJson.h"
#import "AppDelegate.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <QuartzCore/QuartzCore.h>
#import <TwitterKit/TwitterKit.h>

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize phoneNumber;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Facebook Login
    UIButton *myLoginButton=[UIButton buttonWithType:UIButtonTypeCustom];
    myLoginButton.backgroundColor=[UIColor blueColor];
    myLoginButton.frame=CGRectMake(0,0,180,40);
    myLoginButton.layer.cornerRadius = 10; // this value vary as per your desire
    myLoginButton.clipsToBounds = YES;
    myLoginButton.center = CGPointMake(self.view.frame.size.width /2, self.view.frame.size.height - 300);
    [myLoginButton setTitle: @"Facebook Login" forState: UIControlStateNormal];
    
    // Handle clicks on the button
    [myLoginButton
     addTarget:self
     action:@selector(loginButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    // Add the button to the view
    [self.view addSubview:myLoginButton];
    
    
    //Twiter Login
    TWTRLogInButton* logInButton = [TWTRLogInButton buttonWithLogInCompletion:^(TWTRSession* session, NSError* error) {
        if (session) {
            LoginViewController *TabBarController = [self.storyboard instantiateViewControllerWithIdentifier:@"TabBarController"];
            [self presentViewController:TabBarController animated:YES completion:nil];
            NSLog(@"signed in as %@", [session userName]);
        } else {
            NSLog(@"error: %@", [error localizedDescription]);
        }
    }];
    logInButton.frame=CGRectMake(0,0,180,40);
    logInButton.layer.cornerRadius = 10; // this value vary as per your desire
    logInButton.clipsToBounds = YES;
    logInButton.center = CGPointMake(self.view.frame.size.width /2, self.view.frame.size.height - 250);

    [self.view addSubview:logInButton];
}

// Once the button is clicked, show the login dialog
-(void)loginButtonClicked
{
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login
     logInWithReadPermissions: @[@"public_profile"]
     fromViewController:self
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (error) {
             NSLog(@"Process error");
         } else if (result.isCancelled) {
             NSLog(@"Cancelled");
         } else {
             LoginViewController *TabBarController = [self.storyboard instantiateViewControllerWithIdentifier:@"TabBarController"];
             [self presentViewController:TabBarController animated:YES completion:nil];
             NSLog(@"Logged in");
         }
     }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//This is the login code that makes sure thatthe user enters information in every text field in order to continue


-(void)fetchUserInfo {
}



- (IBAction)login:(UIButton *)sender {
    {
        
        NSString *post =[NSString stringWithFormat:@"phoneNumber=%@",phoneNumber.text];
        
        NSString *hostStr = @"http://www.need2feed.host-ed.me/checklogin.php?";
        hostStr = [hostStr stringByAppendingString:post];
        NSData *dataURL =  [NSData dataWithContentsOfURL: [ NSURL URLWithString: hostStr ]];
        NSString *serverOutput = [[NSString alloc] initWithData:dataURL encoding: NSASCIIStringEncoding];
        NSLog (@"%@",serverOutput);
        if([serverOutput isEqualToString:@"Yes"]){
            UIAlertView *alertsuccess = [[UIAlertView alloc] initWithTitle:@"Success!" message:@"Would You Like To Continue?"
                                                                  delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
            [alertsuccess show];
            [alertsuccess release];
            
        } else {
            UIAlertView *alertsuccess = [[UIAlertView alloc] initWithTitle:@"Fail" message:@"Invalid Access"
                                                                  delegate:self cancelButtonTitle:@"No" otherButtonTitles: nil];
            [alertsuccess show];
            [alertsuccess release];
            
        }
        
        
        
      
    }


}



- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==1)
    {
        LoginViewController *FirstViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"TabBarController"];
        [self presentViewController:FirstViewController animated:YES completion:nil];

        NSLog(@"Button Pushed");
        
        
    }


}
    
    



@end
