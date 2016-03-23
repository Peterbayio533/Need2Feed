//
//  EventModel.h
//  Need2Feed
//
//  Created by Peter Bayiokos on 1/30/16.
//  Copyright © 2016 Pace University. All rights reserved.
//



#import <Foundation/Foundation.h>

@protocol EventModelProtocol <NSObject>

- (void)itemsDownloaded:(NSArray *)items;

@end

@interface EventModel : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic, strong) id<EventModelProtocol> delegate;

- (void)downloadItems;

@end