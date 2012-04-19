// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Topic.m instead.

#import "_Topic.h"

const struct TopicAttributes TopicAttributes = {
	.id = @"id",
	.name = @"name",
};

const struct TopicRelationships TopicRelationships = {
	.threads = @"threads",
};

const struct TopicFetchedProperties TopicFetchedProperties = {
};

@implementation TopicID
@end

@implementation _Topic

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Topic" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Topic";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Topic" inManagedObjectContext:moc_];
}

- (TopicID*)objectID {
	return (TopicID*)[super objectID];
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





@dynamic name;






@dynamic threads;

	
- (NSMutableSet*)threadsSet {
	[self willAccessValueForKey:@"threads"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"threads"];
  
	[self didAccessValueForKey:@"threads"];
	return result;
}
	






@end
