// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Theatre.h instead.

#import <CoreData/CoreData.h>


extern const struct TheatreAttributes {
	__unsafe_unretained NSString *address;
	__unsafe_unretained NSString *id;
	__unsafe_unretained NSString *name;
} TheatreAttributes;

extern const struct TheatreRelationships {
	__unsafe_unretained NSString *reviews;
	__unsafe_unretained NSString *screens;
	__unsafe_unretained NSString *staff;
} TheatreRelationships;

extern const struct TheatreFetchedProperties {
} TheatreFetchedProperties;

@class Review;
@class Screen;
@class Staff;





@interface TheatreID : NSManagedObjectID {}
@end

@interface _Theatre : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (TheatreID*)objectID;




@property (nonatomic, strong) NSString* address;


//- (BOOL)validateAddress:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* id;


@property int32_t idValue;
- (int32_t)idValue;
- (void)setIdValue:(int32_t)value_;

//- (BOOL)validateId:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* name;


//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet* reviews;

- (NSMutableSet*)reviewsSet;




@property (nonatomic, strong) NSSet* screens;

- (NSMutableSet*)screensSet;




@property (nonatomic, strong) NSSet* staff;

- (NSMutableSet*)staffSet;





@end

@interface _Theatre (CoreDataGeneratedAccessors)

- (void)addReviews:(NSSet*)value_;
- (void)removeReviews:(NSSet*)value_;
- (void)addReviewsObject:(Review*)value_;
- (void)removeReviewsObject:(Review*)value_;

- (void)addScreens:(NSSet*)value_;
- (void)removeScreens:(NSSet*)value_;
- (void)addScreensObject:(Screen*)value_;
- (void)removeScreensObject:(Screen*)value_;

- (void)addStaff:(NSSet*)value_;
- (void)removeStaff:(NSSet*)value_;
- (void)addStaffObject:(Staff*)value_;
- (void)removeStaffObject:(Staff*)value_;

@end

@interface _Theatre (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveAddress;
- (void)setPrimitiveAddress:(NSString*)value;




- (NSNumber*)primitiveId;
- (void)setPrimitiveId:(NSNumber*)value;

- (int32_t)primitiveIdValue;
- (void)setPrimitiveIdValue:(int32_t)value_;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;





- (NSMutableSet*)primitiveReviews;
- (void)setPrimitiveReviews:(NSMutableSet*)value;



- (NSMutableSet*)primitiveScreens;
- (void)setPrimitiveScreens:(NSMutableSet*)value;



- (NSMutableSet*)primitiveStaff;
- (void)setPrimitiveStaff:(NSMutableSet*)value;


@end
