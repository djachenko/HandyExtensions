#import <UIKit/UIKit.h>

@interface UIView (CustomInitialization)

+ (instancetype)viewBySelfNib;

+ (instancetype)viewByNibName:(NSString *)nibName;

+ (instancetype)landscapeViewBySelfNib;

@end
