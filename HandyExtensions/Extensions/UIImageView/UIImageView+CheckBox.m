#import "UIImageView+CheckBox.h"
#import <objc/runtime.h>

@implementation UIImageView (CheckBox)

- (void)setChecked:(BOOL)checked {
    objc_setAssociatedObject(self, @selector(checked), @(checked), OBJC_ASSOCIATION_COPY);
    [self updateCheckedImage];
}

- (BOOL)checked {
    return [objc_getAssociatedObject(self, @selector(checked)) boolValue];
}


- (void)setEnabled:(BOOL)enabled {
    self.userInteractionEnabled = enabled;
    [self updateCheckedImage];
}

- (BOOL)enabled {
    return self.userInteractionEnabled;
}

- (void)updateCheckedImage {
    if (self.enabled) {
        if (self.checked) {
            self.image = [UIImage imageNamed:@"radio_on_icon"];
        } else {
            self.image = [UIImage imageNamed:@"radio_off_icon"];
        }
    } else {
        self.image = [UIImage imageNamed:@"radio_off_dis_icon"];
    }
}

@end
