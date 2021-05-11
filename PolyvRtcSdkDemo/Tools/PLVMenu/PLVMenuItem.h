//
//  PLVMenuItem.h
//  PolyvRtcSdkDemo
//
//  Created by mac on 2021/5/10.
//  Copyright © 2021 Polyv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PLVMenuItem : NSObject

/** title */
@property (nonatomic, copy) NSString *title;
/** imageName */
@property (nonatomic, copy) NSString *imageName;
/** title Array */
@property (nonatomic, strong) NSArray *titls;
/** image Array */
@property (nonatomic, strong) NSArray *imageNames;
/** fontSzie */
@property (nonatomic, assign) CGFloat fontSzie;
/** titleColor */
@property (nonatomic, strong) UIColor *titleColor;
/**
 separatorColor
 */
@property (nonatomic, strong) UIColor *separatorColor;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)menuItemWithDict:(NSDictionary *)dict;

@end
