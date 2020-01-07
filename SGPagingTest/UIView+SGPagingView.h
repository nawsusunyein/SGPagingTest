//
//  UIView+SGPagingView.h
//  SGPagingTest
//
//  Created by Naw Su Su Nyein on 1/8/20.
//  Copyright © 2020 Naw Su Su Nyein. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SGPagingView)
@property (nonatomic, assign) CGFloat SG_x;
@property (nonatomic, assign) CGFloat SG_y;
@property (nonatomic, assign) CGFloat SG_width;
@property (nonatomic, assign) CGFloat SG_height;
@property (nonatomic, assign) CGFloat SG_centerX;
@property (nonatomic, assign) CGFloat SG_centerY;
@property (nonatomic, assign) CGPoint SG_origin;
@property (nonatomic, assign) CGSize SG_size;

/// 从 XIB 中加载视图
+ (instancetype)SG_loadViewFromXib;

@end

