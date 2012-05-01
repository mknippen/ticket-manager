//
//  ShowingViewController.m
//  TicketManager
//
//  Created by Matthew Knippen on 5/1/12.
//  Copyright (c) 2012 Zwiffer Inc. All rights reserved.
//

#import "ShowingViewController.h"
#import "Movie.h"
#import "Theatre.h"
#import "Showing.h"

@interface ShowingViewController ()

@end

@implementation ShowingViewController
@synthesize movie;
@synthesize theatre;
@synthesize showings;

@synthesize movieLabel;
@synthesize theatreLabel;
@synthesize showtimeTableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    if (movie) {
        movieLabel.text = movie.name;
    }
    
    if (theatre) {
        theatreLabel.text = theatre.name;
    }
    
    if (movie && theatre) {
        AppDelegate *ad = [UIApplication sharedApplication].delegate;
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Showing" inManagedObjectContext:ad.managedObjectContext];
        [fetchRequest setEntity:entity];
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"movie == %@ AND screen.theatre == %@", movie, theatre];
        [fetchRequest setPredicate:predicate];
        showings = [ad.managedObjectContext executeFetchRequest:fetchRequest error:nil];

        
        [showtimeTableView reloadData];
    }
}

- (void)viewDidUnload
{
    [self setMovieLabel:nil];
    [self setTheatreLabel:nil];
    [self setShowtimeTableView:nil];
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
    if (showings) {
        return [showings count];
    } else {
        return 0;
    }

}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Showing Times";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    // Configure the cell...
    Showing *obj = [showings objectAtIndex:indexPath.row];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    [dateFormatter setDateStyle:NSDateFormatterNoStyle];
    cell.textLabel.text = [dateFormatter stringFromDate:obj.timeStamp];

    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //Let people purchase tickets
}


@end
