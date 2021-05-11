//
//  PLVSlider.h
//  PolyvRtcSdkDemo
//
//  Created by mac on 2021/5/10.
//  Copyright © 2021 Polyv. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,PLVSliderStyle)
{
    PLVSliderStyle_Nomal = 1,    /*默认样式 例如|________|________|________|________|*/
    PLVSliderStyle_Cross = 2,    /*默认样式 例如|--------|--------|--------|--------|*/
    PLVSliderStyle_Point = 3,    /*默认样式 例如 ●--------●--------●--------●--------●*/
};

@protocol PLVSliderDelegate <NSObject>

@optional
-(void)didSelectedIndex:(NSInteger)index;

@end

@interface PLVSlider : UIControl

@property (nonatomic, weak) id <PLVSliderDelegate> _Nullable delegate;
/**
 刻度样式 详情参考 枚举值 CLSliderStyle 默认 CLSliderStyle_Nomal
 */
@property (nonatomic) PLVSliderStyle sliderStyle;

/**
 滑块填充颜色
 */
@property (nonatomic) UIColor *thumbTintColor;


/**
 滑块阴影颜色
 */
@property (nonatomic) UIColor *thumbShadowColor;


/**
 滑块阴影透明度
 */
@property (nonatomic) CGFloat thumbShadowOpacity;


/**
 滑块直径 默认20
 */
@property (nonatomic) CGFloat thumbDiameter;

/**
 刻度线 线条颜色
 */
@property (nonatomic) UIColor *scaleLineColor;


/**
 刻度线 线条宽度
 */
@property (nonatomic,assign) CGFloat scaleLineWidth;

/**
 刻度线 线条高度
 */
@property (nonatomic,assign) CGFloat scaleLineHeight;


/**
 刻度线 刻度数量
 */
@property (nonatomic,assign) NSInteger scaleLineNumber;


/**
 当前滑块所处 刻度的索引 默认0
 */
@property (nonatomic,assign,readonly) NSInteger currentIdx;


/**
 设置 滑块选中的刻度索引 无动画效果
 */
- (void)setSelectedIndex:(NSInteger)index;


/**
 设置 滑块选中的刻度索引
 animated 是否有动画效果
 */
- (void)setSelectedIndex:(NSInteger)index animated:(BOOL)animated;

@end


NS_ASSUME_NONNULL_END
