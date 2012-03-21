//
//  PUPublicEventsFeed.m
//  partyU
//
//  Created by Jie Wu on 3/16/12.
//  Copyright (c) 2012 NYU poly. All rights reserved.
//

#import "PUPublicEventsFeed.h"

@implementation PUPublicEventsFeed

@synthesize events = _events;

- (id)init
{
    self.events = [[NSMutableDictionary alloc] init];
    return self;
}

- (id) publicEventAt: (int) index
{
    if(index < 0 || index > [self.events count])
    {
        return nil;
    }
    return [[self.events allValues] objectAtIndex:index];
}

- (int) count
{
    return [self.events count];
}

- (PUPublicEvent *)eventOfEventID:(NSString *) eventid
{
    return [_events objectForKey:eventid];
    
}

- (void)setEvent:(PUPublicEvent *) event forEventID:(NSString *) eventid
{
    return [_events setObject:event forKey:eventid];
    
}


@end
