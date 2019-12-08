
#import "NSAttributedString+Extensions.h"
#import "../NSArray/NSArray+Extensions.h"

@interface AttributedStringTemplate()

@property (nonatomic, readwrite) NSString *string;
@property (nonatomic, readwrite) UIFont *font;
@property (nonatomic, readwrite) UIColor *color;

@end

@implementation AttributedStringTemplate

- (instancetype)initWithString:(NSString *)string font:(UIFont *)font color:(UIColor *)color {
	self = [super init];

	if (self) {
		self.string = string;
		self.font = font;
		self.color = color;

	}

	return self;
}

@end


@implementation NSAttributedString (Extensions)

+ (NSAttributedString *)attributedStringWithTemplates:(NSArray<AttributedStringTemplate *> *)defSubstrings; {

	NSArray *substrings = [defSubstrings convert:^NSAttributedString *(AttributedStringTemplate *template) {
		return [[NSAttributedString alloc] initWithString:template.string
											   attributes:@{
													   NSForegroundColorAttributeName: template.color,
													   NSFontAttributeName: template.font
											   }];

	}];

	NSMutableAttributedString *as = [[NSMutableAttributedString alloc] init];

	[substrings each:^(NSAttributedString *string) {
		[as appendAttributedString:string];
	}];

	return [as copy];
}

@end
