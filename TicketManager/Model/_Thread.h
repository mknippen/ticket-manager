// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Thread.h instead.

#import <CoreData/CoreData.h>


extern const struct ThreadAttributes {
	__unsafe_unretained NSString *dateCreated;
	__unsafe_unretained NSString *id;
	__unsafe_unretained NSString *name;
} ThreadAttributes;

extern const struct ThreadRelationships {
	__unsafe_unretained NSString *movie;
	__unsafe_unretained NSString *posts;
	__unsafe_unretained NSString *theatre;
	__unsafe_unretained NSString *topic;
	__unsafe_unretained NSString *userStarted;
} ThreadRelationships;

extern const struct ThreadFetchedProperties {
} ThreadFetchedProperties;

@class Movie;
@class Post;
@class Theatre;
@class Topic;
@class User;





@interface ThreadID : NSManagedObjectID {}
@end

@interface _Thread : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ThreadID*)objectID;




@property (nonatomic, strong) NSDate* dateCreated;


//- (BOOL)validateDateCreated:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* id;


@property int32_t idValue;
- (int32_t)idValue;
- (void)setIdValue:(int32_t)value_;

//- (BOOL)validateId:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* name;


//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Movie* movie;

//- (BOOL)validateMovie:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSSet* posts;

- (NSMutableSet*)postsSet;




@property (nonatomic, strong) Theatre* theatre;

//- (BOOL)validateTheatre:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) Topic* topic;

//- (BOOL)validateTopic:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) User* userStarted;

//- (BOOL)validateUserStarted:(id*)value_ error:(NSError**)error_;





@end

@interface _Thread (CoreDataGeneratedAccessors)

- (void)addPosts:(NSSet*)value_;
- (void)removePosts:(NSSet*)value_;
- (void)addPostsObject:(Post*)value_;
- (void)removePostsObject:(Post*)value_;

@end

@interface _Thread (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitiveDateCreated;
- (void)setPrimitiveDateCreated:(NSDate*)value;




- (NSNumber*)primitiveId;
- (void)setPrimitiveId:(NSNumber*)value;

- (int32_t)primitiveIdValue;
- (void)setPrimitiveIdValue:(int32_t)value_;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;





- (Movie*)primitiveMovie;
- (void)setPrimitiveMovie:(Movie*)value;



- (NSMutableSet*)primitivePosts;
- (void)setPrimitivePosts:(NSMutableSet*)value;



- (Theatre*)primitiveTheatre;
- (void)setPrimitiveTheatre:(Theatre*)value;



- (Topic*)primitiveTopic;
- (void)setPrimitiveTopic:(Topic*)value;



- (User*)primitiveUserStarted;
- (void)setPrimitiveUserStarted:(User*)value;


@end
