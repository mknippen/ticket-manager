//
//  ObjectListViewController.h
//  TicketManager
//
//  Created by Matthew Knippen on 4/22/12.
//  Copyright (c) 2012 Zwiffer Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ObjectListViewController : UITableViewController

@property (nonatomic, strong) NSString *objectType;
@property (nonatomic, strong) NSArray *objects;
@property (nonatomic, strong) NSPredicate *predicate;
@property (nonatomic, strong) NSManagedObject *parentObject;


@end
