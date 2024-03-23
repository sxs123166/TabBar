//
//  StyleThreeTabBarViewController.m
//  GKTabbar
//
//  Created by 被风吹落眼泪 on 2024/3/23.
//

#import "StyleThreeTabBarViewController.h"
#import "MyTabBar.h"


@interface StyleThreeTabBarViewController()<MyTabBarDelegate>

@property (nonatomic, strong) MyTabBar *customTabbar;

@end

@implementation StyleThreeTabBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // 添加子控制器
        // 首页
        [self addChildVc:[[UIViewController alloc] init] title:@"首页" imageName:@"tabbar_home_os7" selectedImageName:@"tabbar_home_selected_os7"];
        
        [self addChildVc:[[UIViewController alloc] init] title:@"消息" imageName:@"tabbar_message_center_os7" selectedImageName:@"tabbar_message_center_selected_os7"];
        
        [self addChildVc:[[UIViewController alloc] init] title:@"广场" imageName:@"tabbar_discover_os7" selectedImageName:@"tabbar_discover_selected_os7"];
        
        [self addChildVc:[[UIViewController alloc] init] title:@"我" imageName:@"tabbar_profile_os7" selectedImageName:@"tabbar_profile_selected_os7"];
//        [self add]
        
    }
    return self;
}

- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName {
    // 1.设置子控制器的属性
    childVc.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    childVc.title = title;
    
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    childVc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    
    // 2.添加子视图
    [self addChildViewController:childVc];
    
    // 3.调用自定义tabbar的添加按钮方法，创建一个与当前控制器对应的按钮
    [self.customTabbar addTabBarButton:childVc.tabBarItem];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 创建自定义tabBar
    self.customTabbar.frame = self.tabBar.bounds;
    [self.tabBar addSubview:self.customTabbar];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    // 遍历系统的tabbar移除不需要的控件
    for (UIView *subView in self.tabBar.subviews) {
        if([subView isKindOfClass:[UIControl class]]) {
            // 判断如果子控件是UITabBarButton,就删除
            [subView removeFromSuperview];
        }
    }
}

#pragma mark - delegate method

- (void)tabBar:(MyTabBar *)tabBar selectedButtonfrom:(NSInteger)from to:(NSInteger)to {
    NSLog(@"从第%ld控制器切换到第%ld控制器", (long)from, (long)to);
    self.selectedIndex = to;
}

#pragma mark - lazy load
- (MyTabBar *)customTabbar {
    if(!_customTabbar) {
        _customTabbar = [[MyTabBar alloc] init];
        _customTabbar.delegate = self;
    }
    return _customTabbar;
}






@end
