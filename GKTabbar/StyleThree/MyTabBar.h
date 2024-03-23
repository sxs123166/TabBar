//
//  MyTabBar.h
//  GKTabbar
//
//  Created by 被风吹落眼泪 on 2024/3/23.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN
@class MyTabBar;

@protocol MyTabBarDelegate <NSObject>

- (void)tabBar:(MyTabBar *)tabBar selectedButtonfrom:(NSInteger)from to:(NSInteger)to;

@end

@interface MyTabBar : UIView

@property (nonatomic, weak) id<MyTabBarDelegate> delegate;

- (void)addTabBarButton:(UITabBarItem *)item;


@end

NS_ASSUME_NONNULL_END
