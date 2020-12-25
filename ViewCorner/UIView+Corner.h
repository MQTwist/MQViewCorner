//
//  UIView+Corner.h
//  ViewCorner
//
//  Created by ma qi on 2020/12/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Corner)

/** 使用bezierPathWithRoundedRect */
- (void)roundedRect:(UIRectCorner)corner raduis:(CGFloat)raduis;
- (void)roundedRect:(UIRectCorner)corner bounds:(CGRect)bounds raduis:(CGFloat)raduis;

/** 线和弧自己画 */
- (void)setCornerWithTopLeftCorner:(CGFloat)topLeft
                    topRightCorner:(CGFloat)topRight
                  bottomLeftCorner:(CGFloat)bottemLeft
                 bottomRightCorner:(CGFloat)bottemRight
                            bounds:(CGRect)bounds;

@end

NS_ASSUME_NONNULL_END
