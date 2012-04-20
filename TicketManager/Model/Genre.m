#import "Genre.h"
#import "AppDelegate.h"

@implementation Genre

// Custom logic goes here.
static Genre *drama;
static Genre *adventure;
static Genre *sciFi;
static Genre *love;
static Genre *comedy;
static Genre *family;



+(void)setupGenres {
    AppDelegate *ad = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Genre" inManagedObjectContext:ad.managedObjectContext];
    [fetchRequest setEntity:entity];

    NSError *error = nil;
    NSArray *fetchedObjects = [ad.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"Problems in Genres");
    } else {
        for (Genre *g in fetchedObjects) {
            if ([g.name isEqualToString:@"Drama"]) {
                drama = g;
            } else if ([g.name isEqualToString:@"Adventure"]) {
                adventure = g;
            } else if ([g.name isEqualToString:@"Sci-Fi"]) {
                sciFi = g;
            } else if ([g.name isEqualToString:@"Love Story"]) {
                love = g;
            } else if ([g.name isEqualToString:@"Comedy"]) {
                comedy = g;
            } else {
                family = g;
            }
        }
    }

}


+ (Genre *)dramaGenre {
    if (!drama) {
        [self setupGenres];
    }
    
    return drama;
}

+ (Genre *)adventureGenre {
    if (!adventure) {
        [self setupGenres];
    }
    
    return adventure;
}

+ (Genre *)sciFiGenre {
    if (!sciFi) {
        [self setupGenres];
    }
    
    return sciFi;
}

+ (Genre *)loveGenre {
    if (!love) {
        [self setupGenres];
    }
    
    return love;
}

+ (Genre *)comedyGenre {
    if (!comedy) {
        [self setupGenres];
    }
    
    return comedy;
}

+ (Genre *)familyGenre {
    if (!family) {
        [self setupGenres];
    }
    
    return family;
}


@end
