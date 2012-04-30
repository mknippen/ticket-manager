#import "_Staff.h"

@interface Staff : _Staff {}
// Custom logic goes here.

+ (BOOL)managementMode;
+ (BOOL)ownerMode;


//owner / admin
- (BOOL)isOwner;


//admin has same rights as the owner, until that changes, these are equivalent
- (BOOL)isAdmin; 

//owner/admin/manager
- (BOOL)isManager;

- (NSString *)name;

@end
