#import "Movie.h"

#import "Showing.h"
#import "Screen.h"

@implementation Movie

// Custom logic goes here.

- (NSSet *)theatres {
    NSMutableSet *theatres = [[NSMutableSet alloc] initWithCapacity:10]; //NSSets do not allow duplicate objects
    
    for (Showing *sh in self.showings) {
        [theatres addObject:sh.screen.theatre];
    }
    
    return theatres;
}

@end
