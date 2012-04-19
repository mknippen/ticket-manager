// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Topic.h instead.

#import <CoreData/CoreData.h>


extern const struct TopicAttributes {
	__unsafe_unretained NSString *id;
	__unsafe_unretained NSString *name;
} TopicAttributes;

extern const struct TopicRelationships {
	__unsafe_unretained NSString *threads;
} TopicRelationships;

extern const struct TopicFetchedProperties {
} TopicFetchedProperties;

@class Thread;




@interface TopicID : NSManagedObjectID {}
@end

@interface _Topic : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (TopicID*)objectID;




@property (nonatomic, strong) NSNumber* id;


@property int32_t idValue;
- (int32_t)idValue;
- (void)setIdValue:(int32_t)value_;

//- (BOOL)validateId:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* name;


//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet* threads;

- (NSMutableSet*)threadsSet;





@end

@interface _Topic (CoreDataGeneratedAccessors)

- (void)addThreads:(NSSet*)value_;
- (void)removeThreads:(NSSet*)value_;
- (void)addThreadsObject:(Thread*)value_;
- (void)removeThreadsObject:(Thread*)value_;

@end

@interface _Topic (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveId;
- (void)setPrimitiveId:(NSNumber*)value;

- (int32_t)primitiveIdValue;
- (void)setPrimitiveIdValue:(int32_t)value_;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;





- (NSMutableSet*)primitiveThreads;
- (void)setPrimitiveThreads:(NSMutableSet*)value;


@end
