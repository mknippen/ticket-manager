// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Staff.m instead.

#import "_Staff.h"

const struct StaffAttributes StaffAttributes = {
	.id = @"id",
	.ssn = @"ssn",
};

const struct StaffRelationships StaffRelationships = {
	.function = @"function",
	.shifts = @"shifts",
	.theatre = @"theatre",
};

const struct StaffFetchedProperties StaffFetchedProperties = {
};

@implementation StaffID
@end

@implementation _Staff

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Staff" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Staff";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Staff" inManagedObjectContext:moc_];
}

- (StaffID*)objectID {
	return (StaffID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"idValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"id"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}

	return keyPaths;
}




@dynamic id;



- (int32_t)idValue {
	NSNumber *result = [self id];
	return [result intValue];
}

- (void)setIdValue:(int32_t)value_ {
	[self setId:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveIdValue {
	NSNumber *result = [self primitiveId];
	return [result intValue];
}

- (void)setPrimitiveIdValue:(int32_t)value_ {
	[self setPrimitiveId:[NSNumber numberWithInt:value_]];
}





@dynamic ssn;






@dynamic function;

	

@dynamic shifts;

	
- (NSMutableSet*)shiftsSet {
	[self willAccessValueForKey:@"shifts"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"shifts"];
  
	[self didAccessValueForKey:@"shifts"];
	return result;
}
	

@dynamic theatre;

	






@end
