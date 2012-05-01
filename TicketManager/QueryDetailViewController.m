//
//  QueryDetailViewController.m
//  TicketManager
//
//  Created by Matthew Knippen on 4/30/12.
//  Copyright (c) 2012 Zwiffer Inc. All rights reserved.
//

#import "QueryDetailViewController.h"
#import "Theatre.h"
#import "User.h"
#import "Movie.h"
#import "Thread.h"

@interface QueryDetailViewController ()

@end

@implementation QueryDetailViewController

@synthesize queryNum;
@synthesize descriptionTextView;
@synthesize resultsTableView;
@synthesize objects;
@synthesize pointsButton;
@synthesize moc;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        objects = [[NSMutableArray alloc] init];
        AppDelegate *ad = [UIApplication sharedApplication].delegate;
        moc = ad.managedObjectContext;
    }
    return self;
}

- (NSString *)descriptionForQuery {
    switch (queryNum) {
        case 1:
            return @"Display the 10 most recent discussions/comments from a specific discussion thread. \n Specific Post: ";
        case 2:
            return @"Display the 10 most recent discussions/comments from all discussion threads.";
        case 3:
            return @"Display the least popular discussion thread in terms of visits and comments.";
        case 4:
            return @"Display an alert to a registered guest when his membership status has changed. MAKE SURE TO LOGIN FOR THIS TO WORK.";
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = [NSString stringWithFormat:@"Query %i", queryNum];
    self.descriptionTextView.text = [self descriptionForQuery];
    [self getResults];
}

- (void)query1 {
    //get the thread
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Thread" inManagedObjectContext:moc];
    [fetchRequest setEntity:entity];
    NSArray *fetchedObjects = [moc executeFetchRequest:fetchRequest error:nil];
    Thread *parameter;
    for (Thread *t in fetchedObjects) {
        if ([t.name isEqualToString:@"Best Popcorn Ever!"]) {
            parameter = t;
        }
    }
    
    //get the posts
    fetchRequest = [[NSFetchRequest alloc] init];
    entity = [NSEntityDescription entityForName:@"Post" inManagedObjectContext:moc];
    [fetchRequest setEntity:entity];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"thread == %@", parameter];
    [fetchRequest setPredicate:predicate];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"dateCreated" ascending:NO];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    [fetchRequest setSortDescriptors:sortDescriptors];
    objects = [moc executeFetchRequest:fetchRequest error:nil];

    if (objects.count > 10) {
        objects = [NSArray arrayWithObjects:[objects objectAtIndex:0], [objects objectAtIndex:1], [objects objectAtIndex:2], [objects objectAtIndex:3], [objects objectAtIndex:4], [objects objectAtIndex:5], [objects objectAtIndex:6], [objects objectAtIndex:7], [objects objectAtIndex:8], [objects objectAtIndex:9], nil];
    }
}

- (void)query2 {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Post" inManagedObjectContext:moc];
    [fetchRequest setEntity:entity];
    NSArray *objs = [moc executeFetchRequest:fetchRequest error:nil];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"dateCreated" ascending:YES];
    //displays all users, sorted by posts
    objects = [objs sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    if (objects.count > 10) {
        objects = [NSArray arrayWithObjects:[objects objectAtIndex:0], [objects objectAtIndex:1], [objects objectAtIndex:2], [objects objectAtIndex:3], [objects objectAtIndex:4], [objects objectAtIndex:5], [objects objectAtIndex:6], [objects objectAtIndex:7], [objects objectAtIndex:8], [objects objectAtIndex:9], nil];
    }
}

- (void)query3 {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Thread" inManagedObjectContext:moc];
    [fetchRequest setEntity:entity];
    NSArray *objs = [moc executeFetchRequest:fetchRequest error:nil];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"posts.@count" ascending:YES];
    //displays all users, sorted by posts
    objects = [objs sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    objects = [NSArray arrayWithObject:[objects objectAtIndex:0]];
}

- (void)query4 {
    self.pointsButton.hidden = NO;
}

- (void)query5 {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:moc];
    [fetchRequest setEntity:entity];
    NSArray *objs = [moc executeFetchRequest:fetchRequest error:nil];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"postsWritten.@count" ascending:NO];
    //displays all users, sorted by posts
    objects = [objs sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    objects = [NSArray arrayWithObject:[objects objectAtIndex:0]];
}

- (void)query6 {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Theatre" inManagedObjectContext:moc];
    [fetchRequest setEntity:entity];
    NSArray *objs = [moc executeFetchRequest:fetchRequest error:nil];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"movies.@count" ascending:NO];
    //displays all theatres, sorted by # of movies
    objects = [objs sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    int max = ((Theatre *)[objects objectAtIndex:0]).movies.count;
    NSMutableSet *set = [[NSMutableSet alloc] initWithCapacity:5];
    for (Theatre *t in objects) {
        if (t.movies.count == max) {
            [set addObject:t];
        }
    }
    objects = [set allObjects];
}

- (void)query7 {
    
}

- (void)query8 {
    
}



- (void)getResults {
    switch (queryNum) {
        case 1:
            [self query1];
            break;
        case 2:
            [self query2];
            break;
        case 3:
            [self query3];
            break;
        case 4:
            [self query4];
            break;
        case 5:
            [self query5];
            break;
        case 6:
            [self query6];
            break;
        case 7:
            [self query7];
            break;
        case 8:
            [self query8];        
            break;
        default:
            break;
    }
    
    [resultsTableView reloadData];
}


- (void)viewDidUnload
{
    [self setDescriptionTextView:nil];
    [self setResultsTableView:nil];
    [self setPointsButton:nil];
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
    //cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //Shouldnt need anything here.
}


- (IBAction)plusPointsPressed:(id)sender {
    [[User loggedInUser] addPoints:1000];
}
@end
