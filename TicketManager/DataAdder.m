//
//  DataAdder.m
//  TicketManager
//
//  Created by Matthew Knippen on 4/18/12.
//  Copyright (c) 2012 Zwiffer Inc. All rights reserved.
//

#import "DataAdder.h"
#import "AppDelegate.h"

#import "Function.h"
#import "Genre.h"
#import "Membership.h"
#import "Movie.h"
#import "Post.h"
#import "Review.h"
#import "Screen.h"
#import "Shift.h"
#import "Showing.h"
#import "Staff.h"
#import "Theatre.h"
#import "Thread.h"
#import "Topic.h"
#import "User.h"

@implementation DataAdder

+ (void) populateData {
    [self populateNeededData];
    [self populateDummyData];
}


+ (void) populateNeededData {
    AppDelegate *ad = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    Genre *genre = [Genre insertInManagedObjectContext:ad.managedObjectContext];
    genre.name = @"Drama";
    genre = [Genre insertInManagedObjectContext:ad.managedObjectContext];
    genre.name = @"Adventure";
    genre = [Genre insertInManagedObjectContext:ad.managedObjectContext];
    genre.name = @"Sci-Fi";
    genre = [Genre insertInManagedObjectContext:ad.managedObjectContext];
    genre.name = @"Love Story";
    genre = [Genre insertInManagedObjectContext:ad.managedObjectContext];
    genre.name = @"Comedy";
    genre = [Genre insertInManagedObjectContext:ad.managedObjectContext];
    genre.name = @"Family";
    
    Topic *topic = [Topic insertInManagedObjectContext:ad.managedObjectContext];
    topic.name = @"Movies";
    topic = [Topic insertInManagedObjectContext:ad.managedObjectContext];
    topic.name = @"Theatre Experience";
    
    Function *function = [Function insertInManagedObjectContext:ad.managedObjectContext];
    function.name = @"Owner";
    function.duties = @"Controls everything. He literally owns the place.";
    function = [Function insertInManagedObjectContext:ad.managedObjectContext];
    function.name = @"Administrator";
    function.duties = @"Controls everything. Runs the program.";
    function = [Function insertInManagedObjectContext:ad.managedObjectContext];
    function.name = @"Manager";
    function.duties = @"Runs the shift. Can hire and fire.";
    function = [Function insertInManagedObjectContext:ad.managedObjectContext];
    function.name = @"Ticket Staff";
    function.duties = @"Handles Tickets";
    function = [Function insertInManagedObjectContext:ad.managedObjectContext];
    function.name = @"Cleaning Staff";
    function.duties = @"Makes sure everything is nice and clean";
    function = [Function insertInManagedObjectContext:ad.managedObjectContext];
    function.name = @"Security";
    function.duties = @"Carries around a whistle and yells at teenagers.";
    function = [Function insertInManagedObjectContext:ad.managedObjectContext];
    function.name = @"Snack Service Providers";
    function.duties = @"Makes sure that everyone gets the yummys.";
    
    Membership *mem = [Membership insertInManagedObjectContext:ad.managedObjectContext];
    mem.name = @"None";
    mem.pointsNeeded = [NSNumber numberWithInt:0];
    mem = [Membership insertInManagedObjectContext:ad.managedObjectContext];
    mem.name = @"Silver";
    mem.pointsNeeded = [NSNumber numberWithInt:1000];
    mem = [Membership insertInManagedObjectContext:ad.managedObjectContext];
    mem.name = @"Gold";
    mem.pointsNeeded = [NSNumber numberWithInt:5000];
    mem = [Membership insertInManagedObjectContext:ad.managedObjectContext];
    mem.name = @"Platnium";
    mem.pointsNeeded = [NSNumber numberWithInt:25000];
    
    
    [ad.managedObjectContext save:nil];
}

+ (void) populateDummyData {
    
}


@end
