
#import <UIKit/UIKit.h>

@interface UIImage (BlendMode)

+ (UIImage *)multiplyWithImage:(UIImage *)image withColor:(UIColor *)color withRect:(CGRect)rect;

- (UIImage *)imageByScalingProportionallyToSize:(CGSize)targetSize;

@end
