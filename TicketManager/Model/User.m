#import "User.h"
#import "Membership.h"
@implementation User

static User *loggedIn = nil;

+ (User *)loggedInUser {
    return loggedIn;
}

+ (void)loginUser:(User *)user {
    loggedIn = user;
    [user checkMembership];
}

+ (User *)userWithUserId:(NSString *)userId {
    AppDelegate *ad = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:ad.managedObjectContext];
    [fetchRequest setEntity:entity];

    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"userId == %@", userId];
    [fetchRequest setPredicate:predicate];

    NSError *error = nil;
    NSArray *fetchedObjects = [ad.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil || fetchedObjects.count == 0) {
        NSLog(@"No User found.");
        return nil;
    } else {
        return (User *)[fetchedObjects objectAtIndex:0];
    }
}

// Custom logic goes here.
- (BOOL)isGuest {
    if (self.ccType) {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)isStaff {
    if ([self respondsToSelector:@selector(ssn)]) {
        return YES;
    } else {
        return NO;
    }
}

- (void)checkMembership {
    AppDelegate *ad = [UIApplication sharedApplication].delegate;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Membership" inManagedObjectContext:ad.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSArray *fetchedObjects = [ad.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    
    Membership *oldMembership = self.membership;
    
    Membership *plat;
    Membership *gold;
    Membership *silver;
    Membership *none;
    
    for (Membership *mem in fetchedObjects) {
        if ([mem.name isEqualToString:@"Platnium"]) {
            plat = mem;
        } else if ([mem.name isEqualToString:@"Gold"]) {
            gold = mem;
        } else if ([mem.name isEqualToString:@"Silver"]) {
            silver = mem;
        } else {
            none = mem;
        }
    }
    
    int total = self.totalCreditPoints.intValue;
    if (total >= plat.pointsNeeded.intValue) {
        self.membership = plat;
    } else if (total >= gold.pointsNeeded.intValue) {
        self.membership = gold;
    } else if (total >= silver.pointsNeeded.intValue) {
        self.membership = silver;
    } else {
        self.membership = none;
    }
    
    
    BOOL changed = NO;
    if (oldMembership) {
        if ([oldMembership.name isEqualToString:@"None"]) {
            if (self.membership == silver || self.membership == gold || self.membership == plat) {
                changed = YES;
            }
        } else if ([oldMembership.name isEqualToString:@"Silver"]) {
            if (self.membership == gold || self.membership == plat) {
                changed = YES;
            }
        } else if ([oldMembership.name isEqualToString:@"Gold"]) {
            if (self.membership == plat) {
                changed = YES;
            }
        }
    }
    
    if (changed) {
        //inform the user of this change
        [self performSelectorOnMainThread:@selector(membershipLevelUp) withObject:nil waitUntilDone:NO];
    }
}

- (void)membershipLevelUp {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Level Up!" message:[NSString stringWithFormat:@"You have reached a new membership level. Your level is now %@!", self.membership.name] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

- (void)addPoints:(int)points {
    int total = self.totalCreditPoints.intValue + points;
    int avail = self.availableCreditPoints.intValue + points;
    self.totalCreditPoints = [NSNumber numberWithInt:total];
    self.availableCreditPoints = [NSNumber numberWithInt:avail];
    [self checkMembership];
}

@end
