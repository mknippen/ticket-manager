// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Post.h instead.

#import <CoreData/CoreData.h>


extern const struct PostAttributes {
	__unsafe_unretained NSString *dateCreated;
	__unsafe_unretained NSString *id;
	__unsafe_unretained NSString *name;
} PostAttributes;

extern const struct PostRelationships {
	__unsafe_unretained NSString *thread;
	__unsafe_unretained NSString *writer;
} PostRelationships;

extern const struct PostFetchedProperties {
} PostFetchedProperties;

@class Thread;
@class User;





@interface PostID : NSManagedObjectID {}
@end

@interface _Post : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (PostID*)objectID;




@property (nonatomic, strong) NSDate* dateCreated;


//- (BOOL)validateDateCreated:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* id;


@property int32_t idValue;
- (int32_t)idValue;
- (void)setIdValue:(int32_t)value_;

//- (BOOL)validateId:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* name;


//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Thread* thread;

//- (BOOL)validateThread:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) User* writer;

//- (BOOL)validateWriter:(id*)value_ error:(NSError**)error_;





@end

@interface _Post (CoreDataGeneratedAccessors)

@end

@interface _Post (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitiveDateCreated;
- (void)setPrimitiveDateCreated:(NSDate*)value;




- (NSNumber*)primitiveId;
- (void)setPrimitiveId:(NSNumber*)value;

- (int32_t)primitiveIdValue;
- (void)setPrimitiveIdValue:(int32_t)value_;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;





- (Thread*)primitiveThread;
- (void)setPrimitiveThread:(Thread*)value;



- (User*)primitiveWriter;
- (void)setPrimitiveWriter:(User*)value;


@end
