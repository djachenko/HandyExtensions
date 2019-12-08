#import <UIKit/UIKit.h>

@interface UIView (NibLoading)

+ (instancetype)viewBySelfNib;

+ (instancetype)viewByNibName:(NSString *)nibName;

+ (instancetype)landscapeViewBySelfNib;

@end
