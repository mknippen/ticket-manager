// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Movie.h instead.

#import <CoreData/CoreData.h>


extern const struct MovieAttributes {
	__unsafe_unretained NSString *desc;
	__unsafe_unretained NSString *directors;
	__unsafe_unretained NSString *id;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *stars;
} MovieAttributes;

extern const struct MovieRelationships {
	__unsafe_unretained NSString *genres;
	__unsafe_unretained NSString *reviews;
	__unsafe_unretained NSString *showings;
} MovieRelationships;

extern const struct MovieFetchedProperties {
} MovieFetchedProperties;

@class Genre;
@class Review;
@class Showing;







@interface MovieID : NSManagedObjectID {}
@end

@interface _Movie : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (MovieID*)objectID;




@property (nonatomic, strong) NSString* desc;


//- (BOOL)validateDesc:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* directors;


//- (BOOL)validateDirectors:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* id;


@property int32_t idValue;
- (int32_t)idValue;
- (void)setIdValue:(int32_t)value_;

//- (BOOL)validateId:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* name;


//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* stars;


//- (BOOL)validateStars:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet* genres;

- (NSMutableSet*)genresSet;




@property (nonatomic, strong) Review* reviews;

//- (BOOL)validateReviews:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSSet* showings;

- (NSMutableSet*)showingsSet;





@end

@interface _Movie (CoreDataGeneratedAccessors)

- (void)addGenres:(NSSet*)value_;
- (void)removeGenres:(NSSet*)value_;
- (void)addGenresObject:(Genre*)value_;
- (void)removeGenresObject:(Genre*)value_;

- (void)addShowings:(NSSet*)value_;
- (void)removeShowings:(NSSet*)value_;
- (void)addShowingsObject:(Showing*)value_;
- (void)removeShowingsObject:(Showing*)value_;

@end

@interface _Movie (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveDesc;
- (void)setPrimitiveDesc:(NSString*)value;




- (NSString*)primitiveDirectors;
- (void)setPrimitiveDirectors:(NSString*)value;




- (NSNumber*)primitiveId;
- (void)setPrimitiveId:(NSNumber*)value;

- (int32_t)primitiveIdValue;
- (void)setPrimitiveIdValue:(int32_t)value_;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSString*)primitiveStars;
- (void)setPrimitiveStars:(NSString*)value;





- (NSMutableSet*)primitiveGenres;
- (void)setPrimitiveGenres:(NSMutableSet*)value;



- (Review*)primitiveReviews;
- (void)setPrimitiveReviews:(Review*)value;



- (NSMutableSet*)primitiveShowings;
- (void)setPrimitiveShowings:(NSMutableSet*)value;


@end
