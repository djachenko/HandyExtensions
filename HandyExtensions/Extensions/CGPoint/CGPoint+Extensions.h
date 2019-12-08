
#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

CG_EXTERN const CGPoint CGPointNull;

CG_EXTERN CGPoint CGPointAddVector(CGPoint point, CGVector vector);
CG_EXTERN CGPoint CGPointSubtractVector(CGPoint point, CGVector vector);

CG_EXTERN CGVector CGPointVectorFromPointToPoint(CGPoint from, CGPoint to);

CG_EXTERN CGPoint CGPointAddPoint(CGPoint a, CGPoint b);
CG_EXTERN CGPoint CGPointSubtractPoint(CGPoint from, CGPoint to);