//
//  TheatreViewController.m
//  TicketManager
//
//  Created by Matthew Knippen on 5/1/12.
//  Copyright (c) 2012 Zwiffer Inc. All rights reserved.
//

#import "TheatreViewController.h"
#import "Theatre.h"
#import "MovieViewController.h"

@interface TheatreViewController ()

@end

@implementation TheatreViewController
@synthesize theatre;
@synthesize movieTableView;
@synthesize reviewsTableView;
@synthesize addressLabel;
@synthesize movies;
@synthesize reviews;

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
    
    if (theatre) {
        self.title = theatre.name;
        addressLabel.text = theatre.address;
        
        movies = [theatre.movies allObjects];
        reviews = [theatre.reviews allObjects];
        [movieTableView reloadData];
        [reviewsTableView reloadData];
    }
    
}

- (void)viewDidUnload
{
    [self setMovieTableView:nil];
    [self setReviewsTableView:nil];
    [self setAddressLabel:nil];
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
    if (tableView == movieTableView) {
        if (movies) {
            return [movies count];
        } else {
            return 0;
        }
    } else {
        if (reviews) {
            return [reviews count];
        } else {
            return 0;
        }
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (tableView == movieTableView) {
        return @"Movies";
    } else {
        return @"Reviews";
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
    Theatre *obj;
    
    if (tableView == movieTableView) {
        obj = (Theatre *)[movies objectAtIndex:indexPath.row];
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    } else {
        obj = (Theatre *)[reviews objectAtIndex:indexPath.row];
    }
    
    cell.textLabel.text = obj.name;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == movieTableView) {
        //Show the times page
        
    } else {
        //Show the review details
    }
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    //Show the movie page
    MovieViewController *vc = [[MovieViewController alloc] initWithNibName:nil bundle:nil];
    id movie = [movies objectAtIndex:indexPath.row];
    vc.movie = movie;
    [self.navigationController pushViewController:vc animated:YES];
    
}



@end
