//
//  ManagementViewController.h
//  TicketManager
//
//  Created by Matthew Knippen on 4/29/12.
//  Copyright (c) 2012 Zwiffer Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ManagementViewController : UIViewController


@property (strong, nonatomic) IBOutlet UIView *ownerView;

- (IBAction)managerSwitchChanged:(id)sender;

@end
