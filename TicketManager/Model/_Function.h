// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Function.h instead.

#import <CoreData/CoreData.h>


extern const struct FunctionAttributes {
	__unsafe_unretained NSString *duties;
	__unsafe_unretained NSString *id;
	__unsafe_unretained NSString *name;
} FunctionAttributes;

extern const struct FunctionRelationships {
	__unsafe_unretained NSString *staff;
} FunctionRelationships;

extern const struct FunctionFetchedProperties {
} FunctionFetchedProperties;

@class Staff;





@interface FunctionID : NSManagedObjectID {}
@end

@interface _Function : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (FunctionID*)objectID;




@property (nonatomic, strong) NSString* duties;


//- (BOOL)validateDuties:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* id;


@property int32_t idValue;
- (int32_t)idValue;
- (void)setIdValue:(int32_t)value_;

//- (BOOL)validateId:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* name;


//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet* staff;

- (NSMutableSet*)staffSet;





@end

@interface _Function (CoreDataGeneratedAccessors)

- (void)addStaff:(NSSet*)value_;
- (void)removeStaff:(NSSet*)value_;
- (void)addStaffObject:(Staff*)value_;
- (void)removeStaffObject:(Staff*)value_;

@end

@interface _Function (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveDuties;
- (void)setPrimitiveDuties:(NSString*)value;




- (NSNumber*)primitiveId;
- (void)setPrimitiveId:(NSNumber*)value;

- (int32_t)primitiveIdValue;
- (void)setPrimitiveIdValue:(int32_t)value_;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;





- (NSMutableSet*)primitiveStaff;
- (void)setPrimitiveStaff:(NSMutableSet*)value;


@end
