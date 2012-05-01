// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Review.m instead.

#import "_Review.h"

const struct ReviewAttributes ReviewAttributes = {
	.desc = @"desc",
	.id = @"id",
};

const struct ReviewRelationships ReviewRelationships = {
	.movie = @"movie",
	.theatre = @"theatre",
	.usersDisliked = @"usersDisliked",
	.usersLiked = @"usersLiked",
	.writer = @"writer",
};

const struct ReviewFetchedProperties ReviewFetchedProperties = {
};

@implementation ReviewID
@end

@implementation _Review

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Review" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Review";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Review" inManagedObjectContext:moc_];
}

- (ReviewID*)objectID {
	return (ReviewID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"idValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"id"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}

	return keyPaths;
}




@dynamic desc;






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





@dynamic movie;

	

@dynamic theatre;

	

@dynamic usersDisliked;

	
- (NSMutableSet*)usersDislikedSet {
	[self willAccessValueForKey:@"usersDisliked"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"usersDisliked"];
  
	[self didAccessValueForKey:@"usersDisliked"];
	return result;
}
	

@dynamic usersLiked;

	
- (NSMutableSet*)usersLikedSet {
	[self willAccessValueForKey:@"usersLiked"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"usersLiked"];
  
	[self didAccessValueForKey:@"usersLiked"];
	return result;
}
	

@dynamic writer;

	






@end
