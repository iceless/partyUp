//
//  PUPublicEvent.h
//  partyU
//
//  Created by Jie Wu on 3/16/12.
//  Copyright (c) 2012 NYU poly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PUPublicEvent : NSObject

@property (nonatomic, strong) NSString *eventid;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSDate *startTime;
@property (nonatomic, strong) NSDate *endTime;
@property (nonatomic, strong) NSString *locationAddr;
@property (nonatomic, strong) NSString *watHappen;
@property (nonatomic, strong) UIImage *poster;


@end
