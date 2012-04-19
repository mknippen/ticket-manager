// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Staff.h instead.

#import <CoreData/CoreData.h>
#import "User.h"

extern const struct StaffAttributes {
	__unsafe_unretained NSString *id;
	__unsafe_unretained NSString *ssn;
} StaffAttributes;

extern const struct StaffRelationships {
	__unsafe_unretained NSString *function;
	__unsafe_unretained NSString *shifts;
	__unsafe_unretained NSString *theatre;
} StaffRelationships;

extern const struct StaffFetchedProperties {
} StaffFetchedProperties;

@class NSManagedObject;
@class Shift;
@class Theatre;




@interface StaffID : NSManagedObjectID {}
@end

@interface _Staff : User {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (StaffID*)objectID;




@property (nonatomic, strong) NSNumber* id;


@property int32_t idValue;
- (int32_t)idValue;
- (void)setIdValue:(int32_t)value_;

//- (BOOL)validateId:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* ssn;


//- (BOOL)validateSsn:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSManagedObject* function;

//- (BOOL)validateFunction:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSSet* shifts;

- (NSMutableSet*)shiftsSet;




@property (nonatomic, strong) Theatre* theatre;

//- (BOOL)validateTheatre:(id*)value_ error:(NSError**)error_;





@end

@interface _Staff (CoreDataGeneratedAccessors)

- (void)addShifts:(NSSet*)value_;
- (void)removeShifts:(NSSet*)value_;
- (void)addShiftsObject:(Shift*)value_;
- (void)removeShiftsObject:(Shift*)value_;

@end

@interface _Staff (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveId;
- (void)setPrimitiveId:(NSNumber*)value;

- (int32_t)primitiveIdValue;
- (void)setPrimitiveIdValue:(int32_t)value_;




- (NSString*)primitiveSsn;
- (void)setPrimitiveSsn:(NSString*)value;





- (NSManagedObject*)primitiveFunction;
- (void)setPrimitiveFunction:(NSManagedObject*)value;



- (NSMutableSet*)primitiveShifts;
- (void)setPrimitiveShifts:(NSMutableSet*)value;



- (Theatre*)primitiveTheatre;
- (void)setPrimitiveTheatre:(Theatre*)value;


@end
