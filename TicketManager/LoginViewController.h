//
//  UserInfoViewController.h
//  TicketManager
//
//  Created by Matthew Knippen on 4/28/12.
//  Copyright (c) 2012 Zwiffer Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *usernameField;
@property (strong, nonatomic) IBOutlet UITextField *passwordField;

- (IBAction)loginButtonPressed:(id)sender;
- (IBAction)createButtonPressed:(id)sender;


@end
