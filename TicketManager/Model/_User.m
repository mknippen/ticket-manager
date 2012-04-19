// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to User.m instead.

#import "_User.h"

const struct UserAttributes UserAttributes = {
	.address = @"address",
	.availableCreditPoints = @"availableCreditPoints",
	.ccExpiration = @"ccExpiration",
	.ccNumber = @"ccNumber",
	.ccType = @"ccType",
	.emailId = @"emailId",
	.name = @"name",
	.password = @"password",
	.phone = @"phone",
	.totalCreditPoints = @"totalCreditPoints",
	.userId = @"userId",
};

const struct UserRelationships UserRelationships = {
	.membership = @"membership",
	.reviewsDisliked = @"reviewsDisliked",
	.reviewsLiked = @"reviewsLiked",
	.reviewsWritten = @"reviewsWritten",
	.showingsSeen = @"showingsSeen",
};

const struct UserFetchedProperties UserFetchedProperties = {
};

@implementation UserID
@end

@implementation _User

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"User";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"User" inManagedObjectContext:moc_];
}

- (UserID*)objectID {
	return (UserID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"availableCreditPointsValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"availableCreditPoints"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"totalCreditPointsValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"totalCreditPoints"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}

	return keyPaths;
}




@dynamic address;






@dynamic availableCreditPoints;



- (int32_t)availableCreditPointsValue {
	NSNumber *result = [self availableCreditPoints];
	return [result intValue];
}

- (void)setAvailableCreditPointsValue:(int32_t)value_ {
	[self setAvailableCreditPoints:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveAvailableCreditPointsValue {
	NSNumber *result = [self primitiveAvailableCreditPoints];
	return [result intValue];
}

- (void)setPrimitiveAvailableCreditPointsValue:(int32_t)value_ {
	[self setPrimitiveAvailableCreditPoints:[NSNumber numberWithInt:value_]];
}





@dynamic ccExpiration;






@dynamic ccNumber;






@dynamic ccType;






@dynamic emailId;






@dynamic name;






@dynamic password;






@dynamic phone;






@dynamic totalCreditPoints;



- (int32_t)totalCreditPointsValue {
	NSNumber *result = [self totalCreditPoints];
	return [result intValue];
}

- (void)setTotalCreditPointsValue:(int32_t)value_ {
	[self setTotalCreditPoints:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveTotalCreditPointsValue {
	NSNumber *result = [self primitiveTotalCreditPoints];
	return [result intValue];
}

- (void)setPrimitiveTotalCreditPointsValue:(int32_t)value_ {
	[self setPrimitiveTotalCreditPoints:[NSNumber numberWithInt:value_]];
}





@dynamic userId;






@dynamic membership;

	

@dynamic reviewsDisliked;

	
- (NSMutableSet*)reviewsDislikedSet {
	[self willAccessValueForKey:@"reviewsDisliked"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"reviewsDisliked"];
  
	[self didAccessValueForKey:@"reviewsDisliked"];
	return result;
}
	

@dynamic reviewsLiked;

	
- (NSMutableSet*)reviewsLikedSet {
	[self willAccessValueForKey:@"reviewsLiked"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"reviewsLiked"];
  
	[self didAccessValueForKey:@"reviewsLiked"];
	return result;
}
	

@dynamic reviewsWritten;

	
- (NSMutableSet*)reviewsWrittenSet {
	[self willAccessValueForKey:@"reviewsWritten"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"reviewsWritten"];
  
	[self didAccessValueForKey:@"reviewsWritten"];
	return result;
}
	

@dynamic showingsSeen;

	
- (NSMutableSet*)showingsSeenSet {
	[self willAccessValueForKey:@"showingsSeen"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"showingsSeen"];
  
	[self didAccessValueForKey:@"showingsSeen"];
	return result;
}
	






@end
