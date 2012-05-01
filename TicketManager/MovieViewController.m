//
//  MovieViewController.m
//  TicketManager
//
//  Created by Matthew Knippen on 4/30/12.
//  Copyright (c) 2012 Zwiffer Inc. All rights reserved.
//

#import "MovieViewController.h"
#import "Movie.h"
#import "Theatre.h"

@interface MovieViewController ()

@end

@implementation MovieViewController

@synthesize movie;
@synthesize theatreTableView;
@synthesize starsLabel;
@synthesize directorsLabel;
@synthesize theatres;

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
    
    if (movie) {
        self.title = movie.name;
        starsLabel.text = movie.stars;
        directorsLabel.text = movie.directors;
        theatres = [movie.theatres allObjects];
        [theatreTableView reloadData];
    }
}

- (void)viewDidUnload
{
    [self setTheatreTableView:nil];
    [self setStarsLabel:nil];
    [self setDirectorsLabel:nil];
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
    if (theatres) {
        return [theatres count];
    } else {
        return 0;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Theatres";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    // Configure the cell...
    Theatre *obj = (Theatre *)[theatres objectAtIndex:indexPath.row];
    
    cell.textLabel.text = obj.name;
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //Show the times page
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    //Show the theatre page
}

@end
