//
//  QueryDetailViewController.m
//  TicketManager
//
//  Created by Matthew Knippen on 4/30/12.
//  Copyright (c) 2012 Zwiffer Inc. All rights reserved.
//

#import "QueryDetailViewController.h"
#import "Theatre.h"

@interface QueryDetailViewController ()

@end

@implementation QueryDetailViewController

@synthesize queryNum;
@synthesize descriptionTextView;
@synthesize resultsTableView;
@synthesize objects;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        objects = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = [NSString stringWithFormat:@"Query %i", queryNum];
}

- (NSString *)descriptionForQuery {
    switch (queryNum) {
        case 1:
            return @"Display the 10 most recent discussions/comments from a specific discussion thread.";
        case 2:
            return @"Display the 10 most recent discussions/comments from all discussion threads.";
        case 3:
            return @"Display the least popular discussion thread in terms of visits and comments.";
        case 4:
            return @"Display an alert to a registered guest when his membership status has changed.";
        case 5:
            return @"Display the registered guest who has contributed the most comments.";
        case 6:
            return @"Display the theatres that are showing the most number of movies.";
        case 7:
            return @"Display the list of all employees who are on duty on Monday on a specific theatre. Display also their job and time table.";
        case 8:
            return @"Send an alert to the owner and manager if no employee with the job of security is scheduled to work tomorrow.";
        default:
            return nil;
            break;
    }
}

- (void)viewDidUnload
{
    [self setDescriptionTextView:nil];
    [self setResultsTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

#pragma mark - UITableViewMethods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [objects count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Results";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    // Configure the cell...
    Theatre *obj = (Theatre *)[objects objectAtIndex:indexPath.row];
    
    cell.textLabel.text = obj.name;
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //Shouldnt need anything here.
}


@end
