
#import "CGSize+Extensions.h"


CGSize CGSizeScaled(CGSize source, CGFloat factor) {
    source.width *= factor;
    source.height *= factor;

    return source;
}

CGSize CGSizeTransposed(CGSize inner) {
    return CGSizeMake(inner.height, inner.width);
}