//
//  DataAdder.h
//  TicketManager
//
//  Created by Matthew Knippen on 4/18/12.
//  Copyright (c) 2012 Zwiffer Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataAdder : NSObject

+ (void) populateData;

+ (void) populateNeededData;
+ (void) populateDummyData;

@end
