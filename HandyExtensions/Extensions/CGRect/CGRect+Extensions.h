
#import <CoreGraphics/CoreGraphics.h>

CG_EXTERN CGRect CGRectMakeByOS(CGPoint o, CGSize s);
CG_EXTERN CGRect CGRectMakeByAnchor(CGFloat x, CGFloat y, CGFloat width, CGFloat height, CGPoint anchor);
CG_EXTERN CGRect CGRectMakeInCenter(CGFloat x, CGFloat y, CGFloat width, CGFloat height);
CG_EXTERN CGRect CGRectSetHeight(CGRect source, CGFloat height);
CG_EXTERN CGRect CGRectSetHeighByAnchor(CGRect source, CGFloat height, CGFloat anchor);
CG_EXTERN CGRect CGRectSetWidth(CGRect source, CGFloat width);
CG_EXTERN CGRect CGRectSetWidthByAnchor(CGRect source, CGFloat width, CGFloat anchor);
CG_EXTERN CGRect CGRectSetX(CGRect source, CGFloat x);
CG_EXTERN CGRect CGRectSetXByAnchor(CGRect source, CGFloat x, CGFloat anchor);
CG_EXTERN CGRect CGRectSetY(CGRect source, CGFloat y);
CG_EXTERN CGRect CGRectSetOrigin(CGRect source, CGPoint origin);
CG_EXTERN CGRect CGRectSetOriginByAnchor(CGRect source, CGPoint origin, CGPoint anchor);
CG_EXTERN CGRect CGRectSetSize(CGRect source, CGSize size);
CG_EXTERN CGRect CGRectGetLeftPart(CGRect source);
CG_EXTERN CGRect CGRectGetRightPart(CGRect source);
CG_EXTERN CGRect CGRectGetX2Y3LeftTopPart(CGRect source);
CG_EXTERN CGRect CGRectGetX2Y3LeftMiddlePart(CGRect source);
CG_EXTERN CGRect CGRectGetX2Y3LeftBottomPart(CGRect source);
CG_EXTERN CGRect CGRectGetX2Y3RightTopPart(CGRect source);
CG_EXTERN CGRect CGRectGetX2Y3RightMiddlePart(CGRect source);
CG_EXTERN CGRect CGRectGetX2Y3RightBottomPart(CGRect source);
CG_EXTERN CGRect CGRectGetBorderedRectFromRect(CGRect source);
CG_EXTERN CGPoint CGRectGetCenter(CGRect source);
CG_EXTERN CGPoint CGRectGetBoundsCenter(CGRect source);