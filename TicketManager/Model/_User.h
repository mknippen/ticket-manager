// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to User.h instead.

#import <CoreData/CoreData.h>


extern const struct UserAttributes {
	__unsafe_unretained NSString *address;
	__unsafe_unretained NSString *availableCreditPoints;
	__unsafe_unretained NSString *ccExpiration;
	__unsafe_unretained NSString *ccNumber;
	__unsafe_unretained NSString *ccType;
	__unsafe_unretained NSString *emailId;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *password;
	__unsafe_unretained NSString *phone;
	__unsafe_unretained NSString *totalCreditPoints;
	__unsafe_unretained NSString *userId;
} UserAttributes;

extern const struct UserRelationships {
	__unsafe_unretained NSString *membership;
	__unsafe_unretained NSString *reviewsDisliked;
	__unsafe_unretained NSString *reviewsLiked;
	__unsafe_unretained NSString *reviewsWritten;
	__unsafe_unretained NSString *showingsSeen;
} UserRelationships;

extern const struct UserFetchedProperties {
} UserFetchedProperties;

@class Membership;
@class Review;
@class Review;
@class Review;
@class Showing;













@interface UserID : NSManagedObjectID {}
@end

@interface _User : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (UserID*)objectID;




@property (nonatomic, strong) NSString* address;


//- (BOOL)validateAddress:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* availableCreditPoints;


@property int32_t availableCreditPointsValue;
- (int32_t)availableCreditPointsValue;
- (void)setAvailableCreditPointsValue:(int32_t)value_;

//- (BOOL)validateAvailableCreditPoints:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSDate* ccExpiration;


//- (BOOL)validateCcExpiration:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* ccNumber;


//- (BOOL)validateCcNumber:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* ccType;


//- (BOOL)validateCcType:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* emailId;


//- (BOOL)validateEmailId:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* name;


//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* password;


//- (BOOL)validatePassword:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* phone;


//- (BOOL)validatePhone:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber* totalCreditPoints;


@property int32_t totalCreditPointsValue;
- (int32_t)totalCreditPointsValue;
- (void)setTotalCreditPointsValue:(int32_t)value_;

//- (BOOL)validateTotalCreditPoints:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* userId;


//- (BOOL)validateUserId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Membership* membership;

//- (BOOL)validateMembership:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSSet* reviewsDisliked;

- (NSMutableSet*)reviewsDislikedSet;




@property (nonatomic, strong) NSSet* reviewsLiked;

- (NSMutableSet*)reviewsLikedSet;




@property (nonatomic, strong) NSSet* reviewsWritten;

- (NSMutableSet*)reviewsWrittenSet;




@property (nonatomic, strong) NSSet* showingsSeen;

- (NSMutableSet*)showingsSeenSet;





@end

@interface _User (CoreDataGeneratedAccessors)

- (void)addReviewsDisliked:(NSSet*)value_;
- (void)removeReviewsDisliked:(NSSet*)value_;
- (void)addReviewsDislikedObject:(Review*)value_;
- (void)removeReviewsDislikedObject:(Review*)value_;

- (void)addReviewsLiked:(NSSet*)value_;
- (void)removeReviewsLiked:(NSSet*)value_;
- (void)addReviewsLikedObject:(Review*)value_;
- (void)removeReviewsLikedObject:(Review*)value_;

- (void)addReviewsWritten:(NSSet*)value_;
- (void)removeReviewsWritten:(NSSet*)value_;
- (void)addReviewsWrittenObject:(Review*)value_;
- (void)removeReviewsWrittenObject:(Review*)value_;

- (void)addShowingsSeen:(NSSet*)value_;
- (void)removeShowingsSeen:(NSSet*)value_;
- (void)addShowingsSeenObject:(Showing*)value_;
- (void)removeShowingsSeenObject:(Showing*)value_;

@end

@interface _User (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveAddress;
- (void)setPrimitiveAddress:(NSString*)value;




- (NSNumber*)primitiveAvailableCreditPoints;
- (void)setPrimitiveAvailableCreditPoints:(NSNumber*)value;

- (int32_t)primitiveAvailableCreditPointsValue;
- (void)setPrimitiveAvailableCreditPointsValue:(int32_t)value_;




- (NSDate*)primitiveCcExpiration;
- (void)setPrimitiveCcExpiration:(NSDate*)value;




- (NSString*)primitiveCcNumber;
- (void)setPrimitiveCcNumber:(NSString*)value;




- (NSString*)primitiveCcType;
- (void)setPrimitiveCcType:(NSString*)value;




- (NSString*)primitiveEmailId;
- (void)setPrimitiveEmailId:(NSString*)value;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSString*)primitivePassword;
- (void)setPrimitivePassword:(NSString*)value;




- (NSString*)primitivePhone;
- (void)setPrimitivePhone:(NSString*)value;




- (NSNumber*)primitiveTotalCreditPoints;
- (void)setPrimitiveTotalCreditPoints:(NSNumber*)value;

- (int32_t)primitiveTotalCreditPointsValue;
- (void)setPrimitiveTotalCreditPointsValue:(int32_t)value_;




- (NSString*)primitiveUserId;
- (void)setPrimitiveUserId:(NSString*)value;





- (Membership*)primitiveMembership;
- (void)setPrimitiveMembership:(Membership*)value;



- (NSMutableSet*)primitiveReviewsDisliked;
- (void)setPrimitiveReviewsDisliked:(NSMutableSet*)value;



- (NSMutableSet*)primitiveReviewsLiked;
- (void)setPrimitiveReviewsLiked:(NSMutableSet*)value;



- (NSMutableSet*)primitiveReviewsWritten;
- (void)setPrimitiveReviewsWritten:(NSMutableSet*)value;



- (NSMutableSet*)primitiveShowingsSeen;
- (void)setPrimitiveShowingsSeen:(NSMutableSet*)value;


@end
