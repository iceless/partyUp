//
//  PUEventDetailHeaderCell.h
//  partyU
//
//  Created by Jie Wu on 3/20/12.
//  Copyright (c) 2012 NYU poly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PUEventDetailHeaderCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UIImageView *posterImage;
@property (nonatomic, strong) IBOutlet UIButton *joinButton;
@property (nonatomic, strong) IBOutlet UIButton *maybeButton;
@property (nonatomic, strong) IBOutlet UIButton *declienButton;

@end
