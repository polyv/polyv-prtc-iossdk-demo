//
//  PRTCFileCaptureController.h
//  PolyvRtcSdkDemo
//
//  Created by mac on 2021/5/10.
//  Copyright © 2021 Polyv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

NS_ASSUME_NONNULL_BEGIN

@class PRTCFileCaptureController;


typedef void(^PRTCFileVideoCapturerErrorBlock)(NSString *error);

@protocol PRTCFileCaptureControllerDelegate <NSObject>
@optional
- (void)capturer:(PRTCFileCaptureController *)fileCaptureController
didCaptureVideoPixelBufferRef:(CVPixelBufferRef)pixelBufferRe
       timestamp:(CMTime)timestamp;

@end



@interface PRTCFileCaptureController : NSObject

@property (nonatomic, weak) id<PRTCFileCaptureControllerDelegate> delegate;

- (void)startCapturingFromFileNamed:(NSString *)nameOfFile
                            onError:(__nullable PRTCFileVideoCapturerErrorBlock)errorBlock;
- (void)stopCapture;

@end

NS_ASSUME_NONNULL_END
