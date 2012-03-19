//
//  PUPublicEventFeedCell.m
//  partyU
//
//  Created by Jie Wu on 3/19/12.
//  Copyright (c) 2012 NYU poly. All rights reserved.
//

#import "PUPublicEventFeedCell.h"

@implementation PUPublicEventFeedCell

@synthesize titleLabel;
@synthesize timeLabel;
@synthesize locationLabel;
@synthesize posterImageView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
