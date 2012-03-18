//
//  PossessionStore.m
//  partyU
//
//  Created by Jie Wu on 3/13/12.
//  Copyright (c) 2012 NYU poly. All rights reserved.
//


#import "PossessionStore.h"
#import "Possession.h"

static PossessionStore *defaultStore = nil;

@implementation PossessionStore

+ (PossessionStore *)defaultStore
{
    if(!defaultStore) {
        defaultStore = [[super allocWithZone:NULL] init];
    }
    return defaultStore;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self defaultStore];
}

- (id)init
{
    if(defaultStore) {
        return defaultStore;
    }
    
    self = [super init];
    
    if (self) {
        allPossessions = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (NSArray *)allPossessions
{
    return allPossessions;
}

- (Possession *)createPossession
{
    Possession *p = [Possession randomPossession];
    [allPossessions addObject:p];
    
    return p;
}

/*
 - (id)retain
 {
 return self;
 }
 
 - (void)release
 {
 // Do nothing,, is better than anything
 }
 
 - (NSUInteger)retainCount
 {
 return NSUIntegerMax;
 }
 */



@end
