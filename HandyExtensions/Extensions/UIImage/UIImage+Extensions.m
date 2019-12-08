
#import "UIImage+Extensions.h"

@implementation UIImage (Extensions)

+ (UIImage *)imageFromColor:(UIColor *)color {
	CGRect rect = CGRectMake(0, 0, 1, 1);

	UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);

	[color setFill];
	UIRectFill(rect);

	UIImage *image = UIGraphicsGetImageFromCurrentImageContext();

	UIGraphicsEndImageContext();

	return image;
}

+ (UIImage *)imageNamed:(NSString *)name tryLoadFromDocuments:(BOOL)tryLoadFromDocuments {
	NSString *documentFolderPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];

	if ([[NSFileManager defaultManager] fileExistsAtPath:[documentFolderPath stringByAppendingPathComponent:name]]) {
		return [UIImage imageWithContentsOfFile:[documentFolderPath stringByAppendingPathComponent:name]];
	}
	else {
		return [UIImage imageNamed:name];
	}
}

@end
