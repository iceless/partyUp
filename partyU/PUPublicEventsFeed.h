//
//  PUPublicEventsFeed.h
//  partyU
//
//  Created by Jie Wu on 3/16/12.
//  Copyright (c) 2012 NYU poly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PUPublicEvent.h"

@interface PUPublicEventsFeed : NSObject

@property (nonatomic,strong) NSMutableDictionary *events; //TODO: assign array element class

- (id) publicEventAt: (int) index;
- (int) count;

- (PUPublicEvent *)eventOfEventID:(NSString *) eventid;
- (void)setEvent:(PUPublicEvent *) event forEventID:(NSString *) eventid;

@end


