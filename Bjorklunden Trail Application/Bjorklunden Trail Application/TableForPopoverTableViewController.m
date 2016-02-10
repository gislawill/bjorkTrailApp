//
//  TableForPopoverTableViewController.m
//  Bjorklunden Trail Application
//
//  Created by William Gislason on 7/31/14.
//  Copyright (c) 2014 Gislawill. All rights reserved.
//

#import "TableForPopoverTableViewController.h"
#import "Annotations.h"
@interface TableForPopoverTableViewController ()

@end

@implementation TableForPopoverTableViewController

-(id)initWithStyle:(UITableViewStyle)style
{
    if ([super initWithStyle:style] != nil) {
        
        //Initialize the array
        _featureNames = [NSMutableArray array];
        
        //Set up the array of colors.
        [_featureNames addObject:@"Nurse Stump"];
        [_featureNames addObject:@"Canopy Gap"];
        [_featureNames addObject:@"Cedars and Rocks"];
        [_featureNames addObject:@"A Broken Ground"];
        [_featureNames addObject:@"Björklunden Shoreline"];
        [_featureNames addObject:@"Ancient Shoreline"];
        [_featureNames addObject:@"Parasitic Plants"];
        [_featureNames addObject:@"A Tree's Blister"];
        [_featureNames addObject:@"Björk's Windmill"];
        [_featureNames addObject:@"Juniper Shrubland"];
        [_featureNames addObject:@"Quarry"];
        [_featureNames addObject:@"Switch in Forest"];
        
        //Make row selections persist.
        self.clearsSelectionOnViewWillAppear = NO;
        //Calculate how tall the view should be by multiplying
        //the individual row height by the total number of rows.
        NSInteger rowsCount = [_featureNames count];
        NSInteger singleRowHeight = [self.tableView.delegate tableView:self.tableView
                                               heightForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        NSInteger totalRowsHeight = rowsCount * singleRowHeight;
        
        //Calculate how wide the view should be by finding how
        //wide each string is expected to be
        CGFloat largestLabelWidth = 0;
        for (NSString *featureName in _featureNames) {
            //Checks size of text using the default font for UITableViewCell's textLabel.
            CGSize labelSize = [featureName sizeWithAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Light" size:16.0] }];
            if (labelSize.width > largestLabelWidth) {
                largestLabelWidth = labelSize.width;
            }
        }
        
        //Add a little padding to the width
        CGFloat popoverWidth = largestLabelWidth + 100;
        
        //Set the property to tell the popover container how big this view will be.
        self.preferredContentSize = CGSizeMake(popoverWidth, totalRowsHeight);
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return [_featureNames count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    cell.textLabel.text = [_featureNames objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *selectedFeature = [_featureNames objectAtIndex:indexPath.row];

    NSString *feature = [NSString alloc];
    
    //Set the color object based on the selected color name.
    if ([selectedFeature isEqualToString:@"Nurse Stump"]) {
        feature = @"Nurse Stump";
    } else if ([selectedFeature isEqualToString:@"Canopy Gap"]){
        feature = @"Canopy Gap";
    } else if ([selectedFeature isEqualToString:@"Cedars and Rocks"]) {
        feature = @"Cedars and Rocks";
    } else if ([selectedFeature isEqualToString:@"A Broken Ground"]) {
        feature = @"A Broken Ground";
    } else if ([selectedFeature isEqualToString:@"Björklunden Shoreline"]) {
        feature = @"Björklunden Shoreline";
    } else if ([selectedFeature isEqualToString:@"Ancient Shoreline"]) {
        feature = @"Ancient Shoreline";
    } else if ([selectedFeature isEqualToString:@"Parasitic Plants"]){
        feature = @"Parasitic Plants";
    } else if ([selectedFeature isEqualToString:@"A Tree's Blister"]){
        feature = @"A Tree's Blister";
    } else if ([selectedFeature isEqualToString:@"Björk's Windmill"]){
        feature = @"Björk's Windmill";
    } else if ([selectedFeature isEqualToString:@"Juniper Shrubland"]){
        feature = @"Juniper Shrubland";
    } else if ([selectedFeature isEqualToString:@"Quarry"]){
        feature = @"Quarry";
    } else if ([selectedFeature isEqualToString:@"Switch in Forest"]){
        feature = @"Switch in Forest";
    }

    
    //Notify the delegate if it exists.
    if (_delegate != nil) {
        [_delegate selectedFeature:feature];
    }
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
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
