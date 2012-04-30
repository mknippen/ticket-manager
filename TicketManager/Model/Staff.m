#import "Staff.h"
#import "Function.h"


@implementation Staff

// Custom logic goes here.

+ (BOOL)managementMode {
    User *u = [User loggedInUser];
    if (u && u.isStaff && ((Staff *)u).isManager) {
        return YES;
    } else {
        return NO;
    }
}

+ (BOOL)ownerMode {
    User *u = [User loggedInUser];
    if (u && u.isStaff && ((Staff *)u).isManager) {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)isOwner {
    if ([self.function.name isEqualToString:@"Owner"] || [self.function.name isEqualToString:@"Administrator"]) {
        return YES;
    } else {
        return NO;
    }
}
 //admin has same rights as the owner, until that changes, these are equivalent
- (BOOL)isAdmin {
    return [self isOwner];
}

- (BOOL)isManager {
    if ([self isOwner] || [self.function.name isEqualToString:@"Manager"]) {
        return YES;
    } else {
        return NO;
    }
}

@end
