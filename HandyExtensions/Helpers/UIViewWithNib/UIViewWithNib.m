#import "UIViewWithNib.h"

@interface UIViewWithNib ()

- (void)initializeWithFrame:(CGRect)frame;

@end

@implementation UIViewWithNib

- (instancetype)init {
    self = [super initWithFrame:CGRectZero];

    if (self) {
        [self initializeWithFrame:CGRectZero];
    }

    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self initializeWithFrame:frame];
    }

    return self;
}

- (id)initWithCoder:(NSCoder*)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self initializeWithFrame:CGRectZero];
    }

    return self;
}

- (void)initializeWithFrame:(CGRect)frame {
    NSString *nibName = NSStringFromClass([self class]);

    NSString *stringWithoutNamespace = [nibName componentsSeparatedByString:@"."].lastObject;

    NSLog(@"nib name: %@", stringWithoutNamespace);

    UIView *nibRoot = [[[NSBundle bundleForClass:[self class]] loadNibNamed:stringWithoutNamespace
                                                                   owner:self
                                                                 options:nil] firstObject];

    self.bounds = nibRoot.bounds;
    self.frame = nibRoot.frame;
    self.opaque = nibRoot.opaque;

    [self addSubview:nibRoot];

    nibRoot.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

    [nibRoot setTranslatesAutoresizingMaskIntoConstraints:YES];
}

@end
