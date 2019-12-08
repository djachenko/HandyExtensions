
#import <UIKit/UIKit.h>

@interface UIImage (Extensions)

+ (UIImage *)imageFromColor:(UIColor *)color;

+ (UIImage *)imageNamed:(NSString *)name tryLoadFromDocuments:(BOOL)tryLoadFromDocuments;

@end
