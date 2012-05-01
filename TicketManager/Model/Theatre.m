#import "Theatre.h"
#import "Screen.h"
#import "Showing.h"

@implementation Theatre

// Custom logic goes here.

- (NSSet *)movies {
    NSMutableSet *movies = [[NSMutableSet alloc] initWithCapacity:10]; //NSSets do not allow duplicate objects
    
    for (Screen *s in self.screens) {
        for (Showing *sh in s.showings) {
            [movies addObject:sh.movie];
        }
    }
    
    return movies;
}

@end
