
#import "ParallaxView.h"

@interface ParallaxView()

@property (nonatomic) NSMutableArray *imageViews;
@property (nonatomic) CGFloat tileSize;

@property (nonatomic) NSUInteger lengthInFrames;

@end

@implementation ParallaxView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    if (self) {
        [self initialize];
    }

    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];

    if (self) {
        [self initialize];
    }

    return self;
}

- (void)initialize {
    self.imageViews = [NSMutableArray array];
    self.direction = ParallaxViewDirection_x;

    self.lengthInFrames = 2;
    self.speed = 0.5f;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    [self fillView];
}


-(void)fillView {
    for (UIImageView *imageView in self.imageViews) {
        [imageView removeFromSuperview];
    }

    [self.imageViews removeAllObjects];

    switch (self.direction) {
        case ParallaxViewDirection_x: {
            [self fillViewByX];
            break;
        }
        case ParallaxViewDirection_y: {
            [self fillViewByY];
            break;
        }
        default:
            NSAssert(NO, @"Invalid state");
    }
}

- (void)fillViewByX {

    if(self.image == nil) {
        return;
    }

    CGSize imageSize = self.image.size;
    CGSize viewSize = self.frame.size;
    
    CGFloat scaleFactor = viewSize.height / imageSize.height;
    
    self.tileSize = imageSize.width * scaleFactor;
    
    NSUInteger tileCount = (NSUInteger) ceil(viewSize.width / self.tileSize) + 1;
    
    
    for (NSUInteger i = 0; i < tileCount; i++) {
        UIImageView *tileView = [[UIImageView alloc] initWithImage:self.image];
        
        CGRect imageFrame = CGRectMake(self.tileSize * i, 0, self.tileSize, viewSize.height);
        
        tileView.frame = imageFrame;
        
        [self addSubview:tileView];
        [self.imageViews addObject:tileView];
    }

}

- (void)fillViewByY {
    
    if(self.image == nil) {
        return;
    }
    
    CGSize imageSize = self.image.size;
    CGSize viewSize = self.frame.size;

    CGFloat scaleFactor = viewSize.height / imageSize.height;
    
    self.tileSize = imageSize.height * scaleFactor;
    
    NSUInteger tileCount = (NSUInteger) ceil(viewSize.height / self.tileSize) + 1;


    for (NSUInteger i = 0; i < tileCount; i++) {
        UIImageView *tileView = [[UIImageView alloc] initWithImage:self.image];
        
        CGRect imageFrame = CGRectMake(0, self.tileSize*i, viewSize.width , self.tileSize);

        tileView.frame = imageFrame;

        [self addSubview:tileView];
        [self.imageViews addObject:tileView];
    }
}

- (void)setPhase:(CGFloat)phase {
    CGFloat difference = phase - _phase;

    difference *= self.lengthInFrames;
    difference *= self.speed;

    _phase = phase;

    for (UIImageView *imageView in self.imageViews) {
        CGRect imageViewFrame = imageView.frame;

        switch (self.direction) {
            case ParallaxViewDirection_x:
                imageViewFrame.origin.x -= self.frame.size.width * difference;
                imageViewFrame.origin.x = [self loopConstraintValue:imageViewFrame.origin.x];

                break;
            case ParallaxViewDirection_y:

                imageViewFrame.origin.y -= self.frame.size.height * difference;
                imageViewFrame.origin.y = [self loopConstraintValue:imageViewFrame.origin.y];

                break;
            default:
                NSAssert(NO, @"Unexpected parallax direction");
        }

        imageView.frame = imageViewFrame;
    }
}

- (CGFloat)loopConstraintValue:(CGFloat)value {
    if (value < -1 * self.tileSize) {
        return value + self.imageViews.count * self.tileSize;
    }
    else {
        return value;
    }
}


@end
