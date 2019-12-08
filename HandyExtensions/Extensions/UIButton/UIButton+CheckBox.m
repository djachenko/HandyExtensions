
#import "UIButton+CheckBox.h"
#import <objc/runtime.h>

@implementation UIButton (CheckBox)
- (void)setChecked:(BOOL)checked {
    objc_setAssociatedObject(self, @selector(checked), [NSNumber numberWithBool:checked], OBJC_ASSOCIATION_COPY);
    [self updateCheckedImage];
}

- (BOOL)checked {
    return [objc_getAssociatedObject(self, @selector(checked)) boolValue];
}

- (void)updateCheckedImage {
    if (self.checked) {
        [self setBackgroundImage:[UIImage imageNamed:@"radio_on_icon"] forState:UIControlStateNormal];
    } else {
        [self setBackgroundImage:[UIImage imageNamed:@"radio_off_icon"] forState:UIControlStateNormal];
    }
    
}
@end
