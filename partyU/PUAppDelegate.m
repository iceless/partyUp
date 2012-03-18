//
//  PUAppDelegate.m
//  partyU
//
//  Created by Jie Wu on 3/13/12.
//  Copyright (c) 2012 NYU poly. All rights reserved.
//

#import "PUAppDelegate.h"
#import "Possession.h"
#import "PossessionStore.h"
#import "PUPublicEventFeedsTableViewController.h"

#import "PUFeedManager.h"
#import "PUFeedHelper.h"

@implementation PUAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
//    PossessionStore * ps = [PossessionStore defaultStore];
//    for(int i = 0; i < 10; i++){
//        [ps createPossession];
//    }
    
    PUPublicEventsFeed *pfeed = [[PUPublicEventsFeed alloc] init];
    
    [PUFeedHelper loadFeedData:pfeed ForPListFile:@"public-event-feed"];
    
    for(PUPublicEvent *pe in pfeed.events) {
        NSLog(@"pe title: %@",pe.title);        
    }
    
    PUFeedManager *defaultFeedManager = [PUFeedManager defaultFeedManager];

    NSMutableDictionary *dic = [[PUFeedManager defaultFeedManager] allFeedData];
    
    [defaultFeedManager.allFeedData setObject:pfeed forKey:@"publiceventfeed"];
    NSMutableArray *marr = [[defaultFeedManager.allFeedData objectForKey:@"publiceventfeed"] events];
    
    for (PUPublicEvent *pe in marr) {
        NSLog(@"pe title: %@",pe.title);
    }


    
    /*
    UITabBarController *tabBarController = 
    (UITabBarController *)self.window.rootViewController;
	
    UINavigationController *navigationController = 
    [[tabBarController viewControllers] objectAtIndex:0];
	
    PUPublicEventFeedsTableViewController *publicevntViewController = 
    [[navigationController viewControllers] objectAtIndex:0];
    
    publicevntViewController.feed = pfeed;

     */
    
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
