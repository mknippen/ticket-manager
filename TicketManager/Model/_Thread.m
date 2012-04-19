// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Thread.m instead.

#import "_Thread.h"

const struct ThreadAttributes ThreadAttributes = {
	.dateCreated = @"dateCreated",
	.id = @"id",
	.name = @"name",
};

const struct ThreadRelationships ThreadRelationships = {
	.movie = @"movie",
	.posts = @"posts",
	.theatre = @"theatre",
	.topic = @"topic",
	.userStarted = @"userStarted",
};

const struct ThreadFetchedProperties ThreadFetchedProperties = {
};

@implementation ThreadID
@end

@implementation _Thread

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Thread" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Thread";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Thread" inManagedObjectContext:moc_];
}

- (ThreadID*)objectID {
	return (ThreadID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"idValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"id"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}

	return keyPaths;
}




@dynamic dateCreated;






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






@dynamic movie;

	

@dynamic posts;

	
- (NSMutableSet*)postsSet {
	[self willAccessValueForKey:@"posts"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"posts"];
  
	[self didAccessValueForKey:@"posts"];
	return result;
}
	

@dynamic theatre;

	

@dynamic topic;

	

@dynamic userStarted;

	






@end
