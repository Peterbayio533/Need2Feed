//
//  CAccountViewController.m
//  Need2Feed
//
//  Created by Peter Bayiokos on 1/28/16.
//  Copyright © 2016 Pace University. All rights reserved.
//

#import "CAccountViewController.h"

@interface CAccountViewController ()

@end

@implementation CAccountViewController

@synthesize name;
@synthesize lastNameField;
@synthesize phoneNumber;
- (void)viewDidLoad {
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)insert:(id)sender
{
    
    
   // create string contains url address for php file, the file name is phpFile.php, it receives parameter :name
    NSLog(@"%@", name.text);
    NSString *strURL = [NSString stringWithFormat:@"http://www.need2feed.host-ed.me/registeruseriOS.php?name=%@&lastNameField=%@&phoneNumber=%@", name.text, lastNameField.text, phoneNumber.text];
    
    
    // to execute php code
    NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:strURL]];
    
    // to receive the returnend value
    NSString *strResult = [[[NSString alloc] initWithData:dataURL encoding:NSUTF8StringEncoding]autorelease];
    
    NSLog(@"%@", strResult);
    
    
    
    NSString *name = [self.name.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *phoneNumber = [self.phoneNumber.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *lastName = [self.lastNameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    
    if ([lastName length]== 0 ||[phoneNumber length] == 0 || [name length] == 0){
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Make sure you enter your First Name, Last Name, and Phone Number!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alertView show];
        
        
    }
    
    else {
        CAccountViewController *FirstViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"TabBarController"];
        [self presentViewController:FirstViewController animated:YES completion:nil];
    }


    
}
    
    



- (IBAction)createAccount:(UIButton *)sender {
    
    NSString *name = [self.name.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *phoneNumber = [self.phoneNumber.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *lastName = [self.lastNameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    
    if ([lastName length]== 0 ||[phoneNumber length] == 0 || [name length] == 0){
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Make sure you enter your First Name, Last Name, and Phone Number!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alertView show];
        
        
    }
    
    else {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    
    
    
    
    
    // more sequential code that runs right away!
    
    //^^^^This whole section of code tells the user to enter information in each field in order to sign up successfully and it uses a block to run asychronously so it doesnt disturb any other actions
    
    
    
    
}






@end
