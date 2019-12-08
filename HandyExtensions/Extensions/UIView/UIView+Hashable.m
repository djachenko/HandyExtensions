#import "UIView+Hashable.h"

@implementation UIView (Hashable)

- (NSString*) hashString {
    return [NSString stringWithFormat:@"%lu", (unsigned long) self.hash];
}

@end
