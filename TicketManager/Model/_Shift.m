// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Shift.m instead.

#import "_Shift.h"

const struct ShiftAttributes ShiftAttributes = {
};

const struct ShiftRelationships ShiftRelationships = {
	.function = @"function",
	.staff = @"staff",
};

const struct ShiftFetchedProperties ShiftFetchedProperties = {
};

@implementation ShiftID
@end

@implementation _Shift

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Shift" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Shift";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Shift" inManagedObjectContext:moc_];
}

- (ShiftID*)objectID {
	return (ShiftID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic function;

	

@dynamic staff;

	






@end
