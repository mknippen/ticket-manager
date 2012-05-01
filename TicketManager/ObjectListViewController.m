//
//  ObjectListViewController.m
//  TicketManager
//
//  Created by Matthew Knippen on 4/22/12.
//  Copyright (c) 2012 Zwiffer Inc. All rights reserved.
//

#import "ObjectListViewController.h"
#import "AppDelegate.h"

#import "Theatre.h"
#import "Movie.h"
#import "Topic.h"
#import "Thread.h"
#import "Staff.h"
#import "Post.h"
#import "Screen.h"

#import "MovieViewController.h"
#import "TheatreViewController.h"

@interface ObjectListViewController ()

@end

@implementation ObjectListViewController

@synthesize objectType, objects, predicate, parentObject, renamedObject;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)getObjects {
    AppDelegate *ad = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:self.objectType inManagedObjectContext:ad.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    if (self.predicate) {
        [fetchRequest setPredicate:self.predicate];
    }
    
    NSError *error = nil;
    NSArray *fetchedObjects = [ad.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"O crap. ObjectListVC");
    }

    self.objects = fetchedObjects;
    [self.tableView reloadData];
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    
    if (self.objectType) {
        self.title = self.objectType;
    }

    [self getObjects];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    
    if (![self.objectType isEqualToString:@"Topic"]) {    
        UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonPressed:)];
        self.navigationItem.rightBarButtonItem = addButton;
    }
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
    if (objects) {
        return [objects count];
    } else {
        return 0;
    }
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
    
    if ([objectType isEqualToString:@"Screen"]) {
        cell.textLabel.text = [NSString stringWithFormat:@"Screen %i", indexPath.row+1];
    } else {
        cell.textLabel.text = obj.name;

    }

    
    if ([objectType isEqualToString:@"Theatre"]) {
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    }
    
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


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        Theatre *t = [objects objectAtIndex:indexPath.row];
        AppDelegate *ad = [UIApplication sharedApplication].delegate;
        [ad.managedObjectContext deleteObject:t];
        [ad saveContext];
        [self getObjects];
        //[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


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
    if ([self.objectType isEqualToString:@"Topic"]) {    
        Topic *t = [objects objectAtIndex:indexPath.row];
        NSPredicate *newPredicate = [NSPredicate predicateWithFormat:@"topic == %@", t];
        ObjectListViewController *olvc = [[ObjectListViewController alloc] init];
        olvc.objectType = @"Thread";
        olvc.parentObject = t;
        olvc.predicate = newPredicate;
        [self.navigationController pushViewController:olvc animated:YES];
    } else if ([self.objectType isEqualToString:@"Thread"]) {
        Thread *t = [objects objectAtIndex:indexPath.row];
        NSPredicate *newPredicate = [NSPredicate predicateWithFormat:@"thread == %@", t];
        ObjectListViewController *olvc = [[ObjectListViewController alloc] init];
        olvc.objectType = @"Post";
        olvc.parentObject = t;
        olvc.predicate = newPredicate;
        [self.navigationController pushViewController:olvc animated:YES];
    } else if ([self.objectType isEqualToString:@"Movie"]) {
        MovieViewController *mv = [[MovieViewController alloc] initWithNibName:@"MovieViewController" bundle:nil];
        mv.movie = [objects objectAtIndex:indexPath.row];
        AppDelegate *ad = [UIApplication sharedApplication].delegate;
        UINavigationController *nav = [ad.splitViewController.viewControllers objectAtIndex:1];
        [nav pushViewController:mv animated:YES];
    } else if ([self.objectType isEqualToString:@"Theatre"]) {
        TheatreViewController *mv = [[TheatreViewController alloc] initWithNibName:@"TheatreViewController" bundle:nil];
        mv.theatre = [objects objectAtIndex:indexPath.row];
        AppDelegate *ad = [UIApplication sharedApplication].delegate;
        UINavigationController *nav = [ad.splitViewController.viewControllers objectAtIndex:1];
        [nav pushViewController:mv animated:YES];
    }
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    //Theatre Disclosure Pressed
    Theatre *t = (Theatre *)[objects objectAtIndex:indexPath.row];
    NSPredicate *newPredicate = [NSPredicate predicateWithFormat:@"theatre == %@", t];
    ObjectListViewController *olvc = [[ObjectListViewController alloc] init];
    olvc.objectType = @"Screen";
    olvc.parentObject = t;
    olvc.predicate = newPredicate;
    [self.navigationController pushViewController:olvc animated:YES];
}

#pragma mark - Action Methods

- (void)notLoggedInAlert {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"You must be logged in and have the correct access to do that." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

- (void)getNameForObject {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Enter Name" message:@"Please enter a name." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
}

- (void)addButtonPressed:(id)sender {
    AppDelegate *ad = (AppDelegate *)[UIApplication sharedApplication].delegate;
    BOOL manageMovie = [[NSUserDefaults standardUserDefaults] boolForKey:@"managerCreatesMovies"];
    
    if ([self.objectType isEqualToString:@"Movie"]) {
        if ([Staff ownerMode] || (manageMovie && [Staff managementMode])) {
            Movie *m = [Movie insertInManagedObjectContext:ad.managedObjectContext];
            m.name = @"New Movie";
            renamedObject = (Theatre *)m;
            [self getNameForObject];
        } else {
            [self notLoggedInAlert];
        }
    } else if ([self.objectType isEqualToString:@"Theatre"]) {
        if ([Staff ownerMode]) {
            Theatre *t = [Theatre insertInManagedObjectContext:ad.managedObjectContext];
            t.name = @"New Theatre";
            renamedObject = (Theatre *)t;
            [self getNameForObject];
        } else {
            [self notLoggedInAlert];
        }
    } else if ([self.objectType isEqualToString:@"Staff"]) {
        if ([Staff ownerMode]) {
            Staff *s = [Staff insertInManagedObjectContext:ad.managedObjectContext];
            s.name = @"New Staff";
            renamedObject = (Theatre *)s;
        } else {
            [self notLoggedInAlert];
        }
    } else if ([self.objectType isEqualToString:@"Screen"]) {
        if ([Staff ownerMode]) {
            Screen *s = [Screen insertInManagedObjectContext:ad.managedObjectContext];
            s.capacity = [NSNumber numberWithInt:500];
            s.theatre = (Theatre *)parentObject;
        } else {
            [self notLoggedInAlert];
        }
    } else if ([self.objectType isEqualToString:@"Thread"]) {
        if ([User loggedInUser]) {        
            Thread *t = [Thread insertInManagedObjectContext:ad.managedObjectContext];
            t.name = @"New Thread";
            t.topic = (Topic *)parentObject;
            t.userStarted = [User loggedInUser];
            renamedObject = (Theatre *)t;
            [self getNameForObject];
            [[User loggedInUser] addPoints:10];
        } else {
            [self notLoggedInAlert];
        }
    } else if ([self.objectType isEqualToString:@"Post"]) {
        if ([User loggedInUser]) {        
            Post *p = [Post insertInManagedObjectContext:ad.managedObjectContext];
            p.name = @"New Name";
            p.thread = (Thread *)parentObject;
            p.writer = [User loggedInUser];
            renamedObject = (Theatre *)p;
            [self getNameForObject];
            [[User loggedInUser] addPoints:5];
        } else {
            [self notLoggedInAlert];
        }
    }
    
    [self getObjects];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    renamedObject.name = [alertView textFieldAtIndex:0].text;
    [self getObjects];
}


@end
