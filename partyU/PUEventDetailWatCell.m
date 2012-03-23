//
//  PUEventDetailWatCell.m
//  partyU
//
//  Created by Jie Wu on 3/22/12.
//  Copyright (c) 2012 NYU poly. All rights reserved.
//

#import "PUEventDetailWatCell.h"

@implementation PUEventDetailWatCell

@synthesize detailLabel;
@synthesize staticDetailLabel;

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
