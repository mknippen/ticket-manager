// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Function.m instead.

#import "_Function.h"

const struct FunctionAttributes FunctionAttributes = {
	.duties = @"duties",
	.id = @"id",
	.name = @"name",
};

const struct FunctionRelationships FunctionRelationships = {
	.staff = @"staff",
};

const struct FunctionFetchedProperties FunctionFetchedProperties = {
};

@implementation FunctionID
@end

@implementation _Function

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Function" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Function";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Function" inManagedObjectContext:moc_];
}

- (FunctionID*)objectID {
	return (FunctionID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"idValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"id"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}

	return keyPaths;
}




@dynamic duties;






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





@dynamic name;






@dynamic staff;

	
- (NSMutableSet*)staffSet {
	[self willAccessValueForKey:@"staff"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"staff"];
  
	[self didAccessValueForKey:@"staff"];
	return result;
}
	






@end
