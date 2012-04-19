// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Membership.h instead.

#import <CoreData/CoreData.h>


extern const struct MembershipAttributes {
	__unsafe_unretained NSString *id;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *pointsNeeded;
} MembershipAttributes;

extern const struct MembershipRelationships {
	__unsafe_unretained NSString *users;
} MembershipRelationships;

extern const struct MembershipFetchedProperties {
} MembershipFetchedProperties;

@class User;





@interface MembershipID : NSManagedObjectID {}
@end

@interface _Membership : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (MembershipID*)objectID;




@property (nonatomic, strong) NSNumber* id;


@property int32_t idValue;
- (int32_t)idValue;
- (void)setIdValue:(int32_t)value_;

//- (BOOL)validateId:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* name;


//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* pointsNeeded;


@property int32_t pointsNeededValue;
- (int32_t)pointsNeededValue;
- (void)setPointsNeededValue:(int32_t)value_;

//- (BOOL)validatePointsNeeded:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet* users;

- (NSMutableSet*)usersSet;





@end

@interface _Membership (CoreDataGeneratedAccessors)

- (void)addUsers:(NSSet*)value_;
- (void)removeUsers:(NSSet*)value_;
- (void)addUsersObject:(User*)value_;
- (void)removeUsersObject:(User*)value_;

@end

@interface _Membership (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveId;
- (void)setPrimitiveId:(NSNumber*)value;

- (int32_t)primitiveIdValue;
- (void)setPrimitiveIdValue:(int32_t)value_;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSNumber*)primitivePointsNeeded;
- (void)setPrimitivePointsNeeded:(NSNumber*)value;

- (int32_t)primitivePointsNeededValue;
- (void)setPrimitivePointsNeededValue:(int32_t)value_;





- (NSMutableSet*)primitiveUsers;
- (void)setPrimitiveUsers:(NSMutableSet*)value;


@end
