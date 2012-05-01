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
#import "Genre.h"
#import "TheatreViewController.h"
#import "ReviewViewController.h"
#import "ShowingViewController.h"

@interface MovieViewController ()

@end

@implementation MovieViewController

@synthesize movie;
@synthesize theatreTableView;
@synthesize reviewsTableView;
@synthesize starsLabel;
@synthesize directorsLabel;
@synthesize genresLabel;
@synthesize descLabel;
@synthesize theatres;
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
    
    if (movie) {
        self.title = movie.name;
        starsLabel.text = movie.stars;
        directorsLabel.text = movie.directors;
        descLabel.text = movie.desc;
        
        NSMutableString *str = [[NSMutableString alloc] initWithCapacity:10];
        for (Genre *g in movie.genres) {
            [str appendString:g.name];
            [str appendString:@", "];
        }
        
        if (str.length > 2) {
            genresLabel.text = [str substringToIndex:str.length-2];
        } else {
            genresLabel.text = @"";
        }
                
        theatres = [movie.theatres allObjects];
        reviews = [movie.reviews allObjects];
        [theatreTableView reloadData];
        [reviewsTableView reloadData];
    }
}

- (void)viewDidUnload
{
    [self setTheatreTableView:nil];
    [self setStarsLabel:nil];
    [self setDirectorsLabel:nil];
    [self setGenresLabel:nil];
    [self setReviewsTableView:nil];
    [self setDescLabel:nil];
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
    if (tableView == theatreTableView) {
        if (theatres) {
            return [theatres count];
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
    if (tableView == theatreTableView) {
        return @"Theatres";
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
    
    if (tableView == theatreTableView) {
        obj = (Theatre *)[theatres objectAtIndex:indexPath.row];
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    } else {
        obj = (Theatre *)[reviews objectAtIndex:indexPath.row];
    }
    
    cell.textLabel.text = obj.name;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == theatreTableView) {
        //Show the times page
        ShowingViewController *vc = [[ShowingViewController alloc] initWithNibName:nil bundle:nil];
        vc.movie = movie;
        vc.theatre = [theatres objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    } else {
        //Show the review details
        ReviewViewController *vc = [[ReviewViewController alloc] initWithNibName:nil bundle:nil];
        vc.review = [reviews objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    //Show the theatre page
    TheatreViewController *vc = [[TheatreViewController alloc] initWithNibName:nil bundle:nil];
    id t = [theatres objectAtIndex:indexPath.row];
    vc.theatre = t;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
