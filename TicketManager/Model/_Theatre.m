// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Theatre.m instead.

#import "_Theatre.h"

const struct TheatreAttributes TheatreAttributes = {
	.address = @"address",
	.id = @"id",
	.name = @"name",
};

const struct TheatreRelationships TheatreRelationships = {
	.reviews = @"reviews",
	.screens = @"screens",
	.staff = @"staff",
};

const struct TheatreFetchedProperties TheatreFetchedProperties = {
};

@implementation TheatreID
@end

@implementation _Theatre

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Theatre" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Theatre";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Theatre" inManagedObjectContext:moc_];
}

- (TheatreID*)objectID {
	return (TheatreID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"idValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"id"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}

	return keyPaths;
}




@dynamic address;






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






@dynamic reviews;

	

@dynamic screens;

	
- (NSMutableSet*)screensSet {
	[self willAccessValueForKey:@"screens"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"screens"];
  
	[self didAccessValueForKey:@"screens"];
	return result;
}
	

@dynamic staff;

	
- (NSMutableSet*)staffSet {
	[self willAccessValueForKey:@"staff"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"staff"];
  
	[self didAccessValueForKey:@"staff"];
	return result;
}
	






@end
