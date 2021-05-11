//
//  PLVLoginViewController.m
//  PolyvRtcSdkDemo
//
//  Created by mac on 2021/5/10.
//  Copyright © 2021 Polyv. All rights reserved.
//

#import "PLVLoginViewController.h"
#import "PRTCMeetingRoomVC.h"
#import "PLVSettingsViewController.h"
#import "UIView+Toast.h"
#import "PLVTextField.h"

#import <PRTCSDK_iOS/PRTCSDK_iOS.h>

#error [获取帐号配置信息 APPID APPKEY]

//线上
#define APP_ID @""
#define APP_KEY @""


#define TOKEN @""
#import <AVFoundation/AVFoundation.h>

@interface PLVLoginViewController ()

@property (weak, nonatomic) IBOutlet PLVTextField *userTf;
@property (weak, nonatomic) IBOutlet PLVTextField *roomTf;
@property (weak, nonatomic) IBOutlet UISwitch *roomTypeSwitch;

///  参数设置
@property (nonatomic,strong) NSDictionary *engineSetting;

@end

@implementation PLVLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (IBAction)joinRoom:(UIButton *)sender {
    if (_userTf.text.length <= 0) {
        [self.view makeToast:@"请输入用户ID"];
        return;
    }
    if (_roomTf.text.length <= 0) {
        [self.view makeToast:@"请输入房间名"];
        return;
    }
    
    PRTCMeetingRoomVC *roomVC = [[PRTCMeetingRoomVC alloc] init];
    roomVC.userId = self.userTf.text;
    roomVC.roomId = self.roomTf.text;
    roomVC.appId = APP_ID;
    roomVC.appKey = APP_KEY;
    roomVC.token = TOKEN;
    roomVC.engineSetting = self.engineSetting;
    roomVC.modalPresentationStyle = UIModalPresentationFullScreen;
    if (self.roomTypeSwitch.on) {
        roomVC.roomType = PRTCEngineRoomType_Broadcast;
    }else{
        roomVC.roomType = PRTCEngineRoomType_Communicate;
    }
    [self presentViewController:roomVC animated:true completion:nil];
}

- (void)gotoSetting{
   PLVSettingsViewController *settingVC = (PLVSettingsViewController *) [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"PLVSettingsViewController"];
    [self.navigationController pushViewController:settingVC animated:true];

}

- (void)setupUI {
    // 用户ID
    _userTf.text = [NSString stringWithFormat:@"iOS_%d",arc4random()%1000];
    
    // 设置leftView
    [_userTf setLeftImageViewWithName:@"user"];
    [_roomTf setLeftImageViewWithName:@"room"];
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"setting"] style:(UIBarButtonItemStyleDone) target:self action:@selector(gotoSetting)] ;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:true];
}

@end
