//
//  tableViewController.m
//  Cocktail Zen
//
//  Created by Brad on 3/16/10.
//  Copyright 2010 __Rothrock Group, LLC__. All rights reserved.
//

#import "tableViewController.h"
#import "PageOneViewController.h"
#import "PageTwoViewController.h"
#import "PageThreeViewController.h"
#import "PageFourViewController.h"
#import "PageFiveViewController.h"
#import "PageSixViewController.h"
#import "PageSevenViewController.h"
#import "PageEightViewController.h"
#import "PageNineViewController.h"
#import "PageTenViewController.h"
#import "PageElevenViewController.h"
#import "PageTwelveViewController.h"

#define TEXT_BGCOLORVAL_RED				240
#define TEXT_BGCOLORVAL_GREEN			230
#define TEXT_BGCOLORVAL_BLUE			220

#define kNameLabelTag		1
#define kAddressLabelTag	2
#define kImageLabelTag		3

@implementation tableViewController

@synthesize listData;
@synthesize myTableView;

- (void)viewDidLoad {
	[super viewDidLoad];
    NSArray *ver = [[UIDevice currentDevice].systemVersion componentsSeparatedByString:@"."];
    if ([[ver objectAtIndex:0] intValue] >= 7) {
        self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
        self.navigationController.navigationBar.translucent = NO;
        self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    }
    
    //********************INSERT FONT COMMAND HERE?????*********************************
    //***** I DELETED THE LINE BELOW, AS IT WAS CONFLICTING. OK???? FIXED BACK BUTTON COLOR TO WHITE **************
    
    //self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    else {
        self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    }
	
	NSDictionary *row1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"1. Tennessee State Capitol", @"Name", @"400 Charlotte Avenue",@"Address",@"nolactable1",@"Image",  nil];
    NSDictionary *row2 = [[NSDictionary alloc] initWithObjectsAndKeys:@"2. St. Mary's Catholic Church", @"Name", @"460 5th Avenue North",@"Address",@"nolactable2",@"Image",  nil];
    NSDictionary *row3 = [[NSDictionary alloc] initWithObjectsAndKeys:@"3. Morris Memorial Building", @"Name", @"330 Charlotte Avenue",@"Address",@"nolactable3",@"Image",  nil];
    NSDictionary *row4 = [[NSDictionary alloc] initWithObjectsAndKeys:@"4. The Hermitage Hotel", @"Name", @"231 6th Avenue North",@"Address",@"nolactable4",@"Image",  nil];
    NSDictionary *row5 = [[NSDictionary alloc] initWithObjectsAndKeys:@"5. Nashville sit-ins", @"Name", @"233 5th Avenue North",@"Address",@"nolactable5",@"Image",  nil];
	NSDictionary *row6 = [[NSDictionary alloc] initWithObjectsAndKeys:@"6. Downtown Pres. Church", @"Name", @"154 5th Avenue North",@"Address",@"nolactable6",@"Image",  nil];
	NSDictionary *row7 = [[NSDictionary alloc] initWithObjectsAndKeys:@"7. Printer's Alley", @"Name", @"Between 3rd and 4th Avenues",@"Address",@"nolactable7",@"Image",  nil];
	NSDictionary *row8 = [[NSDictionary alloc] initWithObjectsAndKeys:@"8. Ryman Auditorium", @"Name", @"116 5th Avenue North",@"Address",@"nolactable8",@"Image",  nil];
    NSDictionary *row9 = [[NSDictionary alloc] initWithObjectsAndKeys:@"9. Tootsies", @"Name", @"422 Broadway",@"Address",@"nolactable9",@"Image",  nil];
    NSDictionary *row10 = [[NSDictionary alloc] initWithObjectsAndKeys:@"10. Hume-Fogg High School", @"Name", @"700 Broadway",@"Address",@"nolactable10",@"Image",  nil];
    NSDictionary *row11 = [[NSDictionary alloc] initWithObjectsAndKeys:@"11. Frist Center", @"Name", @"919 Broadway",@"Address",@"nolactable11",@"Image", nil];
	NSDictionary *row12 = [[NSDictionary alloc] initWithObjectsAndKeys:@"12. Union Station Hotel", @"Name", @"1001 Broadway",@"Address",@"nolactable12",@"Image", nil];
	
	NSArray *array = [[NSArray alloc] initWithObjects:row1, row2, row3, row4, row5, row6, row7, row8, row9, row10, row11, row12, nil];
	self.listData = array;
		
	[row1 release];
	[row2 release];
	[row3 release];
	[row4 release];
	[row5 release];
	[row6 release];
	[row7 release];
    [row8 release];
    [row9 release];
    [row10 release];
    [row11 release];
    [row12 release];
    [array release];
	
	//[myTableView setBackgroundColor:[UIColor colorWithRed:TEXT_BGCOLORVAL_RED/255.0 green:TEXT_BGCOLORVAL_GREEN/255.0 blue:TEXT_BGCOLORVAL_BLUE/255.0 alpha:1]];

}

