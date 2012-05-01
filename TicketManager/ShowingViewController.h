//
//  ShowingViewController.h
//  TicketManager
//
//  Created by Matthew Knippen on 5/1/12.
//  Copyright (c) 2012 Zwiffer Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Movie, Theatre;

@interface ShowingViewController : UIViewController {
    
}

@property (nonatomic, strong) Movie *movie;
@property (nonatomic, strong) Theatre *theatre;
@property (nonatomic, strong) NSArray *showings;

@property (strong, nonatomic) IBOutlet UILabel *movieLabel;
@property (strong, nonatomic) IBOutlet UILabel *theatreLabel;
@property (strong, nonatomic) IBOutlet UITableView *showtimeTableView;


@end
