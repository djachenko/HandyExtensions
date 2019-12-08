#import "UIView+NibLoading.h"

@implementation UIView (NibLoading)

+ (instancetype)viewBySelfNib {
	NSString *classNameWithModule = NSStringFromClass(self);
	NSString *classNameWithoutModule = [classNameWithModule componentsSeparatedByString:@"."].lastObject;

	return [self viewByNibName:classNameWithoutModule];
}

+ (instancetype)viewByNibName:(NSString *)nibName {
	NSArray *objects = [[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil];

	for (id object in objects) {
		if ([object isKindOfClass:self]) {
			return object;
		}
	}

	return nil;
}

+ (instancetype)landscapeViewBySelfNib {
	return [self viewByNibName:[NSString stringWithFormat:@"%@Landscape", NSStringFromClass(self)]];
}

@end
