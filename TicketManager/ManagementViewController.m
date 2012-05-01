//
//  ManagementViewController.m
//  TicketManager
//
//  Created by Matthew Knippen on 4/29/12.
//  Copyright (c) 2012 Zwiffer Inc. All rights reserved.
//

#import "ManagementViewController.h"

@interface ManagementViewController ()

@end

@implementation ManagementViewController
@synthesize ownerView;

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
    [self setOwnerView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (IBAction)managerSwitchChanged:(UISwitch *)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:sender.on forKey:@"managerCreatesMovies"];
    [defaults synchronize];
}
@end
