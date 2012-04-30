//
//  UserInfoViewController.m
//  TicketManager
//
//  Created by Matthew Knippen on 4/28/12.
//  Copyright (c) 2012 Zwiffer Inc. All rights reserved.
//

#import "LoginViewController.h"
#import "User.h"
#import "UserHomepageViewController.h"

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
    loggedInCheck = NO;
    
    
    [self checkLoginStatus];
}

- (void)checkLoginStatus {
    if ([User loggedInUser]) {
        NSLog(@"Logged In");
        UserHomepageViewController *homepage = [[UserHomepageViewController alloc] initWithNibName:@"UserHomepageViewController" bundle:nil];
        [self.navigationController pushViewController:homepage animated:YES];
    } else {
        NSLog(@"Not Logged In");
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
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
    [usernameField resignFirstResponder];
    [passwordField resignFirstResponder];
    
    if ([usernameField.text isEqualToString:@""] || [passwordField.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Please Try Again" message:@"The username or password cannot be blank" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    } else {
        User *userFromField = [User userWithUserId:usernameField.text];
        if (userFromField) {
            NSLog(@"Got A User");
            if ([userFromField.password isEqualToString:passwordField.text]) {
                [User loginUser:userFromField];
                [self checkLoginStatus];
            } else {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Password Incorrect" message:@"The password was incorrect. Please try again." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                [alert show];
            }
        } else {
            NSLog(@"Didnt get A User");
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Username Not Found" message:@"The username was not found. Please try again." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }
    }
}

- (QRootElement *)accountRoot {
    QRootElement *root = [[QRootElement alloc] init];
    root.title = @"Create an Account";
    root.grouped = YES;
    
    QSection *section = [[QSection alloc] init];
    QEntryElement *name = [[QEntryElement alloc] initWithTitle:@"Username:" Value:nil Placeholder:nil];
    QEntryElement *pass = [[QEntryElement alloc] initWithTitle:@"Create a Password:" Value:nil Placeholder:nil];
    QEntryElement *pass2 = [[QEntryElement alloc] initWithTitle:@"Confirm Password:" Value:nil Placeholder:nil];
    pass.secureTextEntry = YES;
    pass2.secureTextEntry = YES;
    QEntryElement *email = [[QEntryElement alloc] initWithTitle:@"Email:" Value:nil Placeholder:@"example@email.com"];
    QEntryElement *phone = [[QEntryElement alloc] initWithTitle:@"Phone Number:" Value:nil Placeholder:nil];
    phone.keyboardType = UIKeyboardTypePhonePad;
    QEntryElement *address = [[QEntryElement alloc] initWithTitle:@"Street Address:" Value:nil Placeholder:nil];
    [section addElement:name];
    [section addElement:pass];
    [section addElement:pass2];
    [section addElement:email];
    [section addElement:phone];
    [section addElement:address];
    
    QSection *section2 = [[QSection alloc] init];
    QEntryElement *ccNum = [[QEntryElement alloc] initWithTitle:@"Credit Card Number:" Value:nil Placeholder:nil];
    ccNum.keyboardType = UIKeyboardTypePhonePad;
    QRadioElement *ccType = [[QRadioElement alloc] initWithItems:[NSArray arrayWithObjects:@"Visa", @"MasterCard", @"Discover", @"American Express", nil] selected:0 title:@"Credit Card Type:"];
    QRadioElement *ccExpirationMonth = [[QRadioElement alloc] initWithItems:[NSArray arrayWithObjects:@"01", @"02", @"03", @"04", @"05", @"06", @"07", @"08", @"09", @"10", @"11", @"12", nil] selected:0 title:@"Credit Card Expiration Month:"];
    QRadioElement *ccExpirationYear = [[QRadioElement alloc] initWithItems:[NSArray arrayWithObjects:@"2012", @"2013", @"2014", @"2015", @"2016", @"2017", @"2018", @"2019", @"2020", nil] selected:0 title:@"Credit Card Expiration Year:"];
    [section2 addElement:ccNum];
    [section2 addElement:ccType];
    [section2 addElement:ccExpirationMonth];
    [section2 addElement:ccExpirationYear];
    
    QSection *section3 = [[QSection alloc] init];    
    QButtonElement *createButton = [[QButtonElement alloc] initWithTitle:@"Create Account"];
    createButton.onSelected = ^ {
        AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        User *newUser = [User insertInManagedObjectContext:appDelegate.managedObjectContext];
        newUser.userId = name.textValue;
        newUser.name = name.textValue;
        newUser.password = pass.textValue;
        newUser.emailId = email.textValue;
        newUser.phone = phone.textValue;
        newUser.address = address.textValue;
        newUser.ccNumber = ccNum.textValue;
        NSString *expDateStr = [NSString stringWithFormat:@"%@%@", ccExpirationYear.textValue, ccExpirationMonth.textValue];
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyyMM"];
        newUser.ccExpiration = [dateFormat dateFromString:expDateStr];  
        newUser.ccType = ccType.textValue;
        [appDelegate saveContext];
        [User loginUser:newUser];
        [self.navigationController popViewControllerAnimated:YES];
    };
    
    [section3 addElement:createButton];
    
    [root addSection:section];
    [root addSection:section2];
    [root addSection:section3];
    return root;
}

- (IBAction)createButtonPressed:(id)sender {
    QuickDialogController *controller = [QuickDialogController controllerForRoot:[self accountRoot]];
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark - UITextField Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField  == usernameField) {
        [passwordField becomeFirstResponder];
    } else {
        //[passwordField resignFirstResponder];
        [self loginButtonPressed:self];
    }
    
    return YES;
}

@end
