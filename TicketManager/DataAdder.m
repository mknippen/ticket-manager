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
    AppDelegate *ad = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    Theatre *theatre1 = [Theatre insertInManagedObjectContext:ad.managedObjectContext];
    theatre1.name = @"Knippen Theatres";
    theatre1.address = @"123 Fake St.";
    
    Screen *screen1 = [Screen insertInManagedObjectContext:ad.managedObjectContext];
    screen1.id = [NSNumber numberWithInt:0];
    screen1.theatre = theatre1;
    screen1.capacity = [NSNumber numberWithInt:400];
    Screen *screen2 = [Screen insertInManagedObjectContext:ad.managedObjectContext];
    screen2.id = [NSNumber numberWithInt:1];
    screen2.theatre = theatre1;
    screen2.capacity = [NSNumber numberWithInt:400];
    
    Movie *movie1 = [Movie insertInManagedObjectContext:ad.managedObjectContext];
    movie1.name = @"The Avengers";
    movie1.stars = @"Robert Downey Jr., Chris Hemsworth, Scarlett Johansson";
    movie1.desc = @"All of the best superheroes getting together.";
    movie1.directors = @"Joss Whedon";
    [movie1 addGenresObject:[Genre adventureGenre]];
    Movie *movie2 = [Movie insertInManagedObjectContext:ad.managedObjectContext];
    movie2.name = @"The Hunger Games";
    movie2.desc = @"Teens killing each other. Blockbuster.";
    movie2.stars = @"Liam Hensworth, Jennifer Lawerence";
    movie2.directors = @"Gary Ross";

    [movie2 addGenresObject:[Genre adventureGenre]];
    Movie *movie3 = [Movie insertInManagedObjectContext:ad.managedObjectContext];
    movie3.name = @"Titanic 3D";
    movie3.desc = @"10 Year old movie, now with glasses.";
    movie3.stars = @"Kate Winslet, Leonardo DiCaprio";
    movie3.directors = @"James Cameron";

    [movie3 addGenresObject:[Genre loveGenre]];
    [movie3 addGenresObject:[Genre dramaGenre]];
    Movie *movie4 = [Movie insertInManagedObjectContext:ad.managedObjectContext];
    movie4.name = @"21 Jump Street";
    movie4.desc = @"Police and Drugs. 'Nuff said.";
    movie4.stars = @"Channing Tatum, Jonah Hill";
    movie4.directors = @"Phil Lord, Chris Miller";
    [movie4 addGenresObject:[Genre comedyGenre]];

    Showing *s1 = [Showing insertInManagedObjectContext:ad.managedObjectContext];
    s1.timeStamp = [NSDate date];
    s1.movie = movie1;
    s1.screen = screen2;
    Showing *s2 = [Showing insertInManagedObjectContext:ad.managedObjectContext];
    s2.timeStamp = [NSDate date];
    s2.movie = movie1;
    s2.screen = screen1;
    Showing *s3 = [Showing insertInManagedObjectContext:ad.managedObjectContext];
    s3.timeStamp = [NSDate date];
    s3.movie = movie2;
    s3.screen = screen1;
    Showing *s4 = [Showing insertInManagedObjectContext:ad.managedObjectContext];
    s4.timeStamp = [NSDate date];
    s4.movie = movie3;
    s4.screen = screen1;
    Showing *s5 = [Showing insertInManagedObjectContext:ad.managedObjectContext];
    s5.timeStamp = [NSDate date];
    s5.movie = movie1;
    s5.screen = screen2;
    
    Staff *admin = [Staff insertInManagedObjectContext:ad.managedObjectContext];
    admin.userId = @"admin";
    admin.password = @"admin";
    admin.ssn = @"1";
    
    Staff *manager = [Staff insertInManagedObjectContext:ad.managedObjectContext];
    manager.userId = @"manager";
    manager.password = @"manager";
    manager.ssn = @"2";
    
    Staff *owner = [Staff insertInManagedObjectContext:ad.managedObjectContext];
    owner.userId = @"owner";
    owner.password = @"owner";
    owner.ssn = @"8";
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Function" inManagedObjectContext:ad.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSArray *fetchedObjects = [ad.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    
    for (Function *f in fetchedObjects) {
        if ([f.name isEqualToString:@"Owner"]) {
            owner.function = f;
        } else if ([f.name isEqualToString:@"Manager"]) {
            manager.function = f;
        } else if ([f.name isEqualToString:@"Administrator"]) {
            admin.function = f;
        }
    }
    
    [ad.managedObjectContext save:nil];
                     
}


@end
