//
//  EDetailViewController.h
//  Need2Feed
//
//  Created by Peter Bayiokos on 2/8/16.
//  Copyright © 2016 Pace University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Events.h"
#import "EventModel.h"



@interface EDetailViewController : UIViewController


@property(nonatomic, strong) IBOutlet UILabel *namelabel;
@property(nonatomic, strong) IBOutlet UILabel *placelabel;
@property(nonatomic, strong) IBOutlet UILabel *datelabel;
@property(nonatomic, strong) IBOutlet UILabel *descriptionlabel;

@property(nonatomic, strong) Events * currentEvent;


- (void)itemsDownloaded:(NSArray *)items;

- (void)getEvent:(id)items;
- (void)setLabels;

@end
