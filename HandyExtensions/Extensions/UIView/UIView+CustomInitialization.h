#import <UIKit/UIKit.h>

@interface UIView (CustomInitialization)

+ (id)viewBySelfNib;

+ (id)viewByNibName:(NSString *)nibName;

+ (id)landscapeViewBySelfNib;

@end
