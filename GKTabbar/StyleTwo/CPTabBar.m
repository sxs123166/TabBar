//
//  CPTabBar.m
//  GKTabbar
//
//  Created by 被风吹落眼泪 on 2024/3/23.
//

#import "CPTabBar.h"

@interface CPTabBar()
/** 发布按钮 */
@property (nonatomic, strong) UIButton *publishButton;

@end

@implementation CPTabBar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.publishButton];
    }
    return self;
}

/**
 * init初始化不会触发layoutSubviews。
 * addSubview会触发layoutSubviews.如果addSubview 如果连续2个 只会执行一次，因为一次的runLoop结束后，如果有需要刷新，执行一次即可。
 * 改变一个UIView的Frame会触发layoutSubviews 要改size。当然前提是frame的值设置前后发生了变化（其实是改frame的size才会触发）
 * 滚动一个UIScrollView引发UIView的重新布局会触发layoutSubviews。
 * 直接调用setNeedsLayout 或者 layoutIfNeeded。
 */

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat width = self.frame.size.width;
    CGFloat height = 49;
    
    // 设置发布按钮的frame
    self.publishButton.center = CGPointMake(width * 0.5, height * 0.5);
    
    // 设置其他UItabBarButton的frame
    CGFloat buttonY = 0;
    CGFloat buttonW = width / 5;
    CGFloat buttonH = height;
    NSInteger index = 0;
    for (UIControl *button in self.subviews) {
        if(![button isKindOfClass:[UIControl class]] || button == self.publishButton) continue;
        
        // 计算按钮的x值
        CGFloat buttonX = buttonW * ((index > 1) ? (index + 1): index);
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        // 增加索引
        index++;
    }
}

#pragma mark - click

- (void)publishClick {
    NSLog(@"Click");
    _publishButton.frame = CGRectMake(_publishButton.frame.origin.x, _publishButton.frame.origin.y, _publishButton.frame.size.width + 1, _publishButton.frame.size.height);
}

#pragma mark - lazy load
- (UIButton *)publishButton {
    if(!_publishButton) {
        _publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_publishButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [_publishButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [_publishButton addTarget:self action:@selector(publishClick) forControlEvents:UIControlEventTouchUpInside];
        _publishButton.frame = CGRectMake(0, 0, _publishButton.currentBackgroundImage.size.width, _publishButton.currentBackgroundImage.size.height);
    }
    return _publishButton;
}

@end
