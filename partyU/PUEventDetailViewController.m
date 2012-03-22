//
//  PUEventDetailViewController.m
//  partyU
//
//  Created by Jie Wu on 3/20/12.
//  Copyright (c) 2012 NYU poly. All rights reserved.
//

#import "PUEventDetailViewController.h"
#import "PUEventDetailHeaderCell.h"
#import "PUPublicEvent.h"
#import "PUFeedManager.h"
#import "PUPublicEventsFeed.h"




@interface PUEventDetailViewController ()

- (CGRect)frame:(CGRect)originalFrame resetY:(CGFloat)y;

@end

@implementation PUEventDetailViewController

@synthesize eventid;
@synthesize delegate;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

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
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"indexpath.row: %d section: %d",indexPath.row, indexPath.section);

    PUPublicEventsFeed *feed = [[[PUFeedManager defaultFeedManager] allFeedData] valueForKey:@"publiceventfeed"];
    PUPublicEvent *pe = [feed eventOfEventID:self.eventid];
    
    if(indexPath.section == 0)
    {
        if(indexPath.row == 0)
        {
            PUEventDetailHeaderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EventDetailHeaderCell"];
            
            NSString *thePath = [[NSBundle mainBundle] pathForResource:pe.eventid ofType:@"jpg"];    
            [cell.posterImage setImage:[[UIImage alloc] initWithContentsOfFile:thePath]];
            [cell.titleLabel setText:pe.title];
            
            cell.titleLabel.lineBreakMode = UILineBreakModeWordWrap;
            cell.titleLabel.numberOfLines = 0;
            [cell sizeToFit];
            
            [cell.titleLabel sizeToFitFixedWidth:191 ];
            
            NSLog(@"titleLabel frame: %f %f %f %f",cell.titleLabel.frame.origin.x,
                  cell.titleLabel.frame.origin.y,
                  cell.titleLabel.frame.size.width,
                  cell.titleLabel.frame.size.height);
            
            cell.subtitleLabel.frame = [self frame:cell.subtitleLabel.frame 
                                       resetY:(cell.titleLabel.frame.origin.y + cell.titleLabel.frame.size.height + 3.0)];
            cell.joinButton.frame = [self frame:cell.joinButton.frame 
                                    resetY:(cell.subtitleLabel.frame.origin.y + cell.subtitleLabel.frame.size.height + 3.0)];
            cell.maybeButton.frame = [self frame:cell.maybeButton.frame 
                                    resetY:(cell.subtitleLabel.frame.origin.y + cell.subtitleLabel.frame.size.height + 3.0)];
            cell.declienButton.frame = [self frame:cell.declienButton.frame 
                                    resetY:(cell.subtitleLabel.frame.origin.y + cell.subtitleLabel.frame.size.height + 3.0)];
            
            
//            NSLog(@"sizeThatFits:",cell sizeThatFits:<#(CGSize)#>)
            
            return cell;
            
            //        [cell.locationLabel setText:pe.locationAddr];
        }
        if(indexPath.row == 1)
        {
            
        }
        
    }
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    
    return cell;
}

- (CGRect)frame:(CGRect)originalFrame resetY:(CGFloat)y
{
    return CGRectMake(originalFrame.origin.x,
                      y,
                      originalFrame.size.width,
                      originalFrame.size.height);
    
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
