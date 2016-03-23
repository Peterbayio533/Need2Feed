//
//  CAccountViewController.h
//  Need2Feed
//
//  Created by Peter Bayiokos on 1/28/16.
//  Copyright © 2016 Pace University. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CAccountViewController : UIViewController

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, strong) IBOutlet UITextField *name;

@property (strong, nonatomic) IBOutlet UITextField *lastNameField;

@property (strong, nonatomic) IBOutlet UITextField *phoneNumber;




@property (strong, nonatomic) IBOutlet UISegmentedControl *emailTextSwitch;


- (IBAction)insert:(id)sender;

@end
