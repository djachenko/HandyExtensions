#import "UIViewWithNib.h"

@implementation UIViewWithNib

- (instancetype)init {
    self = [super initWithFrame:CGRectZero];

    if (self) {
        [self innerInitialize];
    }

    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    if (self) {
        [self innerInitialize];
    }

    return self;
}

- (instancetype)initWithCoder:(NSCoder*)aDecoder {
    self = [super initWithCoder:aDecoder];

    if (self) {
        [self innerInitialize];
    }

    return self;
}

- (void)innerInitialize {
    NSString *nibName = NSStringFromClass([self class]);

    NSString *stringWithoutNamespace = [nibName componentsSeparatedByString:@"."].lastObject;

    NSLog(@"nib name: %@", stringWithoutNamespace);

    UIView *nibRoot = [[[NSBundle bundleForClass:[self class]] loadNibNamed:stringWithoutNamespace
                                                                      owner:self
                                                                    options:nil] firstObject];

    if (!self.fitInnerToOuter) {
        self.bounds = nibRoot.bounds;
        self.frame = nibRoot.frame;
    }
    else {
        nibRoot.bounds = self.bounds;
        nibRoot.frame = self.bounds;
    }

    self.opaque = nibRoot.opaque;
    self.backgroundColor = UIColor.clearColor;


    [self addSubview:nibRoot];

    nibRoot.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

    [nibRoot setTranslatesAutoresizingMaskIntoConstraints:YES];
}

@end
