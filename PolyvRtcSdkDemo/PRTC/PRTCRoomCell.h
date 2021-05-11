//
//  PRTCRoomCell.h
//  PolyvRtcSdkDemo
//
//  Created by mac on 2021/5/10.
//  Copyright © 2021 Polyv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <PRTCSDK_iOS/PRTCSDK_iOS.h>

NS_ASSUME_NONNULL_BEGIN

/**
 type       0: 为摄像头
        1: 麦克风
 */
typedef void(^PCloudRtcRoomCellMuteComplete)(PRTCStream *stream, int type, BOOL mute);

@interface PRTCRoomCell : UICollectionViewCell

@property (strong, nonatomic)  PRTCStream *stream;

@property (copy, nonatomic) PCloudRtcRoomCellMuteComplete muteComplete;


@end

NS_ASSUME_NONNULL_END
