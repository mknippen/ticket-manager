// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Review.h instead.

#import <CoreData/CoreData.h>


extern const struct ReviewAttributes {
	__unsafe_unretained NSString *desc;
	__unsafe_unretained NSString *id;
} ReviewAttributes;

extern const struct ReviewRelationships {
	__unsafe_unretained NSString *movie;
	__unsafe_unretained NSString *theatre;
	__unsafe_unretained NSString *usersDisliked;
	__unsafe_unretained NSString *usersLiked;
	__unsafe_unretained NSString *writer;
} ReviewRelationships;

extern const struct ReviewFetchedProperties {
} ReviewFetchedProperties;

@class Movie;
@class Theatre;
@class User;
@class User;
@class User;




@interface ReviewID : NSManagedObjectID {}
@end

@interface _Review : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ReviewID*)objectID;




@property (nonatomic, strong) NSString* desc;


//- (BOOL)validateDesc:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* id;


@property int32_t idValue;
- (int32_t)idValue;
- (void)setIdValue:(int32_t)value_;

//- (BOOL)validateId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Movie* movie;

//- (BOOL)validateMovie:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) Theatre* theatre;

//- (BOOL)validateTheatre:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSSet* usersDisliked;

- (NSMutableSet*)usersDislikedSet;




@property (nonatomic, strong) User* usersLiked;

//- (BOOL)validateUsersLiked:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) User* writer;

//- (BOOL)validateWriter:(id*)value_ error:(NSError**)error_;





@end

@interface _Review (CoreDataGeneratedAccessors)

- (void)addUsersDisliked:(NSSet*)value_;
- (void)removeUsersDisliked:(NSSet*)value_;
- (void)addUsersDislikedObject:(User*)value_;
- (void)removeUsersDislikedObject:(User*)value_;

@end

@interface _Review (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveDesc;
- (void)setPrimitiveDesc:(NSString*)value;




- (NSNumber*)primitiveId;
- (void)setPrimitiveId:(NSNumber*)value;

- (int32_t)primitiveIdValue;
- (void)setPrimitiveIdValue:(int32_t)value_;





- (Movie*)primitiveMovie;
- (void)setPrimitiveMovie:(Movie*)value;



- (Theatre*)primitiveTheatre;
- (void)setPrimitiveTheatre:(Theatre*)value;



- (NSMutableSet*)primitiveUsersDisliked;
- (void)setPrimitiveUsersDisliked:(NSMutableSet*)value;



- (User*)primitiveUsersLiked;
- (void)setPrimitiveUsersLiked:(User*)value;



- (User*)primitiveWriter;
- (void)setPrimitiveWriter:(User*)value;


@end
