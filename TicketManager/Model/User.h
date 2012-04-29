#import "_User.h"

@interface User : _User {}
// Custom logic goes here.

+ (User *)loggedInUser;
+ (void)loginUser:(User *)user;

- (BOOL)isGuest;

@end
