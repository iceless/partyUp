//
//  PossessionStore.h
//  partyU
//
//  Created by Jie Wu on 3/13/12.
//  Copyright (c) 2012 NYU poly. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Possession;

@interface PossessionStore : NSObject
{
    NSMutableArray *allPossessions;
}

+ (PossessionStore *)defaultStore;

- (NSArray *)allPossessions;
- (Possession *)createPossession;

@end
