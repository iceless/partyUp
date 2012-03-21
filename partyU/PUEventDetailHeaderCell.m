//
//  PUEventDetailHeaderCell.m
//  partyU
//
//  Created by Jie Wu on 3/20/12.
//  Copyright (c) 2012 NYU poly. All rights reserved.
//

#import "PUEventDetailHeaderCell.h"

@implementation PUEventDetailHeaderCell

@synthesize titleLabel;
@synthesize posterImage;
@synthesize joinButton;
@synthesize maybeButton;
@synthesize declienButton;

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
