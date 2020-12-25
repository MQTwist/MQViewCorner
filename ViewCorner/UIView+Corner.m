//
//  UIView+Corner.m
//  ViewCorner
//
//  Created by ma qi on 2020/12/25.
//

#import "UIView+Corner.h"

@implementation UIView (Corner)

- (void)roundedRect:(UIRectCorner)corner raduis:(CGFloat)raduis {
    [self roundedRect:corner bounds:self.bounds raduis:raduis];
}

- (void)roundedRect:(UIRectCorner)corner bounds:(CGRect)bounds raduis:(CGFloat)raduis {
    NSLog(@">>>%@", NSStringFromCGRect(bounds));
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:bounds byRoundingCorners:corner cornerRadii:CGSizeMake(raduis, raduis)];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = bounds;
    shapeLayer.path = path.CGPath;
    self.layer.mask = shapeLayer;
}


- (void)setCornerWithTopLeftCorner:(CGFloat)topLeft
                    topRightCorner:(CGFloat)topRight
                  bottomLeftCorner:(CGFloat)bottemLeft
                 bottomRightCorner:(CGFloat)bottemRight
                            bounds:(CGRect)bounds {
    
    CGFloat width = bounds.size.width;
    CGFloat height = bounds.size.height;
    
    UIBezierPath *maskPath = [UIBezierPath bezierPath];
    maskPath.lineWidth = 1.0;
    maskPath.lineCapStyle = kCGLineCapRound;
    maskPath.lineJoinStyle = kCGLineJoinRound;
    [maskPath moveToPoint:CGPointMake(bottemRight, height)]; //左下角
    [maskPath addLineToPoint:CGPointMake(width - bottemRight, height)];
    
    [maskPath addQuadCurveToPoint:CGPointMake(width, height- bottemRight) controlPoint:CGPointMake(width, height)]; //右下角的圆弧
    [maskPath addLineToPoint:CGPointMake(width, topRight)]; //右边直线
    
    [maskPath addQuadCurveToPoint:CGPointMake(width - topRight, 0) controlPoint:CGPointMake(width, 0)]; //右上角圆弧
    [maskPath addLineToPoint:CGPointMake(topLeft, 0)]; //顶部直线
    
    [maskPath addQuadCurveToPoint:CGPointMake(0, topLeft) controlPoint:CGPointMake(0, 0)]; //左上角圆弧
    [maskPath addLineToPoint:CGPointMake(0, height - bottemLeft)]; //左边直线
    [maskPath addQuadCurveToPoint:CGPointMake(bottemLeft, height) controlPoint:CGPointMake(0, height)]; //左下角圆弧

    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

@end
