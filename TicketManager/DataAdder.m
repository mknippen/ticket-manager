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
    [Genre adventureGenre];
    
    
    Theatre *theatre1 = [Theatre insertInManagedObjectContext:ad.managedObjectContext];
    theatre1.name = @"Knippen Theatres";
    theatre1.address = @"123 Fake St.";
    
    Theatre *theatre2 = [Theatre insertInManagedObjectContext:ad.managedObjectContext];
    theatre2.name = @"Other Theatres";
    theatre2.address = @"456 Fake St.";
    
    Screen *screen1 = [Screen insertInManagedObjectContext:ad.managedObjectContext];
    screen1.id = [NSNumber numberWithInt:0];
    screen1.theatre = theatre1;
    screen1.capacity = [NSNumber numberWithInt:400];
    Screen *screen2 = [Screen insertInManagedObjectContext:ad.managedObjectContext];
    screen2.id = [NSNumber numberWithInt:1];
    screen2.theatre = theatre1;
    screen2.capacity = [NSNumber numberWithInt:600];
    Screen *screen3 = [Screen insertInManagedObjectContext:ad.managedObjectContext];
    screen3.id = [NSNumber numberWithInt:2];
    screen3.theatre = theatre1;
    screen3.capacity = [NSNumber numberWithInt:500];
    
    Screen *screen4 = [Screen insertInManagedObjectContext:ad.managedObjectContext];
    screen4.id = [NSNumber numberWithInt:3];
    screen4.theatre = theatre2;
    screen4.capacity = [NSNumber numberWithInt:100];
    Screen *screen5 = [Screen insertInManagedObjectContext:ad.managedObjectContext];
    screen5.id = [NSNumber numberWithInt:4];
    screen5.theatre = theatre2;
    screen5.capacity = [NSNumber numberWithInt:200];
    
    
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

    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"HH:mm"];
    NSString *time;
    
    Showing *s1 = [Showing insertInManagedObjectContext:ad.managedObjectContext];
    time = @"16:00";
    s1.timeStamp = [dateFormat dateFromString:time];
    s1.movie = movie1;
    s1.screen = screen2;
    Showing *s2 = [Showing insertInManagedObjectContext:ad.managedObjectContext];
    time = @"10:30";
    s2.timeStamp = [dateFormat dateFromString:time];
    s2.movie = movie1;
    s2.screen = screen1;
    Showing *s3 = [Showing insertInManagedObjectContext:ad.managedObjectContext];
    time = @"14:30";
    s3.timeStamp = [dateFormat dateFromString:time];
    s3.movie = movie2;
    s3.screen = screen1;
    Showing *s4 = [Showing insertInManagedObjectContext:ad.managedObjectContext];
    time = @"22:45";
    s4.timeStamp = [dateFormat dateFromString:time];
    s4.movie = movie3;
    s4.screen = screen1;
    Showing *s5 = [Showing insertInManagedObjectContext:ad.managedObjectContext];
    time = @"11:30";
    s5.timeStamp = [dateFormat dateFromString:time];
    s5.movie = movie1;
    s5.screen = screen2;
    
    Showing *s6 = [Showing insertInManagedObjectContext:ad.managedObjectContext];
    time = @"16:30";
    s6.timeStamp = [dateFormat dateFromString:time];
    s6.movie = movie2;
    s6.screen = screen4;
    Showing *s7 = [Showing insertInManagedObjectContext:ad.managedObjectContext];
    time = @"10:15";
    s7.timeStamp = [dateFormat dateFromString:time];
    s7.movie = movie4;
    s7.screen = screen4;
    Showing *s8 = [Showing insertInManagedObjectContext:ad.managedObjectContext];
    time = @"12:00";
    s8.timeStamp = [dateFormat dateFromString:time];
    s8.movie = movie4;
    s8.screen = screen5;
    
    Staff *admin = [Staff insertInManagedObjectContext:ad.managedObjectContext];
    admin.userId = @"admin";
    admin.name = @"admin";
    admin.password = @"admin";
    admin.address = @"3241 S. Wabash, Chicago, IL 60616";
    admin.emailId = @"admin@zwiffer.com";
    admin.phone = @"7089453679";
    admin.ssn = @"1";
    Staff *manager = [Staff insertInManagedObjectContext:ad.managedObjectContext];
    manager.userId = @"manager";
    manager.name = @"manager";
    manager.password = @"manager";
    manager.address = @"1872 E. Lincoln Highway. New Lenox, IL 60451";
    manager.emailId = @"phil@zwiffer.com";
    manager.phone = @"7089457445";
    manager.ssn = @"2";
    
    Staff *owner = [Staff insertInManagedObjectContext:ad.managedObjectContext];
    owner.userId = @"owner";
    owner.name = @"owner";
    owner.password = @"owner";
    owner.address = @"233 S. Wacker Dr. Chicago, IL 60606";
    owner.emailId = @"owner@zwiffer.com";
    owner.phone = @"3125911035";
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
    
    Review *review1 = [Review insertInManagedObjectContext:ad.managedObjectContext];
    review1.theatre = theatre1;
    review1.writer = admin;
    review1.desc = @"Best movie theatre ever! I go all the time.";
    Review *review2 = [Review insertInManagedObjectContext:ad.managedObjectContext];
    review2.theatre = theatre1;
    review2.writer = manager;
    review2.desc = @"Great Service. Great People.";
    Review *review3 = [Review insertInManagedObjectContext:ad.managedObjectContext];
    review3.theatre = theatre2;
    review3.writer = manager;
    review3.desc = @"Just not quite the expierence of Knippen Theatres. If I had to choose what theatre to go to, it would not be this one again. Please never go here unless the movie is sold out at Knippen's!";
    
    Review *review4 = [Review insertInManagedObjectContext:ad.managedObjectContext];
    review4.movie = movie1;
    review4.writer = admin;
    review4.desc = @"Pure Awesomeness.";
    Review *review5 = [Review insertInManagedObjectContext:ad.managedObjectContext];
    review5.movie = movie4;
    review5.writer = manager;
    review5.desc = @"Funny, But Not Hilarious.";
    
    fetchRequest = [[NSFetchRequest alloc] init];
    entity = [NSEntityDescription entityForName:@"Topic" inManagedObjectContext:ad.managedObjectContext];
    [fetchRequest setEntity:entity];
    fetchedObjects = [ad.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    Topic *theatreExp;
    Topic *movieExp;
    
    
    for (Topic *t in fetchedObjects) {
        if ([t.name isEqualToString:@"Movies"]) {
            movieExp = t;
        } else {
            theatreExp = t;
        }
    }
    
    User *u1 = [User insertInManagedObjectContext:ad.managedObjectContext];
    u1.name = @"matt";
    u1.userId = @"matt";
    u1.password = @"abcd";
    u1.emailId = @"matt@zwiffer.com";
    u1.phone = @"7089453679";
    u1.address = @"1011 Fake St. Chicago IL 60606";
    u1.ccType = @"Visa";
    u1.ccNumber = @"4640123412341234";
    u1.ccExpiration= [NSDate distantFuture];
    
    User *u2 = [User insertInManagedObjectContext:ad.managedObjectContext];
    u2.name = @"mom";
    u2.userId = @"mom";
    u2.password = @"abcd";
    u2.emailId = @"mom@zwiffer.com";
    u2.phone = @"7089453678";
    u2.address = @"1011 Fake St. Chicago IL 60606";
    u2.ccType = @"Visa";
    u2.ccNumber = @"4640123412341234";
    u2.ccExpiration= [NSDate distantFuture];
    
    Thread *t1 = [Thread insertInManagedObjectContext:ad.managedObjectContext];
    t1.movie = movie1;
    t1.topic = movieExp;
    t1.dateCreated = [NSDate distantPast];
    t1.name = @"Pure Awesomeness";
    t1.userStarted = admin;
    Thread *t2 = [Thread insertInManagedObjectContext:ad.managedObjectContext];
    t2.theatre = theatre1;
    t2.topic = theatreExp;
    t2.dateCreated = [NSDate date];
    t2.name = @"Best Popcorn Ever!";
    t2.userStarted = manager;
    
    Post *p1 = [Post insertInManagedObjectContext:ad.managedObjectContext];
    p1.thread = t1;
    p1.dateCreated = [NSDate distantPast];
    p1.name = @"So many heroes.";
    p1.writer = u1;
    Post *p2 = [Post insertInManagedObjectContext:ad.managedObjectContext];
    p2.thread = t1;
    p2.dateCreated = [NSDate distantPast];
    p2.name = @"Like for real, there are a lot of heroes.";
    p2.writer = owner;
    
    Post *p3 = [Post insertInManagedObjectContext:ad.managedObjectContext];
    p3.thread = t2;
    p3.dateCreated = [NSDate distantPast];
    p3.name = @"I think this may have been the best popcorn I have had in my life. I will go back just to eat some of that stuff.";
    p3.writer = admin;
    Post *p4 = [Post insertInManagedObjectContext:ad.managedObjectContext];
    p4.thread = t2;
    p4.dateCreated = [NSDate date];
    p4.name = @"I agree, that stuff is awesome.";
    p4.writer = u2;
    
    [ad.managedObjectContext save:nil];
}


@end
