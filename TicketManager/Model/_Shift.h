// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Shift.h instead.

#import <CoreData/CoreData.h>


extern const struct ShiftAttributes {
} ShiftAttributes;

extern const struct ShiftRelationships {
	__unsafe_unretained NSString *function;
	__unsafe_unretained NSString *staff;
} ShiftRelationships;

extern const struct ShiftFetchedProperties {
} ShiftFetchedProperties;

@class Function;
@class Staff;


@interface ShiftID : NSManagedObjectID {}
@end

@interface _Shift : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ShiftID*)objectID;





@property (nonatomic, strong) Function* function;

//- (BOOL)validateFunction:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) Staff* staff;

//- (BOOL)validateStaff:(id*)value_ error:(NSError**)error_;





@end

@interface _Shift (CoreDataGeneratedAccessors)

@end

@interface _Shift (CoreDataGeneratedPrimitiveAccessors)



- (Function*)primitiveFunction;
- (void)setPrimitiveFunction:(Function*)value;



- (Staff*)primitiveStaff;
- (void)setPrimitiveStaff:(Staff*)value;


@end
