//
//  PRTCMeetingRoomVC.h
//  PolyvRtcSdkDemo
//
//  Created by mac on 2021/5/10.
//  Copyright © 2021 Polyv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <PRTCSDK_iOS/PRTCSDK_iOS.h>


NS_ASSUME_NONNULL_BEGIN

@interface PRTCMeetingRoomVC : UIViewController

@property (nonatomic, strong) NSDictionary *engineSetting;//SDK相关配置信息
@property (nonatomic, strong) NSString *roomId;
@property (nonatomic, strong) NSString *appId;
@property (nonatomic, strong) NSString *appKey;
@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *token;//正式模式下必传
@property (nonatomic, strong) NSString *roomName;

@property (nonatomic, assign) PRTCEngineMode engineMode;
@property (nonatomic, assign) PRTCEngineRoomType roomType;//房间类型

@end

NS_ASSUME_NONNULL_END
