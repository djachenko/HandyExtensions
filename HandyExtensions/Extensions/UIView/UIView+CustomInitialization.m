#import "UIView+CustomInitialization.h"

@implementation UIView (CustomInitialization)

+ (id)viewBySelfNib {
	return [self viewByNibName:NSStringFromClass(self)];
}

+ (id)viewByNibName:(NSString *)nibName {
	NSArray *objects = [[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil];

	for (id object in objects) {
		if ([object isKindOfClass:self]) {
			return object;
		}
	}

	return nil;
}

+ (id)landscapeViewBySelfNib {
	return [self viewByNibName:[NSString stringWithFormat:@"%@Landscape", NSStringFromClass(self)]];
}

@end
