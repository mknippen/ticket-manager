//
//  QueryDetailViewController.h
//  TicketManager
//
//  Created by Matthew Knippen on 4/30/12.
//  Copyright (c) 2012 Zwiffer Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QueryDetailViewController : UIViewController

@property (nonatomic) int queryNum; 
@property (strong, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (strong, nonatomic) IBOutlet UITableView *resultsTableView;
@property (nonatomic, strong) NSArray *objects;
@property (strong, nonatomic) IBOutlet UIButton *pointsButton;
@property (nonatomic, strong) NSManagedObjectContext *moc;
- (IBAction)plusPointsPressed:(id)sender;

@end
