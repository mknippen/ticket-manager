//
//  MasterViewController.m
//  TicketManager
//
//  Created by Matthew Knippen on 4/18/12.
//  Copyright (c) 2012 Zwiffer Inc. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"
#import "ObjectListViewController.h"
#import "LoginViewController.h"
#import "User.h"
#import "Staff.h"
#import "UserHomepageViewController.h"
#import "ManagementViewController.h"
#import "QueryListViewController.h"

@interface MasterViewController ()
- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;
@end

@implementation MasterViewController

@synthesize detailViewController = _detailViewController;
@synthesize fetchedResultsController = __fetchedResultsController;
@synthesize managedObjectContext = __managedObjectContext;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Menu";
        self.clearsSelectionOnViewWillAppear = NO;
        self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //self.navigationItem.leftBarButtonItem = self.editButtonItem;

//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
//    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)viewDidAppear:(BOOL)animated {
    [self.tableView reloadData];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

//- (void)insertNewObject:(id)sender
//{
//    NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
//    NSEntityDescription *entity = [[self.fetchedResultsController fetchRequest] entity];
//    NSManagedObject *newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:context];
//    
//    // If appropriate, configure the new managed object.
//    // Normally you should use accessor methods, but using KVC here avoids the need to add a custom class to the template.
//    [newManagedObject setValue:[NSDate date] forKey:@"timeStamp"];
//    
//    // Save the context.
//    NSError *error = nil;
//    if (![context save:&error]) {
//         // Replace this implementation with code to handle the error appropriately.
//         // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
//        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
//        abort();
//    }
//}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if ([Staff managementMode]) {
        return 7;
    }
    
    return 6;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void)userInfoPressed {
    
    UINavigationController *detailNav = [self.splitViewController.viewControllers objectAtIndex:1];
    if ([User loggedInUser]) {
        UserHomepageViewController *uh = [[UserHomepageViewController alloc] initWithNibName:@"UserHomepageViewController" bundle:nil];
        [detailNav pushViewController:uh animated:YES];
    } else {
        LoginViewController *lvc = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
        [detailNav pushViewController:lvc animated:YES];
    }
}

- (void)queryPressed {
    QueryListViewController *q = [[QueryListViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:q animated:YES];
}

- (void)managerPressed {
    ManagementViewController *vc = [[ManagementViewController alloc] initWithNibName:@"ManagementViewController" bundle:nil];
    UINavigationController *detailNav = [self.splitViewController.viewControllers objectAtIndex:1];
    [detailNav pushViewController:vc animated:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSManagedObject *object = [[self fetchedResultsController] objectAtIndexPath:indexPath];
//    self.detailViewController.detailItem = object;
    
    ObjectListViewController *olvc = [[ObjectListViewController alloc] init];


    switch (indexPath.row) {
        case 0:
            olvc.objectType = @"Theatre";
            break;
        case 1:
            olvc.objectType = @"Movie";
            break;
        case 2:            
            [self userInfoPressed];
            break;
        case 3:
            olvc.objectType = @"Topic";
            break;
        case 4:
            olvc.objectType = @"Staff";
            break;
        case 5:
            [self queryPressed];
            break;
        case 6:
            [self managerPressed];
            break;
        default:
            break;
    }  
    
    if (indexPath.row != 2 && indexPath.row != 5  && indexPath.row != 6) {
        [self.navigationController pushViewController:olvc animated:YES];
    }

}

#pragma mark - Fetched results controller

//- (NSFetchedResultsController *)fetchedResultsController
//{
//    if (__fetchedResultsController != nil) {
//        return __fetchedResultsController;
//    }
//    
//    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
//    // Edit the entity name as appropriate.
//    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Event" inManagedObjectContext:self.managedObjectContext];
//    [fetchRequest setEntity:entity];
//    
//    // Set the batch size to a suitable number.
//    [fetchRequest setFetchBatchSize:20];
//    
//    // Edit the sort key as appropriate.
//    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"timeStamp" ascending:NO];
//    NSArray *sortDescriptors = [NSArray arrayWithObjects:sortDescriptor, nil];
//    
//    [fetchRequest setSortDescriptors:sortDescriptors];
//    
//    // Edit the section name key path and cache name if appropriate.
//    // nil for section name key path means "no sections".
//    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:@"Master"];
//    aFetchedResultsController.delegate = self;
//    self.fetchedResultsController = aFetchedResultsController;
//    
//	NSError *error = nil;
//	if (![self.fetchedResultsController performFetch:&error]) {
//	     // Replace this implementation with code to handle the error appropriately.
//	     // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
//	    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
//	    abort();
//	}
//    
//    return __fetchedResultsController;
//}    

//- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
//{
//    [self.tableView beginUpdates];
//}
//
//- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
//           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
//{
//    switch(type) {
//        case NSFetchedResultsChangeInsert:
//            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
//            break;
//            
//        case NSFetchedResultsChangeDelete:
//            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
//            break;
//    }
//}
//
//- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
//       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
//      newIndexPath:(NSIndexPath *)newIndexPath
//{
//    UITableView *tableView = self.tableView;
//    
//    switch(type) {
//        case NSFetchedResultsChangeInsert:
//            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
//            break;
//            
//        case NSFetchedResultsChangeDelete:
//            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
//            break;
//            
//        case NSFetchedResultsChangeUpdate:
//            [self configureCell:[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
//            break;
//            
//        case NSFetchedResultsChangeMove:
//            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
//            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]withRowAnimation:UITableViewRowAnimationFade];
//            break;
//    }
//}

//- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
//{
//    [self.tableView endUpdates];
//}

// Implementing the above methods to update the table view in response to individual changes may have performance implications if a large number of changes are made simultaneously. If this proves to be an issue, you can instead just implement controllerDidChangeContent: which notifies the delegate that all section and object changes have been processed. 
 
 - (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    // In the simplest, most efficient, case, reload the table view.
    [self.tableView reloadData];
}


- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Theatres";
            break;
        case 1:
            cell.textLabel.text = @"Movies";
            break;
        case 2:
            cell.textLabel.text = @"User Info";
            break;
        case 3:
            cell.textLabel.text = @"Forum";
            break;
        case 4:
            cell.textLabel.text = @"Staff";
            break;
        case 5:
            cell.textLabel.text = @"Queries";
            break;
        case 6:
            cell.textLabel.text = @"Managment Console";
            break;
        default:
            break;
    }    
    
    if (indexPath.row == 2 && [Staff managementMode]) {
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    }
    
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    //Theatre Disclosure Pressed
    ObjectListViewController *olvc = [[ObjectListViewController alloc] init];
    olvc.objectType = @"User";
    [self.navigationController pushViewController:olvc animated:YES];
}

@end