-(void)viewWillAppear:(BOOL)animated
{
	
	[self.myTableView deselectRowAtIndexPath:self.myTableView.indexPathForSelectedRow animated:NO];

	NSLog (@"tableview viewwillappear executed");
	[super viewWillAppear:animated];
	
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	self.listData = nil;
	self.myTableView = nil;
	[super viewDidUnload];
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.listData count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellTableIdentifier = @"CellTableIdentifier";
	[tableView setBounces:YES];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellTableIdentifier] autorelease];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		
		
	//Black frame around the picture
	CGRect frame = CGRectMake(1, 1, 41, 41);
	UIView *imageFrame = [[UIView alloc] initWithFrame:frame];
	[imageFrame setBackgroundColor:[UIColor blackColor]];
	[imageFrame setOpaque:NO];
	[imageFrame setAlpha:0.5];
	[cell.contentView addSubview:imageFrame];
	[imageFrame release];
	
	//Container for picture
	CGRect imageLabelRect = CGRectMake(2, 2, 39, 39);
	UIImageView *imageLabel = [[UIImageView alloc] initWithFrame:imageLabelRect];
	imageLabel.contentMode = UIViewContentModeScaleAspectFit;
	imageLabel.tag = kImageLabelTag;
	[cell.contentView addSubview:imageLabel];
	[imageLabel release];
	
	//Title text
	CGRect nameLabelRect = CGRectMake(50, 6, 240, 18);
	UILabel *nameLabel = [[UILabel alloc] initWithFrame:nameLabelRect];
	[nameLabel setBackgroundColor:[UIColor clearColor]];
	nameLabel.textAlignment = NSTextAlignmentLeft;
	nameLabel.tag = kNameLabelTag;
	nameLabel.font = [UIFont boldSystemFontOfSize:16];
	[cell.contentView addSubview:nameLabel];
	[nameLabel release];
	
	//Subtitle text
	CGRect addressLabelRect = CGRectMake(50, 25, 240, 16);
	UILabel *addressLabel = [[UILabel alloc] initWithFrame:addressLabelRect];
	[addressLabel setBackgroundColor:[UIColor clearColor]];
	addressLabel.textAlignment = NSTextAlignmentLeft;
	addressLabel.tag = kAddressLabelTag;
	addressLabel.font = [UIFont systemFontOfSize:12];
	[cell.contentView addSubview:addressLabel];
	[addressLabel release];
	}
	
	NSUInteger row = [indexPath row];
	NSDictionary *rowData = [self.listData objectAtIndex:row];
		
	NSString *imageName= [rowData objectForKey:@"Image"];
	UIImage *imagePath = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png", imageName]];
	
	NSLog(@"This is theimage name for the photoveiw: %@", imagePath);
	
	UIImageView *imageThumb = (UIImageView *)[cell.contentView viewWithTag:kImageLabelTag];
	imageThumb.image = imagePath;
	UILabel *name = (UILabel *)[cell.contentView viewWithTag:kNameLabelTag];
	name.text = [rowData objectForKey:@"Name"];
	UILabel *address = (UILabel *)[cell.contentView viewWithTag:kAddressLabelTag];
	address.text = [rowData objectForKey:@"Address"];
	
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
 	NSUInteger selectedSite = [indexPath row]+1;
	if (selectedSite == 1){
		NSLog(@"nrbuttonpressed if = 1 executed");
		NSString *viewControllerName = @"PageOneViewController";
		childController = [[PageOneViewController alloc] initWithNibName:viewControllerName bundle:nil];
	}
	if (selectedSite == 2){
		NSLog(@"nrbuttonpressed if = 2 executed");
		NSString *viewControllerName = @"PageTwoViewController";
		childController = (PageOneViewController *)[[PageTwoViewController alloc] initWithNibName:viewControllerName bundle:nil];
	}
	if (selectedSite == 3){
		NSLog(@"nrbuttonpressed if = 3 executed");
		NSString *viewControllerName = @"PageThreeViewController";
		childController = (PageOneViewController *)[[PageThreeViewController alloc] initWithNibName:viewControllerName bundle:nil];
	}
	if (selectedSite == 4){
		NSLog(@"nrbuttonpressed if = 4 executed");
		NSString *viewControllerName = @"PageFourViewController";
		childController = (PageOneViewController *)[[PageFourViewController alloc] initWithNibName:viewControllerName bundle:nil];
	}
	if (selectedSite == 5){
		NSLog(@"nrbuttonpressed if = 5 executed");
		NSString *viewControllerName = @"PageFiveViewController";
		childController = (PageOneViewController *)[[PageFiveViewController alloc] initWithNibName:viewControllerName bundle:nil];
	}
	if (selectedSite == 6){
		NSLog(@"nrbuttonpressed if = 6 executed");
		NSString *viewControllerName = @"PageSixViewController";
		childController = (PageOneViewController *)[[PageSixViewController alloc] initWithNibName:viewControllerName bundle:nil];
	}
	if (selectedSite == 7){
		NSLog(@"nrbuttonpressed if = 7 executed");
		NSString *viewControllerName = @"PageSevenViewController";
		childController = (PageOneViewController *)[[PageSevenViewController alloc] initWithNibName:viewControllerName bundle:nil];
	}
	if (selectedSite == 8){
		NSLog(@"nrbuttonpressed if = 8 executed");
		NSString *viewControllerName = @"PageEightViewController";
		childController = (PageOneViewController *)[[PageEightViewController alloc] initWithNibName:viewControllerName bundle:nil];
	}
    if (selectedSite == 9){
        NSLog(@"nrbuttonpressed if = 9 executed");
        NSString *viewControllerName = @"PageNineViewController";
        childController = (PageOneViewController *)[[PageNineViewController alloc] initWithNibName:viewControllerName bundle:nil];
    }
    if (selectedSite == 10){
        NSLog(@"nrbuttonpressed if = 10 executed");
        NSString *viewControllerName = @"PageTenViewController";
        childController = (PageOneViewController *)[[PageTenViewController alloc] initWithNibName:viewControllerName bundle:nil];
    }
    if (selectedSite == 11){
        NSLog(@"nrbuttonpressed if = 11 executed");
        NSString *viewControllerName = @"PageElevenViewController";
        childController = (PageOneViewController *)[[PageElevenViewController alloc] initWithNibName:viewControllerName bundle:nil];
    }
    if (selectedSite == 12){
        NSLog(@"nrbuttonpressed if = 12 executed");
        NSString *viewControllerName = @"PageTwelveViewController";
        childController = (PageOneViewController *)[[PageTwelveViewController alloc] initWithNibName:viewControllerName bundle:nil];
    }

    
	childController.hidesBottomBarWhenPushed = YES;
	//childController.backButtonName = @"Map";
	[self.navigationController pushViewController:childController animated:YES];	}


-(void)viewWillDisppear:(BOOL)animated
{
	NSLog (@"viewwilldisappear executed");
	[super viewWillDisappear:animated];
}


- (void)dealloc {
		NSLog (@"tableview dealloc");
    [listData release];
	[myTableView release];
	[super dealloc];
}


@end

