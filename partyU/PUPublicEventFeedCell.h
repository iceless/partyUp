//
//  PUPublicEventFeedCell.h
//  partyU
//
//  Created by Jie Wu on 3/19/12.
//  Copyright (c) 2012 NYU poly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PUPublicEventFeedCell : UITableViewCell

@property (nonatomic, strong) NSString *eventid;

@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UILabel *timeLabel;
@property (nonatomic, strong) IBOutlet UILabel *locationLabel;
@property (nonatomic, strong) IBOutlet UIImageView *posterImageView;

@end
