//
//  PRTCNativeRecordMediaVC.m
//  PolyvRtcSdkDemo
//
//  Created by mac on 2021/5/10.
//  Copyright © 2021 Polyv. All rights reserved.
//

#import "PRTCNativeRecordMediaVC.h"
#import <AVKit/AVKit.h>

@interface PRTCNativeRecordMediaVC ()

@property (nonatomic, strong) NSString *videoUrl;
@property (nonatomic, strong) AVPlayerViewController *playerVC;

@end

@implementation PRTCNativeRecordMediaVC

- (void)viewDidLoad {
    [super viewDidLoad];
        NSString *tmpDir = NSTemporaryDirectory();
        self.videoUrl = [NSString stringWithFormat:@"%@test.mp4",tmpDir];
        self.playerVC = [[AVPlayerViewController alloc] init];
        self.playerVC.player = [AVPlayer playerWithURL:[self.videoUrl hasPrefix:@"http"] ? [NSURL URLWithString:self.videoUrl]:[NSURL fileURLWithPath:self.videoUrl]];
        self.playerVC.view.frame = CGRectMake(0, (self.view.frame.size.height-self.view.frame.size.width*1.5)/2, self.view.frame.size.width, self.view.frame.size.width*1.5);
        self.playerVC.showsPlaybackControls = YES;
        [self.view addSubview:self.playerVC.view];
        
        if (self.playerVC.readyForDisplay) {
            [self.playerVC.player play];
        }
}

- (IBAction)back{
    [self dismissViewControllerAnimated:YES completion:^{}];
}


@end
