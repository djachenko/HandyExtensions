
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ParallaxViewDirection) {
    ParallaxViewDirection_x,
    ParallaxViewDirection_y
};


@interface ParallaxView : UIView

@property (nonatomic) CGFloat speed;
@property (nonatomic) CGFloat phase;
@property (nonatomic, retain) UIImage *image;
@property (nonatomic) ParallaxViewDirection direction;

@end
