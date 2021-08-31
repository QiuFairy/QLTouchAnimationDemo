//
//  MyApplication.m
//  QLTouchAnimationDemo
//
//  Created by qiu on 2021/8/31.
//

#import "MyApplication.h"
#import "UIView+Extends.h"

@implementation MyApplication

- (void)sendEvent:(UIEvent *)event{
    UITouch *touch = [event.allTouches anyObject];
    CGPoint locationPointWindow = [touch preciseLocationInView:touch.window];
    
    UIView *centerRadarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 7, 7)];
    centerRadarView.centerX = locationPointWindow.x;
    centerRadarView.centerY = locationPointWindow.y;
    centerRadarView.userInteractionEnabled = NO;
    centerRadarView.backgroundColor = [UIColor clearColor];
    centerRadarView.layer.borderColor = [UIColor blackColor].CGColor;
    centerRadarView.layer.borderWidth = 3.5;
    centerRadarView.layer.cornerRadius = 7/2.0;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0001 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [touch.window addSubview:centerRadarView];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.03 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.4 animations:^{
                centerRadarView.alpha = 0;
                centerRadarView.width = 25;
                centerRadarView.height = 25;
                centerRadarView.layer.cornerRadius = 25/2.0;
                centerRadarView.centerX = locationPointWindow.x;
                centerRadarView.centerY = locationPointWindow.y;
                centerRadarView.layer.borderWidth = 2;

            } completion:^(BOOL finished) {
                [centerRadarView removeFromSuperview];

            }];
        });

    });
}

@end
