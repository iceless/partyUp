//
//  PUPublicEventFeedsVewControllerViewController.m
//  partyU
//
//  Created by Jie Wu on 3/13/12.
//  Copyright (c) 2012 NYU poly. All rights reserved.
//

#import "PUPublicEventFeedsTableViewController.h"
#import "Possession.h"
#import "PossessionStore.h"
#import "PUFeedManager.h"

@interface PUPublicEventFeedsTableViewController ()

@end

@implementation PUPublicEventFeedsTableViewController

//@synthesize feed;
//@synthesize events;


/*
- (id)initWithCoder:(NSCoder*)aDecoder 
{
    if(self = [super initWithCoder:aDecoder]) 
    {
        // Do something
        self = [self initWithStyle:UITableViewStylePlain];
    }
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        PossessionStore * ps = [PossessionStore defaultStore];
        for(int i = 0; i < 10; i++){
            [ps createPossession];
        }
        
        self.events = [[NSMutableArray alloc] initWithArray:[ps allPossessions]];
        
        // Custom initialization
    }
    return self;
}
 */

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
//    NSLog(@"count of rows in section:%d",[[[PossessionStore defaultStore] allPossessions] count]);
//    return [[[PossessionStore defaultStore] allPossessions] count];
    NSMutableDictionary *dic = [[PUFeedManager defaultFeedManager] allFeedData];
    NSArray* allkeys = [dic allKeys];
//    NSLog(@"%@", allkeys.description);
    NSArray* allvalues = [dic allValues];
//    NSLog(@"%@", allvalues.description);
//    NSLog(@"feed count: %d", [[dic valueForKey:@"publiceventfeed"] count]);
    return [[[[PUFeedManager defaultFeedManager] allFeedData] valueForKey:@"publiceventfeed"] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PublicEvntCell"];
    if(cell == nil)
    {
        NSLog(@"cell is nil...");
    }
    
    // Configure the cell...
    
    PUPublicEvent *pe = [[[[[PUFeedManager defaultFeedManager] allFeedData] valueForKey:@"publiceventfeed"] events] objectAtIndex:indexPath.row];
    //[self.feed publicEventAt:[indexPath row]];
    
    NSString *thePath = [[NSBundle mainBundle] pathForResource:@"partyA" ofType:@"jpg"];    
    [[cell imageView] setImage:[[UIImage alloc] initWithContentsOfFile:thePath]];
    [[cell textLabel] setText:pe.title];
    
    
//    Possession *p = [[[PossessionStore defaultStore] allPossessions] objectAtIndex:[indexPath row]];
    
//    NSString *desp = [[events objectAtIndex:indexPath.row] description];
//    NSLog(desp);
    
//    [[cell textLabel] setText:[p description]];
//        [[cell textLabel] setText:[[events objectAtIndex:indexPath.row] description]];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
