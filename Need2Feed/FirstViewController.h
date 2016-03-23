//
//  FirstViewController.h
//  Need2Feed
//
//  Created by Peter Bayiokos on 1/28/16.
//  Copyright © 2016 Pace University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventModel.h"

@interface FirstViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, EventModelProtocol>

@property (strong, nonatomic) IBOutlet UITableView *listTableView;

@end

