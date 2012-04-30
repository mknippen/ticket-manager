//
//  UserHomepageViewController.m
//  TicketManager
//
//  Created by Matthew Knippen on 4/29/12.
//  Copyright (c) 2012 Zwiffer Inc. All rights reserved.
//

#import "UserHomepageViewController.h"
#import "User.h"
#import "Membership.h"

@interface UserHomepageViewController ()

@end

@implementation UserHomepageViewController
@synthesize usernameLabel;
@synthesize membershipLabel;
@synthesize pointsLabel;
@synthesize addressField;
@synthesize phoneField;
@synthesize emailField;
@synthesize user;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Homepage";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if (user == nil) {
        user = [User loggedInUser];
    }
    usernameLabel.text = user.userId;
    membershipLabel.text = user.membership.name;
    pointsLabel.text = [NSString stringWithFormat:@"%@", user.availableCreditPoints];
    addressField.text = user.address;
    phoneField.text = user.phone;
    emailField.text = user.emailId;
}

- (void)viewDidUnload
{
    [self setUsernameLabel:nil];
    [self setMembershipLabel:nil];
    [self setPointsLabel:nil];
    [self setAddressField:nil];
    [self setPhoneField:nil];
    [self setEmailField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

#pragma mark - UITextField Delegate

- (void)textFieldDidEndEditing:(UITextField *)textField {
    AppDelegate *ad = [UIApplication sharedApplication].delegate;
    
    user.address = addressField.text;
    user.phone = phoneField.text;
    user.emailId = emailField.text;
    
    [ad saveContext];
}


@end
