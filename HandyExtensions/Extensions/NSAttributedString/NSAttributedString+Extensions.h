

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface AttributedStringTemplate : NSObject

@property (nonatomic, readonly) NSString *string;
@property (nonatomic, readonly) UIFont *font;
@property (nonatomic, readonly) UIColor *color;

- (instancetype)initWithString:(NSString *)string font:(UIFont *)font color:(UIColor *)color;

@end



@interface NSAttributedString (Extensions)

+ (NSAttributedString *)attributedStringWithTemplates:(NSArray<AttributedStringTemplate *> *)defSubstrings;

@end
