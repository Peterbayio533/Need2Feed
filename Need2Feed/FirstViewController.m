//
//  FirstViewController.m
//  Need2Feed
//
//  Created by Peter Bayiokos on 1/28/16.
//  Copyright © 2016 Pace University. All rights reserved.
//

#import "FirstViewController.h"
#import "Events.h"
#import "EDetailViewController.h"

@interface FirstViewController ()
{
    
    EventModel *_eventModel;
    NSArray *_feedItems;
}
@end

@implementation FirstViewController


- (void)viewDidLoad
{
    
    
    [super viewDidLoad];
    
    
    // Set this view controller object as the delegate and data source for the table view
    self.listTableView.delegate = self;
    self.listTableView.dataSource = self;
    
    // Create array object and assign it to _feedItems variable
    _feedItems = [[NSArray alloc] init];
    
    // Create new EventModel object and assign it to _homeModel variable
    _eventModel = [[EventModel alloc] init];
    
    // Set this view controller object as the delegate for the home model object
    _eventModel.delegate = self;
    
    // Call the download items method of the home model object
    [_eventModel downloadItems];
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([[segue identifier] isEqualToString:@"detailsegue"])
    {
        NSIndexPath * indexPath = [self.listTableView indexPathForSelectedRow];
        Events * object = [_feedItems objectAtIndex:indexPath.row];
        
        [[segue destinationViewController] getEvent:object];
    }
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)itemsDownloaded:(NSArray *)items
{
    // This delegate method will get called when the items are finished downloading
    
    // Set the downloaded items to the array
    _feedItems = items;
    
    // Reload the table view
    [self.listTableView reloadData];
}

#pragma mark Table View Delegate Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of feed items (initially 0)
    return _feedItems.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Retrieve cell
    NSString *cellIdentifier = @"BasicCell";
    UITableViewCell *myCell= [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    // Get the Events to be shown
    Events *items = _feedItems[indexPath.row];
    
    // Get references to labels of cell
    myCell.textLabel.text = items.name;
    
    //Accessory
    myCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return myCell;
}

@end