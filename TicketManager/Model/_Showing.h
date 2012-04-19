// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Showing.h instead.

#import <CoreData/CoreData.h>


extern const struct ShowingAttributes {
	__unsafe_unretained NSString *id;
	__unsafe_unretained NSString *timeStamp;
} ShowingAttributes;

extern const struct ShowingRelationships {
	__unsafe_unretained NSString *movie;
	__unsafe_unretained NSString *screen;
	__unsafe_unretained NSString *usersAttending;
} ShowingRelationships;

extern const struct ShowingFetchedProperties {
} ShowingFetchedProperties;

@class Movie;
@class Screen;
@class User;




@interface ShowingID : NSManagedObjectID {}
@end

@interface _Showing : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ShowingID*)objectID;




@property (nonatomic, strong) NSNumber* id;


@property int32_t idValue;
- (int32_t)idValue;
- (void)setIdValue:(int32_t)value_;

//- (BOOL)validateId:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSDate* timeStamp;


//- (BOOL)validateTimeStamp:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Movie* movie;

//- (BOOL)validateMovie:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) Screen* screen;

//- (BOOL)validateScreen:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSSet* usersAttending;

- (NSMutableSet*)usersAttendingSet;





@end

@interface _Showing (CoreDataGeneratedAccessors)

- (void)addUsersAttending:(NSSet*)value_;
- (void)removeUsersAttending:(NSSet*)value_;
- (void)addUsersAttendingObject:(User*)value_;
- (void)removeUsersAttendingObject:(User*)value_;

@end

@interface _Showing (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveId;
- (void)setPrimitiveId:(NSNumber*)value;

- (int32_t)primitiveIdValue;
- (void)setPrimitiveIdValue:(int32_t)value_;




- (NSDate*)primitiveTimeStamp;
- (void)setPrimitiveTimeStamp:(NSDate*)value;





- (Movie*)primitiveMovie;
- (void)setPrimitiveMovie:(Movie*)value;



- (Screen*)primitiveScreen;
- (void)setPrimitiveScreen:(Screen*)value;



- (NSMutableSet*)primitiveUsersAttending;
- (void)setPrimitiveUsersAttending:(NSMutableSet*)value;


@end
