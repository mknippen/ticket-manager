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

@interface ObjectListViewController ()

@end

@implementation ObjectListViewController

@synthesize objectType, objects, predicate, parentObject;

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
    cell.textLabel.text = obj.name;
    
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
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        //TODO: delete from Core Data
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
    }
}

#pragma mark - Action Methods

- (void)addButtonPressed:(id)sender {
    AppDelegate *ad = (AppDelegate *)[UIApplication sharedApplication].delegate;

    if ([self.objectType isEqualToString:@"Movie"]) {
        Movie *m = [Movie insertInManagedObjectContext:ad.managedObjectContext];
        m.name = @"New Movie";
    } else if ([self.objectType isEqualToString:@"Theatre"]) {
        Theatre *t = [Theatre insertInManagedObjectContext:ad.managedObjectContext];
        t.name = @"New Theatre";
    } else if ([self.objectType isEqualToString:@"Staff"]) {
        Staff *s = [Staff insertInManagedObjectContext:ad.managedObjectContext];
        s.name = @"New Staff";
    } else if ([self.objectType isEqualToString:@"Thread"]) {
        Thread *t = [Thread insertInManagedObjectContext:ad.managedObjectContext];
        t.name = @"New Thread";
        t.topic = (Topic *)parentObject;
    } else if ([self.objectType isEqualToString:@"Post"]) {
        Post *p = [Post insertInManagedObjectContext:ad.managedObjectContext];
        p.name = @"New Name";
        p.thread = (Thread *)parentObject;
    }
    
    [self getObjects];
    
//    [NSClassFromString(objectType) ];
//    [Theatre insertInManagedObjectContext:<#(NSManagedObjectContext *)#>
    //NSManagedObject *object = [[NSManagedObject alloc] initWithEntity:<#(NSEntityDescription *)#> insertIntoManagedObjectContext:<#(NSManagedObjectContext *)#>]
}

@end
