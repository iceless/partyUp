//
//  PUFeedManager.m
//  partyU
//
//  Created by Jie Wu on 3/17/12.
//  Copyright (c) 2012 NYU poly. All rights reserved.
//

#import "PUFeedManager.h"

@implementation PUFeedManager
@synthesize allFeedData;

static PUFeedManager *defaultFeedManager = nil;

+ (PUFeedManager *)defaultFeedManager
{
    if(!defaultFeedManager) {
        defaultFeedManager = [[super allocWithZone:NULL] init];
    }
    return defaultFeedManager;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self defaultFeedManager];
}


- (id)init
{
    if(defaultFeedManager) {
        return defaultFeedManager;
    }
    
    self = [super init];
    
    if (self) {
        self.allFeedData = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}


@end
