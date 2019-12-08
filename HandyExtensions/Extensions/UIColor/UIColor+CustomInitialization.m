
#import "UIColor+CustomInitialization.h"

@implementation UIColor (CustomInitialization)

+ (UIColor *)colorWithWhite:(NSUInteger)white {
	return [self colorWithWhite:(CGFloat) (white / 255.0) alpha:1];
}

+ (UIColor *)colorWithRGB:(NSUInteger)rgb {
    NSUInteger R = ((rgb >> 16) & 0xFF);
    NSUInteger G = ((rgb >> 8) & 0xFF);
    NSUInteger B = ((rgb >> 0) & 0xFF);

    return [self colorWithRed:(R / 255.0f) green:(G / 255.0f) blue:(B / 255.0f) alpha:1.0f];
}

+ (UIColor *)colorWithRGBA:(NSUInteger)rgba {
    NSUInteger R = ((rgba >> 24) & 0xFF);
    NSUInteger G = ((rgba >> 16) & 0xFF);
    NSUInteger B = ((rgba >> 8) & 0xFF);
    NSUInteger A = ((rgba >> 0) & 0xFF);

    return [self colorWithRed:(R / 255.0f) green:(G / 255.0f) blue:(B / 255.0f) alpha:(A / 255.0f)];
}

+ (UIColor *)colorP3WithRGB:(NSUInteger)rgb {
    NSUInteger R = ( (rgb >> 16) & 0xFF);
    NSUInteger G = ( (rgb >> 8) & 0xFF);
    NSUInteger B = ( (rgb >> 0) & 0xFF);

    return [self colorWithDisplayP3Red:(R / 255.0f) green:(G / 255.0f) blue:(B / 255.0f) alpha:1.0f];
}

+ (UIColor *)colorP3WithRGBA:(NSUInteger)rgba {
    NSUInteger R = ( (rgba >> 24) & 0xFF);
    NSUInteger G = ( (rgba >> 16) & 0xFF);
    NSUInteger B = ( (rgba >> 8) & 0xFF);
    NSUInteger A = ( (rgba >> 0) & 0xFF);

    return [self colorWithDisplayP3Red:(R / 255.0f) green:(G / 255.0f) blue:(B / 255.0f) alpha:(A / 255.0f)];
}

+ (instancetype) colorFromHexString:(NSString *)hexString {
    if (!hexString) {
        return [UIColor whiteColor];
    }

    unsigned long rgbValue = strtoul([hexString UTF8String] + 1, NULL, 16);

    return [self colorWithRGB:(NSUInteger) rgbValue];
}

+ (instancetype) colorP3FromHexString:(NSString *)hexString {
    if (!hexString) {
        return [UIColor whiteColor];
    }

    unsigned long rgbValue = strtoul([hexString UTF8String] + 1, NULL, 16);

    return [self colorP3WithRGB:(NSUInteger) rgbValue];
}

@end
