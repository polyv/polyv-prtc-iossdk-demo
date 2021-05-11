//
//  PRTCRecordView.h
//  PolyvRtcSdkDemo
//
//  Created by mac on 2021/5/10.
//  Copyright © 2021 Polyv. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,PRTCRecordViewStatus) {
    PRTCRecordViewStatus_Start,
    PRTCRecordViewStatus_Stop,
    PRTCRecordViewStatus_Close,
};

typedef void(^PRTCRecordViewDidSelectBlock)(PRTCRecordViewStatus status);


@interface PRTCRecordView : UIView

/**
 按钮操作 回调
 */
@property (nonatomic, copy) PRTCRecordViewDidSelectBlock didSelectBlock;

@end

NS_ASSUME_NONNULL_END
