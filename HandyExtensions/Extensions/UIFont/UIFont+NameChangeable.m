#import "UIFont+NameChangeable.h"


@implementation UIFont (NameChangeable)

- (UIFont *)fontWithName:(NSString *)fontName {
    CGFloat size = self.pointSize;

    return [UIFont fontWithName:fontName size:size];
}

@end
