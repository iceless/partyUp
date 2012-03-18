//
//  PUFeedHelper.h
//  partyU
//
//  Created by Jie Wu on 3/16/12.
//  Copyright (c) 2012 NYU poly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PUPublicEventsFeed.h"

@interface PUFeedHelper : NSObject

+ (id)loadFeedData: (PUPublicEventsFeed *)feed ForPListFile: (NSString *) plist;




@end
