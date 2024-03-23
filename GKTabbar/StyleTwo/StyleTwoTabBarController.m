//
//  StyleTwoTabBarController.m
//  GKTabbar
//
//  Created by 被风吹落眼泪 on 2024/3/23.
//

// 通过KVC替换tabBar进行实现

#import "StyleTwoTabBarController.h"
#import "CPTabBar.h"

@interface StyleTwoTabBarController ()

@end

@implementation StyleTwoTabBarController

+ (void)initialize {
    // 通过appearance统一设置所有UITabBarItem的文字属性
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //添加子视图控制器
    // 添加子视图控制器
    [self setupChildVc:[[UIViewController alloc] init] title:@"首页" image:@"tabbar_home_os7" selectedImage:@"tabbar_home_selected_os7"];
    
    [self setupChildVc:[[UIViewController alloc] init] title:@"消息" image:@"tabbar_message_center_os7" selectedImage:@"tabbar_message_center_selected_os7"];
    
    [self setupChildVc:[[UIViewController alloc] init] title:@"广场" image:@"tabbar_discover_os7" selectedImage:@"tabbar_discover_selected_os7"];
    
    [self setupChildVc:[[UIViewController alloc] init] title:@"我" image:@"tabbar_profile_os7" selectedImage:@"tabbar_profile_selected_os7"];
    
    // 利用KVC更换只读的系统tabbar
    [self setValue:[[CPTabBar alloc] init] forKeyPath:@"tabBar"];
}

- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    // 设置文字和图片
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    vc.view.backgroundColor =  [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    
    [self addChildViewController:vc];
}

@end
