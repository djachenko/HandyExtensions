
#import "CGFloat+Extensions.h"

#define ARC4RANDOM_MAX 0x100000000

CGFloat CGFloatRandRange(CGFloat minRange, CGFloat maxRange) {
    CGFloat val = ((CGFloat) arc4random() / ARC4RANDOM_MAX)
            * (maxRange - minRange)
            + minRange;

    return val;
}