
#include "CGPoint+Extensions.h"

const CGPoint CGPointNull = {0, 0};

CGPoint CGPointAddVector(CGPoint point, CGVector vector) {
    return CGPointMake(point.x + vector.dx, point.y + vector.dy);
}

CGPoint CGPointSubtractVector(CGPoint point, CGVector vector) {
    return CGPointMake(point.x - vector.dx, point.y - vector.dy);
}

CGVector CGPointVectorFromPointToPoint(CGPoint from, CGPoint to) {
    return CGVectorMake(to.x - from.x, to.y - from.y);
}

CGPoint CGPointAddPoint(CGPoint a, CGPoint b) {
    return CGPointMake(a.x + b.x, a.y + b.y);
}

CGPoint CGPointSubtractPoint(CGPoint from, CGPoint to) {
    return CGPointMake(from.x - to.x, from.y - to.y);
}