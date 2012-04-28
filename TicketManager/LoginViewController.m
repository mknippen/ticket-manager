//
//  UserInfoViewController.m
//  TicketManager
//
//  Created by Matthew Knippen on 4/28/12.
//  Copyright (c) 2012 Zwiffer Inc. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize usernameField;
@synthesize passwordField;

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
}

- (void)viewDidUnload
{
    [self setUsernameField:nil];
    [self setPasswordField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (IBAction)loginButtonPressed:(id)sender {
    NSLog(@"Logging in.");
}

- (IBAction)createButtonPressed:(id)sender {
    NSLog(@"Create an account");
}

#pragma mark - UITextField Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField  == usernameField) {
        [passwordField becomeFirstResponder];
    } else {
        [passwordField resignFirstResponder];
        [self loginButtonPressed:self];
    }
}

@end
