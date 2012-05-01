//
//  ReviewViewController.m
//  TicketManager
//
//  Created by Matthew Knippen on 5/1/12.
//  Copyright (c) 2012 Zwiffer Inc. All rights reserved.
//

#import "ReviewViewController.h"
#import "Review.h"
#import "User.h"

@interface ReviewViewController ()

@end

@implementation ReviewViewController
@synthesize review;
@synthesize writerLabel;
@synthesize reviewTextView;

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
    if (review) {
        writerLabel.text = review.writer.name;
        reviewTextView.text = review.desc;
    }
}

- (void)viewDidUnload
{
    [self setWriterLabel:nil];
    [self setReviewTextView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (IBAction)likedReviewPressed:(id)sender {
    User * u = [User loggedInUser];
    if (u) {
        [review addUsersLikedObject:u];
        [review removeUsersDislikedObject:u];
    }
}

- (IBAction)dislikedReviewPressed:(id)sender {
    User * u = [User loggedInUser];
    if (u) {
        [review addUsersDislikedObject:u];
        [review removeUsersLikedObject:u];
    }
}

@end
