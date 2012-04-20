// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Screen.h instead.

#import <CoreData/CoreData.h>


extern const struct ScreenAttributes {
	__unsafe_unretained NSString *capacity;
	__unsafe_unretained NSString *id;
} ScreenAttributes;

extern const struct ScreenRelationships {
	__unsafe_unretained NSString *showings;
	__unsafe_unretained NSString *theatre;
} ScreenRelationships;

extern const struct ScreenFetchedProperties {
} ScreenFetchedProperties;

@class Showing;
@class Theatre;




@interface ScreenID : NSManagedObjectID {}
@end

@interface _Screen : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ScreenID*)objectID;




@property (nonatomic, strong) NSNumber* capacity;


@property int32_t capacityValue;
- (int32_t)capacityValue;
- (void)setCapacityValue:(int32_t)value_;

//- (BOOL)validateCapacity:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* id;


@property int32_t idValue;
- (int32_t)idValue;
- (void)setIdValue:(int32_t)value_;

//- (BOOL)validateId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet* showings;

- (NSMutableSet*)showingsSet;




@property (nonatomic, strong) Theatre* theatre;

//- (BOOL)validateTheatre:(id*)value_ error:(NSError**)error_;





@end

@interface _Screen (CoreDataGeneratedAccessors)

- (void)addShowings:(NSSet*)value_;
- (void)removeShowings:(NSSet*)value_;
- (void)addShowingsObject:(Showing*)value_;
- (void)removeShowingsObject:(Showing*)value_;

@end

@interface _Screen (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveCapacity;
- (void)setPrimitiveCapacity:(NSNumber*)value;

- (int32_t)primitiveCapacityValue;
- (void)setPrimitiveCapacityValue:(int32_t)value_;




- (NSNumber*)primitiveId;
- (void)setPrimitiveId:(NSNumber*)value;

- (int32_t)primitiveIdValue;
- (void)setPrimitiveIdValue:(int32_t)value_;





- (NSMutableSet*)primitiveShowings;
- (void)setPrimitiveShowings:(NSMutableSet*)value;



- (Theatre*)primitiveTheatre;
- (void)setPrimitiveTheatre:(Theatre*)value;


@end
