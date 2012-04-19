// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Screen.m instead.

#import "_Screen.h"

const struct ScreenAttributes ScreenAttributes = {
	.capacity = @"capacity",
	.id = @"id",
};

const struct ScreenRelationships ScreenRelationships = {
	.showings = @"showings",
	.theatre = @"theatre",
};

const struct ScreenFetchedProperties ScreenFetchedProperties = {
};

@implementation ScreenID
@end

@implementation _Screen

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Screen" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Screen";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Screen" inManagedObjectContext:moc_];
}

- (ScreenID*)objectID {
	return (ScreenID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"capacityValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"capacity"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}

	return keyPaths;
}




@dynamic capacity;



- (int32_t)capacityValue {
	NSNumber *result = [self capacity];
	return [result intValue];
}

- (void)setCapacityValue:(int32_t)value_ {
	[self setCapacity:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveCapacityValue {
	NSNumber *result = [self primitiveCapacity];
	return [result intValue];
}

- (void)setPrimitiveCapacityValue:(int32_t)value_ {
	[self setPrimitiveCapacity:[NSNumber numberWithInt:value_]];
}





@dynamic id;






@dynamic showings;

	
- (NSMutableSet*)showingsSet {
	[self willAccessValueForKey:@"showings"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"showings"];
  
	[self didAccessValueForKey:@"showings"];
	return result;
}
	

@dynamic theatre;

	






@end
