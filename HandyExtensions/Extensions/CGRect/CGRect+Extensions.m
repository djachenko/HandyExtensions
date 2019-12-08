
#import "CGRect+Extensions.h"
#import "../CGPoint/CGPoint+Extensions.h"

#pragma mark - Private Zone

CGRect CGRectGetX2Y3Part(CGRect source, NSInteger xi, NSInteger yj)
{
	return CGRectMake(source.origin.x + xi * source.size.width / 2, source.origin.y + yj * source.size.height / 3, source.size.width / 2, source.size.height / 3);
}

#pragma mark - Public Zone

CGRect CGRectMakeByOS(CGPoint o, CGSize s)
{
	return CGRectMake(o.x, o.y, s.width, s.height);
}

CGRect CGRectGetBorderedRectFromRect(CGRect source) {
    CGRect rect = source;
    rect.origin.x+=5;
    rect.origin.y+=5;
    rect.size.width-=10;
    rect.size.height-=10;
    return rect;
}

CGRect CGRectMakeByAnchor(CGFloat x, CGFloat y, CGFloat width, CGFloat height, CGPoint anchor)
{
	return CGRectMake(x - width * anchor.x, y - height * anchor.y, width, height);
}

CGRect CGRectMakeInCenter(CGFloat x, CGFloat y, CGFloat width, CGFloat height)
{
	return CGRectMake(x - width / 2.0f, y - height / 2, width, height);
}

CGRect CGRectSetHeight(CGRect source, CGFloat height)
{
	source.size = CGSizeMake(source.size.width, height);
	return source;
}

CGRect CGRectSetHeighByAnchor(CGRect source, CGFloat height, CGFloat anchor)
{
	return CGRectMake(source.origin.x, CGRectGetMaxY(source) - height * anchor, source.size.width, height);
}

CGRect CGRectSetWidth(CGRect source, CGFloat width)
{
	source.size = CGSizeMake(width, source.size.height);
	return source;
}

CGRect CGRectSetWidthByAnchor(CGRect source, CGFloat width, CGFloat anchor)
{
	return CGRectMake(CGRectGetMaxX(source) - width * anchor, source.origin.y, width, source.size.height);
}

CGRect CGRectSetX(CGRect source, CGFloat x)
{
	source.origin = CGPointMake(x, source.origin.y);
	return source;
}

CGRect CGRectSetXByAnchor(CGRect source, CGFloat x, CGFloat anchor)
{
	source.origin = CGPointMake(x - source.size.width * anchor, source.origin.y);
	return source;
}

CGRect CGRectSetY(CGRect source, CGFloat y)
{
	source.origin = CGPointMake(source.origin.x, y);
	return source;
}

CGRect CGRectSetOrigin(CGRect source, CGPoint origin)
{
	source.origin = origin;
	return source;
}

CGRect CGRectSetOriginByAnchor(CGRect source, CGPoint origin, CGPoint anchor)
{
	source.origin = CGPointMake(origin.x - source.size.width * anchor.x, origin.y - source.size.height * anchor.y);
	return source;
}

CGRect CGRectSetSize(CGRect source, CGSize size)
{
	source.size = size;
	return source;
}

CGRect CGRectGetLeftPart(CGRect source)
{
	return CGRectMake(source.origin.x, source.origin.y, source.size.width / 2, source.size.height);
}

CGRect CGRectGetRightPart(CGRect source)
{
	return CGRectMake(source.origin.x + source.size.width / 2, source.origin.y, source.size.width / 2, source.size.height);
}

CGRect CGRectGetX2Y3LeftTopPart(CGRect source)
{
	return CGRectGetX2Y3Part(source, 0, 0);
}

CGRect CGRectGetX2Y3LeftMiddlePart(CGRect source)
{
	return CGRectGetX2Y3Part(source, 0, 1);
}

CGRect CGRectGetX2Y3LeftBottomPart(CGRect source)
{
	return CGRectGetX2Y3Part(source, 0, 2);
}

CGRect CGRectGetX2Y3RightTopPart(CGRect source)
{
	return CGRectGetX2Y3Part(source, 1, 0);
}

CGRect CGRectGetX2Y3RightMiddlePart(CGRect source)
{
	return CGRectGetX2Y3Part(source, 1, 1);
}

CGRect CGRectGetX2Y3RightBottomPart(CGRect source)
{
	return CGRectGetX2Y3Part(source, 1, 2);
}

CGPoint CGRectGetCenter(CGRect source) {
    return CGPointAddPoint(source.origin, CGRectGetBoundsCenter(source));
}

CGPoint CGRectGetBoundsCenter(CGRect source) {
    return CGPointMake(source.size.width / 2, source.size.height / 2);
}