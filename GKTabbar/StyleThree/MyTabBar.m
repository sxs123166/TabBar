//
//  MyTabBar.m
//  GKTabbar
//
//  Created by 被风吹落眼泪 on 2024/3/23.
//

#import "MyTabBar.h"
#import "MyTabbarButton.h"

@interface MyTabBar()

@property (nonatomic, strong) UIButton *plusButton;

@property (nonatomic, strong) NSMutableArray *buttons;

@property (nonatomic, strong) UIButton *selectedButton;

@end

@implementation MyTabBar

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
//        self.backgroundColor =  [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 1.设置添加按钮的frame
    [self setupPlusBtnFrame];
    
    // 2.设置选项卡按钮的frame
    [self setupOtherBtnFrame];
}

- (void)setupOtherBtnFrame {
    
    NSInteger count = self.buttons.count;
    CGFloat btnWidth = self.frame.size.width / (count + 1);
    CGFloat btnHeight = self.frame.size.height;
    for (int i = 0; i < count; i++) {
        UIButton *btn = self.buttons[i];
        btn.frame = CGRectMake(i * btnWidth, 0, btnWidth, btnHeight);
        
        // 判断如果是到了中间一个按钮就增加一个按钮的宽度
        if(i >= count / 2) {
            btn.frame = CGRectMake((i + 1) * btnWidth, 0, btnWidth, btnHeight);
        }
    }
}

- (void)setupPlusBtnFrame {
    CGSize imageSize = self.plusButton.currentBackgroundImage.size;
    self.plusButton.frame = CGRectMake(0, 0, imageSize.width, imageSize.height);
    
    self.plusButton.center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5);
}


- (void)addTabBarButton:(UITabBarItem *)item {
    MyTabbarButton *btn = [[MyTabbarButton alloc] init];
    
    btn.item = item;
    [self addSubview:btn];
    btn.tag = self.buttons.count;
    
    [self.buttons addObject:btn];
    
    [btn addTarget:self action:@selector(buttonOnClick:) forControlEvents:UIControlEventTouchDown];
    
    if(self.buttons.count == 1) {
        [self buttonOnClick:btn];
    }
}

- (void)buttonOnClick:(UIButton *)btn {
    if([self.delegate respondsToSelector:@selector(tabBar:selectedButtonfrom:to:)]) {
        [self.delegate tabBar:self selectedButtonfrom:self.selectedButton.tag to:btn.tag];
    }
    self.selectedButton.selected = NO;
    btn.selected = YES;
    self.selectedButton = btn;
}

- (NSMutableArray *)buttons {
    if(!_buttons) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}

- (UIButton *)plusButton {
    if(!_plusButton) {
        _plusButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_plusButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [_plusButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [_plusButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [_plusButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        [self addSubview:_plusButton];
    }
    return _plusButton;
}

@end
