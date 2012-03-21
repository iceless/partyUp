//
//  PUEventDetailViewController.h
//  partyU
//
//  Created by Jie Wu on 3/20/12.
//  Copyright (c) 2012 NYU poly. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EventDetailsViewControllerDelegate <NSObject>

@end


@interface PUEventDetailViewController : UITableViewController

@property (nonatomic, strong) NSString *eventid;

@property (nonatomic, weak) id <EventDetailsViewControllerDelegate> delegate;

@end
