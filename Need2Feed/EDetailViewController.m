//
//  EDetailViewController.m
//  Need2Feed
//
//  Created by Peter Bayiokos on 2/8/16.
//  Copyright © 2016 Pace University. All rights reserved.
//

#import "EDetailViewController.h"
#import "EventModel.h"
#import "FirstViewController.h"

@interface EDetailViewController ()
@end

@implementation EDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Load up the UI
    
    
    [self setLabels];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(void)getEvent:(id)items
{
    _currentEvent = items;
}

- (void)setLabels
{
    _namelabel.text = _currentEvent.name;
    _placelabel.text  = _currentEvent.place;
    _datelabel.text = _currentEvent.date;
    _descriptionlabel.text = _currentEvent.description;
}

@end
