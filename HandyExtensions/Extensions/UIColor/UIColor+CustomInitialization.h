
#import <UIKit/UIKit.h>

@interface UIColor (CustomInitialization)

+ (UIColor *)colorWithWhite:(NSUInteger)white;

+ (UIColor *)colorWithRGB:(NSUInteger)rgb;
+ (UIColor *)colorWithRGBA:(NSUInteger)rgba;

+ (UIColor *)colorP3WithRGB:(NSUInteger)rgb;
+ (UIColor *)colorP3WithRGBA:(NSUInteger)rgba;

+ (instancetype) colorFromHexString:(NSString *)hexString;
+ (instancetype) colorP3FromHexString:(NSString *)hexString;

@end
