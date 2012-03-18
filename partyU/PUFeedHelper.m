//
//  PUFeedHelper.m
//  partyU
//
//  Created by Jie Wu on 3/16/12.
//  Copyright (c) 2012 NYU poly. All rights reserved.
//

#import "PUFeedHelper.h"

@implementation PUFeedHelper

+ (id)loadFeedData: (PUPublicEventsFeed *)feed ForPListFile: (NSString *) plist{

    NSString *pathname = [[NSBundle mainBundle] pathForResource:plist ofType:@"plist"];
    NSDictionary* plistdic = [[NSDictionary alloc] initWithContentsOfFile:pathname ];
    NSArray *eventlist = [plistdic valueForKey:@"EventContainer"];
    for (NSDictionary* dict in eventlist) {
        PUPublicEvent *event = [[PUPublicEvent alloc]init];
//        NSLog( [dict objectForKey:@"title"]);
        event.title =  [dict objectForKey:@"title"];
//        NSLog(event.title);
        event.startTime = [dict objectForKey:@"starttime"];
        event.endTime = [dict objectForKey:@"endtime"];
        event.locationAddr = [dict objectForKey:@"location"];
        event.watHappen = [dict objectForKey:@"occation"];
        
        [feed.events addObject:event];
    }
    
//    NSLog(@"feed.events count: %d", [feed.events count]);
    
//    for (PUPublicEvent *pe in feed.events) {
//        NSLog(@"pe title: %@",pe.title);
//    }
    return feed;
}


@end
