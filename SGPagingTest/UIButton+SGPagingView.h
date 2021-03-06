//
//  UIButton+SGPagingView.h
//  SGPagingTest
//
//  Created by Naw Su Su Nyein on 1/8/20.
//  Copyright © 2020 Naw Su Su Nyein. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    /// 图片在左，文字在右
    SGImagePositionStyleDefault,
    /// 图片在右，文字在左
    SGImagePositionStyleRight,
    /// 图片在上，文字在下
    SGImagePositionStyleTop,
    /// 图片在下，文字在上
    SGImagePositionStyleBottom,
} SGImagePositionStyle;

@interface UIButton (SGPagingView)
/**
 *  设置图片与文字样式
 *
 *  @param imagePositionStyle     图片位置样式
 *  @param spacing                图片与文字之间的间距
 *  @param imagePositionBlock     在此 Block 中设置按钮的图片、文字以及 contentHorizontalAlignment 属性
 */
- (void)SG_imagePositionStyle:(SGImagePositionStyle)imagePositionStyle spacing:(CGFloat)spacing imagePositionBlock:(void (^)(UIButton *button))imagePositionBlock;

@end
