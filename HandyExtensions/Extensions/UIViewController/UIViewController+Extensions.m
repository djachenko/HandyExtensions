#import "UIViewController+Extensions.h"

@implementation UIViewController (Extensions)

#pragma - Public

+ (UIViewController *)topViewController {
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    return [rootViewController topVisibleViewController];
}

#pragma - Private

- (UIViewController *)topVisibleViewController {
    if ([self isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabBarController = (UITabBarController *) self;

        return [tabBarController.selectedViewController topVisibleViewController];
    }
    else if ([self isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController *) self;

        return [navigationController.visibleViewController topVisibleViewController];
    }
    else if (self.presentedViewController) {
        return [self.presentedViewController topVisibleViewController];
    }
    else if (self.childViewControllers.count > 0) {
        return [self.childViewControllers.lastObject topVisibleViewController];
    }

    return self;
}

@end
