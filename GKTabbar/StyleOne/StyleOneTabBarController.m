//
//  StyleOneTabBarController.m
//  GKTabbar
//
//  Created by 被风吹落眼泪 on 2024/3/22.
//

#import "StyleOneTabBarController.h"

@interface StyleOneTabBarController ()<UITabBarControllerDelegate>

@property (nonatomic, strong) UIButton *centerButton;

@end

@implementation StyleOneTabBarController

+ (void)initialize {
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    attrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 添加子视图控制器
    [self setupChildVc:[[UIViewController alloc] init] title:@"首页" image:@"tabbar_home_os7" selectedImage:@"tabbar_home_selected_os7"];
    
    [self setupChildVc:[[UIViewController alloc] init] title:@"消息" image:@"tabbar_message_center_os7" selectedImage:@"tabbar_message_center_selected_os7"];
    
    [self setupChildVc:[[UIViewController alloc] init] title:@"" image:nil selectedImage:nil];
    
    [self setupChildVc:[[UIViewController alloc] init] title:@"广场" image:@"tabbar_discover_os7" selectedImage:@"tabbar_discover_selected_os7"];
    
    [self setupChildVc:[[UIViewController alloc] init] title:@"我" image:@"tabbar_profile_os7" selectedImage:@"tabbar_profile_selected_os7"];
    
    // tabBar上添加一个UIButton遮盖住中间的UITabbarButton
    self.centerButton.frame = CGRectMake((self.tabBar.frame.size.width - self.tabBar.frame.size.height)/2, 0, self.tabBar.frame.size.height, self.tabBar.frame.size.height);
    self.tabBar.backgroundColor = [UIColor whiteColor];
    
    self.delegate = self;
}

- (void)viewDidLayoutSubviews {
    [self.tabBar addSubview:self.centerButton];
}

/**
 *  初始化子控制器
 */
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    // 设置文字和图片
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    [self addChildViewController:vc];
}


- (UIButton *)centerButton {
    if(!_centerButton) {
        _centerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_centerButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [_centerButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        
        [_centerButton addTarget:self action:@selector(centerButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _centerButton;
}

- (void)centerButtonAction {
    NSLog(@"跳转事件");
}


@end
