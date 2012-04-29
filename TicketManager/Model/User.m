#import "User.h"

@implementation User

static User *loggedIn = nil;

+ (User *)loggedInUser {
    return loggedIn;
}

+ (void)loginUser:(User *)user {
    loggedIn = user;
}

// Custom logic goes here.
- (BOOL)isGuest {
    if (self.ccType) {
        return YES;
    } else {
        return NO;
    }
}


@end
