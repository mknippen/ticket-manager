// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Showing.m instead.

#import "_Showing.h"

const struct ShowingAttributes ShowingAttributes = {
	.id = @"id",
	.timeStamp = @"timeStamp",
};

const struct ShowingRelationships ShowingRelationships = {
	.movie = @"movie",
	.screen = @"screen",
	.usersAttending = @"usersAttending",
};

const struct ShowingFetchedProperties ShowingFetchedProperties = {
};

@implementation ShowingID
@end

@implementation _Showing

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Showing" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Showing";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Showing" inManagedObjectContext:moc_];
}

- (ShowingID*)objectID {
	return (ShowingID*)[super objectID];
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





@dynamic timeStamp;






@dynamic movie;

	

@dynamic screen;

	

@dynamic usersAttending;

	
- (NSMutableSet*)usersAttendingSet {
	[self willAccessValueForKey:@"usersAttending"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"usersAttending"];
  
	[self didAccessValueForKey:@"usersAttending"];
	return result;
}
	






@end
