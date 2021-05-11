//
//  PLVMenu.h
//  PolyvRtcSdkDemo
//
//  Created by mac on 2021/5/10.
//  Copyright © 2021 Polyv. All rights reserved.
//

#ifndef PLVMenu_h
#define PLVMenu_h

#define MLClolor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define k_ScreenHeight   [UIScreen mainScreen].bounds.size.height
#define k_ScreenWidth   [UIScreen mainScreen].bounds.size.width
#define  k_StatusBarHeight    [UIApplication sharedApplication].statusBarFrame.size.height
#define  k_NavigationBarHeight  44.f
#define  k_StatusBarAndNavigationBarHeight   (k_StatusBarHeight + k_NavigationBarHeight)

#import "PLVMenuView.h"
#import "PLVMenuItem.h"
#import "PLVMenuCell.h"

#endif /* PLVMenu_h */
