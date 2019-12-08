
#import "UIButton+Extensions.h"


@implementation UIButton (Extensions)

-(void)enableAutoShrinkWithScale:(CGFloat)scale {
    self.titleLabel.adjustsFontSizeToFitWidth = YES;
    self.titleLabel.minimumScaleFactor = scale;
}

@end