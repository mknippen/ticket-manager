// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Movie.m instead.

#import "_Movie.h"

const struct MovieAttributes MovieAttributes = {
	.desc = @"desc",
	.directors = @"directors",
	.id = @"id",
	.name = @"name",
	.stars = @"stars",
};

const struct MovieRelationships MovieRelationships = {
	.genres = @"genres",
	.reviews = @"reviews",
	.showings = @"showings",
};

const struct MovieFetchedProperties MovieFetchedProperties = {
};

@implementation MovieID
@end

@implementation _Movie

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Movie" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Movie";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Movie" inManagedObjectContext:moc_];
}

- (MovieID*)objectID {
	return (MovieID*)[super objectID];
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






@dynamic directors;






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






@dynamic stars;






@dynamic genres;

	
- (NSMutableSet*)genresSet {
	[self willAccessValueForKey:@"genres"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"genres"];
  
	[self didAccessValueForKey:@"genres"];
	return result;
}
	

@dynamic reviews;

	
- (NSMutableSet*)reviewsSet {
	[self willAccessValueForKey:@"reviews"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"reviews"];
  
	[self didAccessValueForKey:@"reviews"];
	return result;
}
	

@dynamic showings;

	
- (NSMutableSet*)showingsSet {
	[self willAccessValueForKey:@"showings"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"showings"];
  
	[self didAccessValueForKey:@"showings"];
	return result;
}
	






@end
