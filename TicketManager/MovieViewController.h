//
//  MovieViewController.h
//  TicketManager
//
//  Created by Matthew Knippen on 4/30/12.
//  Copyright (c) 2012 Zwiffer Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Movie;

@interface MovieViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) Movie *movie;
@property (strong, nonatomic) IBOutlet UITableView *theatreTableView;
@property (strong, nonatomic) IBOutlet UITableView *reviewsTableView;
@property (strong, nonatomic) IBOutlet UILabel *starsLabel;
@property (strong, nonatomic) IBOutlet UILabel *directorsLabel;
@property (strong, nonatomic) IBOutlet UILabel *genresLabel;
@property (strong, nonatomic) IBOutlet UILabel *descLabel;
@property (nonatomic, strong) NSArray *theatres;
@property (nonatomic, strong) NSArray *reviews;


@end
