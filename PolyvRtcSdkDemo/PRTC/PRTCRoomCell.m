//
//  PRTCRoomCell.m
//  PolyvRtcSdkDemo
//
//  Created by mac on 2021/5/10.
//  Copyright © 2021 Polyv. All rights reserved.
//

#import "PRTCRoomCell.h"

@implementation PRTCRoomCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)cameraOnOff:(UIButton *)sender {
    sender.selected = !sender.isSelected;
    self.muteComplete(_stream, 0, !sender.isSelected);
}
- (IBAction)micOnOff:(UIButton *)sender {
    sender.selected = !sender.isSelected;
    self.muteComplete(_stream, 1, sender.isSelected);
}

- (void)setStream:(PRTCStream *)stream {
    _stream = stream;
    [stream renderOnView:self.contentView];
}

- (void)dealloc {
    NSLog(@"-%@- dealloc", self);
}


@end
