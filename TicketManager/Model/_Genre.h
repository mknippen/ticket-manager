// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Genre.h instead.

#import <CoreData/CoreData.h>


extern const struct GenreAttributes {
	__unsafe_unretained NSString *id;
	__unsafe_unretained NSString *name;
} GenreAttributes;

extern const struct GenreRelationships {
} GenreRelationships;

extern const struct GenreFetchedProperties {
} GenreFetchedProperties;





@interface GenreID : NSManagedObjectID {}
@end

@interface _Genre : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (GenreID*)objectID;




@property (nonatomic, strong) NSNumber* id;


@property int32_t idValue;
- (int32_t)idValue;
- (void)setIdValue:(int32_t)value_;

//- (BOOL)validateId:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* name;


//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;






@end

@interface _Genre (CoreDataGeneratedAccessors)

@end

@interface _Genre (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveId;
- (void)setPrimitiveId:(NSNumber*)value;

- (int32_t)primitiveIdValue;
- (void)setPrimitiveIdValue:(int32_t)value_;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




@end
