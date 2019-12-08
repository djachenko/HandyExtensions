
#import "UIImage+BlendMode.h"

@implementation UIImage (BlendMode)

+ (UIImage *)multiplyWithImage:(UIImage *)image withColor:(UIColor *)color withRect:(CGRect)rect{
    CGRect rect1 = CGRectMake(0, 0, image.size.width, image.size.height);

    //image colored
    UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0);

    [color setFill];
    UIRectFill(rect1);

    UIImage *coloredImage = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();
    
    CGSize size = image.size;
    size.height = rect.size.height;

    //image multiply
    UIGraphicsBeginImageContextWithOptions(size, true, 0);
    
    //CGContextRef context = UIGraphicsGetCurrentContext();
    
    
    // fill the background with white so that translucent colors get lighter
   /* context!.fill(rect)
    */
    [image drawInRect:rect1 blendMode:kCGBlendModeNormal alpha:1];

    [coloredImage drawInRect:rect1 blendMode:kCGBlendModeMultiply alpha:1];

    
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();
    
    return resultImage;
}

- (UIImage *)imageByScalingProportionallyToSize:(CGSize)targetSize {

    UIImage *sourceImage = self;
    UIImage *newImage = nil;

    CGSize imageSize = sourceImage.size;

    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;

    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;

    CGFloat scaleFactor;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;

    CGPoint thumbnailPoint = CGPointMake(0.0, 0.0);

    if (!CGSizeEqualToSize(imageSize, targetSize)) {

        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;

        if (widthFactor < heightFactor) {
            scaleFactor = widthFactor;
        }
        else {
            scaleFactor = heightFactor;
        }

        scaledWidth = width * scaleFactor;
        scaledHeight = height * scaleFactor;

        // center the image

        if (widthFactor < heightFactor) {
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }
        else if (widthFactor > heightFactor) {
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }


    // this is actually the interesting part:

    UIGraphicsBeginImageContext(targetSize);

    CGRect thumbnailRect = CGRectZero;

    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width = scaledWidth;
    thumbnailRect.size.height = scaledHeight;

    [sourceImage drawInRect:thumbnailRect];

    newImage = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();

    if (newImage == nil) {
        NSLog(@"could not scale image");
    }

    return newImage;
}

@end
