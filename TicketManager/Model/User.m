#import "User.h"

@implementation User

// Custom logic goes here.
- (BOOL)isGuest {
    if (self.ccType) {
        return YES;
    } else {
        return NO;
    }
}


@end
