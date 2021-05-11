//
//  PRTCResolutionChoosePicker.h
//  PolyvRtcSdkDemo
//
//  Created by mac on 2021/5/10.
//  Copyright © 2021 Polyv. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^CompleteBlock)(NSString *resolution,int index);

@interface PRTCResolutionChoosePicker : UIView

@property (nonatomic, copy) CompleteBlock completeBlock;

-(void)showActionSheetView;

@end

NS_ASSUME_NONNULL_END
