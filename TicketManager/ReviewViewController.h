//
//  ReviewViewController.h
//  TicketManager
//
//  Created by Matthew Knippen on 5/1/12.
//  Copyright (c) 2012 Zwiffer Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Review;

@interface ReviewViewController : UIViewController

@property (nonatomic, strong) Review *review;
@property (strong, nonatomic) IBOutlet UILabel *writerLabel;
@property (strong, nonatomic) IBOutlet UITextView *reviewTextView;

- (IBAction)likedReviewPressed:(id)sender;
- (IBAction)dislikedReviewPressed:(id)sender;

@end
