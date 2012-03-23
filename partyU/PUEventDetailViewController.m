//
//  PUEventDetailViewController.m
//  partyU
//
//  Created by Jie Wu on 3/20/12.
//  Copyright (c) 2012 NYU poly. All rights reserved.
//

#import "PUEventDetailViewController.h"
#import "PUEventDetailHeaderCell.h"
#import "PUEventDetailWhenCell.h"
#import "PUEventDetailWhereCell.h"
#import "PUEventDetailWatCell.h"
#import "PUPublicEvent.h"
#import "PUFeedManager.h"
#import "PUPublicEventsFeed.h"


#define POSTERIMAGE_WIDTH 93.0f
#define POSTERIMAGE_HEIGHT 93.0f
#define HEADERCONTENT_WIDTH 211.0f

#define HEADERCONTENT_MARGIN 0.0f

#define POSTERIMAGE_X 4.0f
#define POSTERIMAGE_Y 4.0f
#define TITLELABEL_X 105.0f
#define TITLELABEL_Y 4.0f

#define TITLE_FONT 17.0f
#define SUBTITLE_FONT 13.0f
#define BUTON_FONT 12.0f
#define DETAILS_FONT 13.0f

#define LABEL_SPACE 3.0f

#define BUTON_HEIGHT 26.0f

#define DETAILLABEL_X 70.0f
#define DETAILLABEL_Y 10.0f

