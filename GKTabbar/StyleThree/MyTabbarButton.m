//
//  MyTabbarButton.m
//  GKTabbar
//
//  Created by 被风吹落眼泪 on 2024/3/23.
//

#import "MyTabbarButton.h"

@implementation MyTabbarButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    }
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat imageW = self.frame.size.width;
    CGFloat imageH = self.frame.size.height * 0.6;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

// 控制器标题的位置
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0;
    CGFloat titleY = self.frame.size.height * 0.6;
    CGFloat titleW = self.frame.size.width;
    CGFloat titleH = self.frame.size.height - titleY;
    
    return CGRectMake(titleX, titleY, titleW, titleH);
}

- (void)setHighlighted:(BOOL)highlighted {
    
}

- (void)setItem:(UITabBarItem *)item {
    _item = item;
    [self setTitle:item.title forState:UIControlStateNormal];
    [self setImage:item.image forState:UIControlStateNormal];
    [self setImage:item.selectedImage forState:UIControlStateSelected];
}

@end
