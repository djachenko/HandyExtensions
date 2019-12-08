
#import "CGSize+Extensions.h"


CGSize CGSizeScale(CGSize source, CGFloat factor) {
    source.width *= factor;
    source.height *= factor;

    return source;
}