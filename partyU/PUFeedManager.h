//
//  PUFeedManager.h
//  partyU
//
//  Created by Jie Wu on 3/17/12.
//  Copyright (c) 2012 NYU poly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PUFeedManager : NSObject

@property (nonatomic, strong) NSMutableDictionary *allFeedData;

+ (PUFeedManager *)defaultFeedManager;

@end