#define DETAIL_WIDTH 250.0f



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
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PUPublicEventsFeed *feed = [[[PUFeedManager defaultFeedManager] allFeedData] valueForKey:@"publiceventfeed"];
    PUPublicEvent *pe = [feed eventOfEventID:self.eventid];
    
    if(indexPath.section == 0)
    {
        //header row
        if(indexPath.row == 0)
        {
            PUEventDetailHeaderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EventDetailHeaderCell"];
            
            NSString *thePath = [[NSBundle mainBundle] pathForResource:pe.eventid ofType:@"jpg"];    
            [cell.posterImage setImage:[[UIImage alloc] initWithContentsOfFile:thePath]];
            [cell.posterImage setFrame:CGRectMake(POSTERIMAGE_X, POSTERIMAGE_Y, POSTERIMAGE_WIDTH, POSTERIMAGE_HEIGHT)];

            
            //******** title label
            CGSize constraint = CGSizeMake(HEADERCONTENT_WIDTH - (HEADERCONTENT_MARGIN * 2), 200.0f);
            CGSize titlesize = [pe.title sizeWithFont:[UIFont systemFontOfSize:TITLE_FONT] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
            [cell.titleLabel setFrame:CGRectMake(TITLELABEL_X, TITLELABEL_Y, HEADERCONTENT_WIDTH - (HEADERCONTENT_MARGIN * 2), MAX(titlesize.height, 42.0f))];
            cell.titleLabel.numberOfLines = 0;
//            NSLog(@"**titlelabel size.height: %0.0f", cell.titleLabel.frame.size.height);
            [cell.titleLabel setText:pe.title];
//            [cell.titleLabel sizeToFitFixedWidth:191 ];
            
            //******** subtitle label
            CGFloat titlelabel_leftbottom_y = cell.titleLabel.frame.origin.y + cell.titleLabel.frame.size.height;
            [cell.subtitleLabel setFrame:CGRectMake(TITLELABEL_X, 
                                                    titlelabel_leftbottom_y + LABEL_SPACE, 
                                                    HEADERCONTENT_WIDTH - (HEADERCONTENT_MARGIN * 2), 
                                                    0.0f)];
            [cell.subtitleLabel sizeToFitFixedWidth:HEADERCONTENT_WIDTH - (HEADERCONTENT_MARGIN * 2)];
            cell.subtitleLabel.numberOfLines = 0;
//            NSLog(@"**subtitle height: %.0f",cell.subtitleLabel.frame.size.height);

            //******** button group 
            CGFloat subtitlelabel_leftbottom_y = cell.subtitleLabel.frame.origin.y + cell.subtitleLabel.frame.size.height;
//            NSLog(@"subtitle leftbottom: %.0f",subtitlelabel_leftbottom_y);
            [cell.buttonGroupView setFrame:CGRectMake(TITLELABEL_X, 
                                                     subtitlelabel_leftbottom_y + LABEL_SPACE, 
                                                     HEADERCONTENT_WIDTH - (HEADERCONTENT_MARGIN * 2), 
                                                     BUTON_HEIGHT)];
            [cell.buttonGroupView addSubview:cell.joinButton];
            [cell.buttonGroupView addSubview:cell.maybeButton];
            [cell.buttonGroupView addSubview:cell.declienButton];
            [cell.buttonGroupView sizeToFit];
            
            tableView.rowHeight = cell.joinButton.frame.origin.y + cell.joinButton.frame.size.height + 3.0;
//            NSLog(@"join button left bottom: %.0f", cell.joinButton.frame.origin.y + cell.joinButton.frame.size.height);
//            NSLog(@"**button view left bottom: %.0f", cell.buttonGroupView.frame.origin.y + cell.buttonGroupView.frame.size.height);
            
            return cell;
            
        }
        // when row
        if(indexPath.row == 1)
        {
            PUEventDetailWhenCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EventDetailWhenCell"];

            [cell.staticWhenLabel sizeToFit];
            
            CGSize constraint = CGSizeMake(DETAIL_WIDTH, 100.0f);
            NSString *timestring = [[NSString alloc]initWithFormat:@"%@ until %@", pe.startTime, pe.endTime];
            CGSize whenlabelsize = [timestring sizeWithFont:[UIFont systemFontOfSize:DETAILS_FONT] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
            [cell.whenLabel setFrame:CGRectMake(DETAILLABEL_X, DETAILLABEL_Y, DETAIL_WIDTH, MAX(whenlabelsize.height, 0.0f))];
            cell.whenLabel.numberOfLines = 0;
            [cell.whenLabel setText:timestring];
            
            return cell;   
        }
        // where row
        if(indexPath.row == 2)
        {
            PUEventDetailWhereCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EventDetailWhereCell"];
            
            [cell.staticWhereLabel sizeToFit];
            
            CGSize constraint = CGSizeMake(DETAIL_WIDTH, 100.0f);
            CGSize wherelabelsize = [pe.locationAddr sizeWithFont:[UIFont systemFontOfSize:DETAILS_FONT] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
            [cell.whereLabel setFrame:CGRectMake(DETAILLABEL_X, DETAILLABEL_Y, DETAIL_WIDTH, MAX(wherelabelsize.height, 0.0f))];
            cell.whereLabel.numberOfLines = 0;
            [cell.whereLabel setText:pe.locationAddr];
            
            return cell;   
        }
        // detail row
        if(indexPath.row == 3)
        {
            PUEventDetailWatCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EventDetailWatCell"];
            
            [cell.staticDetailLabel sizeToFit];
            
            CGSize constraint = CGSizeMake(DETAIL_WIDTH, 1000.0f);
            CGSize watlabelsize = [pe.watHappen sizeWithFont:[UIFont systemFontOfSize:DETAILS_FONT] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
            [cell.detailLabel setFrame:CGRectMake(DETAILLABEL_X, DETAILLABEL_Y, DETAIL_WIDTH, MAX(watlabelsize.height, 0.0f))];
            cell.detailLabel.numberOfLines = 0;
            [cell.detailLabel setText:pe.watHappen];
//            NSLog(@"wathappen on detaillabel: %@",pe.watHappen);
            
            return cell;   
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

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PUPublicEventsFeed *feed = [[[PUFeedManager defaultFeedManager] allFeedData] valueForKey:@"publiceventfeed"];
    PUPublicEvent *pe = [feed eventOfEventID:self.eventid];
    
    if(indexPath.section == 0)
    {
        if(indexPath.row == 0) 
        {            
            CGSize constraint = CGSizeMake(HEADERCONTENT_WIDTH - (HEADERCONTENT_MARGIN * 2), 200.0f);
            
            CGSize titlesize = [pe.title sizeWithFont:[UIFont systemFontOfSize:TITLE_FONT] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
            
            CGFloat titleheight = MAX(titlesize.height, 42.0f);
            
            CGSize subtitlesize = [@"public/private event" sizeWithFont:[UIFont systemFontOfSize:SUBTITLE_FONT] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
            CGFloat subtitleheight = MAX(subtitlesize.height, 19.0f);
            
            
//            NSLog(@"22rowheight: %.0f", TITLELABEL_Y + titleheight + LABEL_SPACE + subtitleheight + LABEL_SPACE + BUTON_HEIGHT + LABEL_SPACE);
//            NSLog(@"titleheight: %.0f subtitleheight: %.0f",titleheight, subtitleheight);
            
            return TITLELABEL_Y + titleheight + LABEL_SPACE + subtitleheight + LABEL_SPACE + BUTON_HEIGHT + 5.0f;
        }
        if(indexPath.row == 1)
        {            
            CGSize constraint = CGSizeMake(DETAIL_WIDTH, 100.0f);
            NSString *timestring = [[NSString alloc]initWithFormat:@"%@ until %@", pe.startTime, pe.endTime];
            CGSize whenlabelsize = [timestring sizeWithFont:[UIFont systemFontOfSize:DETAILS_FONT] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
            return DETAILLABEL_Y + whenlabelsize.height + 10.0f;
        }
        if(indexPath.row == 2)
        {            
            CGSize constraint = CGSizeMake(DETAIL_WIDTH, 100.0f);
            CGSize wherelabelsize = [pe.locationAddr sizeWithFont:[UIFont systemFontOfSize:DETAILS_FONT] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
            return DETAILLABEL_Y + wherelabelsize.height + 10.0f;
        }
        if(indexPath.row == 3)
        {            
            CGSize constraint = CGSizeMake(DETAIL_WIDTH, 1000.0f);
            CGSize watlabelsize = [pe.watHappen sizeWithFont:[UIFont systemFontOfSize:DETAILS_FONT] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
            return DETAILLABEL_Y + watlabelsize.height + 10.0f;
        }
    }
    return  103.0f;

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
