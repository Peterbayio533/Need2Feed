//
//  EventModel.m
//  Need2Feed
//
//  Created by Peter Bayiokos on 1/30/16.
//  Copyright © 2016 Pace University. All rights reserved.
//

#import "EventModel.h"
#import "Events.h"

@interface EventModel()
{
    NSMutableData *_downloadedData;
}
@end

@implementation EventModel
//AFNetworking
- (void)downloadItems
{
    // Download the json file
    NSURL *jsonFileUrl = [NSURL URLWithString:@"http://www.need2feed.host-ed.me/NeedToFeed-3.php"];
    
    // Create the request
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:jsonFileUrl];
    [urlRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    // Create the NSURLConnection
    [NSURLConnection connectionWithRequest:urlRequest delegate:self];
}

#pragma mark NSURLConnectionDataProtocol Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // Initialize the data object
    _downloadedData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // Append the newly downloaded data
    [_downloadedData appendData:data];

}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // Create an array to store the locations
    NSMutableArray *_events = [[NSMutableArray alloc] init];
    
    // Parse the JSON that came in
    NSError *error;
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:_downloadedData options:NSJSONReadingAllowFragments error:&error];
    
    NSLog (@"%@", [[NSString alloc] initWithData:_downloadedData encoding:NSUTF8StringEncoding]);
    
    // Loop through Json objects, create question objects and add them to our questions array
    for (int i = 0; i < jsonArray.count; i++)
    {
        NSDictionary *jsonElement = jsonArray[i];
        
        // Create a new Events object and set its props to JsonElement properties
        Events *newEvents = [[Events alloc] init];
        newEvents.name = jsonElement[@"name"];
        newEvents.date = jsonElement[@"date"];
        newEvents.place = jsonElement[@"place"];
        newEvents.description = jsonElement[@"description"];
       
        
        // Add this question to the Events array
        [_events addObject:newEvents];
    }
    
    // Ready to notify delegate that data is ready and pass back items
    if (self.delegate)
    {
        [self.delegate itemsDownloaded:_events];
    }
}

@end