//
//  DemoViewController.m
//  DemonstrationApp
//
//  Created by Chris on 11/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SimpleDemoViewController.h"

@interface SimpleDemoViewController()

@end

@implementation SimpleDemoViewController


@synthesize inputField;
@synthesize listView;
@synthesize listData;


- (void)viewDidLoad
{
    [super viewDidLoad];

    self.listData = [[NSMutableArray alloc] init];
    
    for(int i=0; i<5; i++)
    {
        ListObject *item = [[ListObject alloc] init];
        item.text = [NSString stringWithFormat:@"%d", i];
        [self.listData addObject: item];
    }
    
    //Don't need to call reloadData here; this code block occurs before the table is initialized
    //[self.listView reloadData];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction) add_pressed 
{

    //The text from the TextField is taken and put into an object
    NSString *inputString = [inputField text];
    ListObject *newItem = [[ListObject alloc] init];
    newItem.text = inputString;
    
    //We want the new cell to be added directly beneth the last cell in the table view, cell N
    //The first index of a NSArray is 0, so using the array's count as an index will 
    //get us an index to cell N+1 in the table view
    NSInteger row = [[self listData] count];
    //Our NSArray is a NSMutableArray, so it will resize itself automatically
    [[self listData] addObject: newItem];
    
    //The table view is signalled to insert a new cell at the indicated row
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
    [self.listView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];    
    //the table view's datasource delegate will now execute the cellForRowAtIndexPath method.
}

/*****************************/
#pragma mark Table View delegate and datasource methods
/*****************************/

// Customize the number of rows in the table view.

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{

    NSInteger rows =[[self listData] count];
    return rows;

}



// Customize the appearance of table view cells.

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{

    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    //By using the variable 'indexPath' to retrieve items from the NSMutableArray, we create a 1:1 matching
    //of entries in the Array to rows in the table view
    ListObject *listItem = [self.listData objectAtIndex:[indexPath row]];

    if (cell == nil) 
    {        
        //uses the default styling for the cell
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];        
    }
    

    [[cell textLabel] setText:listItem.text];
  
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
    
    // open a alert with an OK and cancel button
    
    NSString *alertString = [NSString stringWithFormat:@"Clicked on row #%d", [indexPath row]];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:alertString message:@"" delegate:self cancelButtonTitle:@"Done" otherButtonTitles:nil];
    
    [alert show];
    [alert release];
    
}

/*****************************/
#pragma mark TextField delegate methods
/*****************************/

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [textField resignFirstResponder];
    return YES;
    
}
@end
