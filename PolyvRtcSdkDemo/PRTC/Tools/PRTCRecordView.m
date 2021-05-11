//
//  PRTCRecordView.m
//  PolyvRtcSdkDemo
//
//  Created by mac on 2021/5/10.
//  Copyright © 2021 Polyv. All rights reserved.
//

#import "PRTCRecordView.h"

@interface PRTCRecordView()

@property (weak, nonatomic) IBOutlet UIButton *recordBtn;
@property (weak, nonatomic) IBOutlet UIButton *closeBtn;
@property (weak, nonatomic) IBOutlet UILabel *timeL;
@property (weak, nonatomic) IBOutlet UILabel *textL;
@property (weak, nonatomic) IBOutlet UILabel *lineL;

@property (assign ,nonatomic) PRTCRecordViewStatus status;
@property (nonatomic, assign) int seconds;
@property (nonatomic, assign) int minutes;
@property (nonatomic, assign) int hours;
@property (nonatomic, strong) NSTimer *timer;

@end


@implementation PRTCRecordView

- (void)drawRect:(CGRect)rect {
    _status = PRTCRecordViewStatus_Close;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{

    UITouch *touch = [touches anyObject];
    
    // 当前触摸点
    CGPoint currentPoint = [touch locationInView:self.superview];
    // 上一个触摸点
    CGPoint previousPoint = [touch previousLocationInView:self.superview];
    
    // 当前view的中点
    CGPoint center = self.center;
    
    center.x += (currentPoint.x - previousPoint.x);
    center.y += (currentPoint.y - previousPoint.y);
    // 修改当前view的中点(中点改变view的位置就会改变)
    self.center = center;
}

//点击开始录制/结束录制
- (IBAction)clickBtn:(UIButton *)sender {
    if (sender.selected) {
        _status = PRTCRecordViewStatus_Stop;
        _timeL.hidden = YES;
        _textL.hidden = NO;
        _lineL.hidden = NO;
        _closeBtn.hidden = NO;
        _timeL.text = @"00:00:00";
        if (self.timer) {
            [self.timer invalidate];
            self.timer = nil;
            self.hours = 0;
            self.minutes = 0;
            self.seconds = 0;
        }
    }else{
        _status = PRTCRecordViewStatus_Start;
        _timeL.hidden = NO;
        _textL.hidden = YES;
        _lineL.hidden = YES;
        _closeBtn.hidden = YES;
        self.hours = 0;
        self.minutes = 0;
        self.seconds = 0;
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(startTimer) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    }
    sender.selected = !sender.selected;
    if (_didSelectBlock) {
        _didSelectBlock(_status);
    }
}

- (void)startTimer {
    self.seconds++;
    if (_seconds == 60) {
        self.minutes++;
        self.seconds = 0;
    }
    if (self.minutes == 60) {
        self.hours++;
        self.minutes = 0;
    }
    _timeL.text = [NSString stringWithFormat:@"%.2d:%.2d:%.2d",_hours, _minutes, _seconds];
}

//点击关闭按钮
- (IBAction)closeClick:(UIButton *)sender {
    if (_didSelectBlock) {
        _didSelectBlock(PRTCRecordViewStatus_Close);
    }
    if (self.timer) {
        if ([self.timer respondsToSelector:@selector(isValid)]){
            if ([self.timer isValid]){
                [self.timer invalidate];
                self.timer = nil;
            }
        }
    }
    [self removeFromSuperview];
}


@end
