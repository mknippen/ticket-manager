#import "_User.h"

@interface User : _User {}
// Custom logic goes here.

+ (User *)loggedInUser;
+ (void)loginUser:(User *)user;

+ (User *)userWithUserId:(NSString *)userId;

- (BOOL)isGuest;
- (BOOL)isStaff;

- (void)addPoints:(int)points;

@end
