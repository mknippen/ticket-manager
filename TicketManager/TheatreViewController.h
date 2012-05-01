//
//  TheatreViewController.h
//  TicketManager
//
//  Created by Matthew Knippen on 5/1/12.
//  Copyright (c) 2012 Zwiffer Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Theatre;

@interface TheatreViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) Theatre *theatre;

@property (strong, nonatomic) IBOutlet UITableView *movieTableView;
@property (strong, nonatomic) IBOutlet UITableView *reviewsTableView;
@property (strong, nonatomic) IBOutlet UILabel *addressLabel;

@property (nonatomic, strong) NSArray *movies;
@property (nonatomic, strong) NSArray *reviews;

@end
