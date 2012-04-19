// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Membership.m instead.

#import "_Membership.h"

const struct MembershipAttributes MembershipAttributes = {
	.id = @"id",
	.name = @"name",
	.pointsNeeded = @"pointsNeeded",
};

const struct MembershipRelationships MembershipRelationships = {
	.users = @"users",
};

const struct MembershipFetchedProperties MembershipFetchedProperties = {
};

@implementation MembershipID
@end

@implementation _Membership

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Membership" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Membership";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Membership" inManagedObjectContext:moc_];
}

- (MembershipID*)objectID {
	return (MembershipID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"idValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"id"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"pointsNeededValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"pointsNeeded"];
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






@dynamic pointsNeeded;



- (int32_t)pointsNeededValue {
	NSNumber *result = [self pointsNeeded];
	return [result intValue];
}

- (void)setPointsNeededValue:(int32_t)value_ {
	[self setPointsNeeded:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitivePointsNeededValue {
	NSNumber *result = [self primitivePointsNeeded];
	return [result intValue];
}

- (void)setPrimitivePointsNeededValue:(int32_t)value_ {
	[self setPrimitivePointsNeeded:[NSNumber numberWithInt:value_]];
}





@dynamic users;

	
- (NSMutableSet*)usersSet {
	[self willAccessValueForKey:@"users"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"users"];
  
	[self didAccessValueForKey:@"users"];
	return result;
}
	






@end
