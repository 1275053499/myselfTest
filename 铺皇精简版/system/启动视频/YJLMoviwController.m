//
//  YJLMoviwController.m
//  铺皇精简版
//
//  Created by selice on 2017/12/13.
//  Copyright © 2017年 中国铺皇. All rights reserved.
//

#import "YJLMoviwController.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVKit/AVKit.h>
@interface YJLMoviwController ()<UITabBarControllerDelegate>{
    
    UITabBarController *MytabbarController;
}

@property (strong, nonatomic) MPMoviePlayerController *player;

@end

@implementation YJLMoviwController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self SetupVideoPlayer];
}

- (void)SetupVideoPlayer{
    
    self.player = [[MPMoviePlayerController alloc] initWithContentURL:_movieURL];
    [self.view addSubview:self.player.view];
    self.player.shouldAutoplay  = YES;
    [self.player setControlStyle:MPMovieControlStyleNone];
    self.player.repeatMode      = MPMovieRepeatModeOne;
    [self.player.view setFrame:[UIScreen mainScreen].bounds];
    self.player.view.alpha      = 0;
    [UIView animateWithDuration:3 animations:^{
        self.player.view.alpha = 1;
        [self.player prepareToPlay];
    }];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackStateChanged) name:MPMoviePlayerLoadStateDidChangeNotification object:nil];
    
    [self setupLoginView];
}

- (void)setupLoginView
{
    //进入按钮
    UIButton *enterMainButton = [UIButton buttonWithType:UIButtonTypeCustom];
    enterMainButton.frame = CGRectMake(24, [UIScreen mainScreen].bounds.size.height - 32 - 48, [UIScreen mainScreen].bounds.size.width - 48, 48);
    enterMainButton.layer.borderWidth = 1;
    enterMainButton.layer.cornerRadius = 24;
    enterMainButton.layer.borderColor = RGB(77, 166, 214).CGColor;
    [enterMainButton setTitle:@"进入应用" forState:UIControlStateNormal];
    [enterMainButton setTitleColor:RGB(77, 166, 214) forState:UIControlStateNormal];
    enterMainButton.alpha = 0;
    [self.player.view addSubview:enterMainButton];
    [enterMainButton addTarget:self action:@selector(enterMainAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [UIView animateWithDuration:3.0 animations:^{
        enterMainButton.alpha = 1.0;
    }];
}

#pragma mark - NSNotificationCenter
- (void)playbackStateChanged{
    
    MPMoviePlaybackState playbackState = [self.player playbackState];
    if (playbackState == MPMoviePlaybackStateStopped || playbackState == MPMoviePlaybackStatePaused) {
        [self.player play];
    }
}

- (void)enterMainAction:(UIButton *)btn {
    NSLog(@"进入应用");
    
     [self.player stop];
    //          创建一个带导航的根控制器
    UINavigationController *nav1  = [[UINavigationController alloc] initWithRootViewController:[[FirstController alloc] init]];
    UINavigationController *nav2  = [[UINavigationController alloc] initWithRootViewController:[[SecondController alloc] init]];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:[[ThirdController alloc] init]];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:[[FourthController alloc] init]];
    
    //          调用设置属性的方法
    [self controller:nav1 Title:@"Tomorrow_L" tabBarItemImage:@"icon_tabbar_homepage_selected" tabBarItemSelectedImage:@"icon_tabbar_homepage_normal" ];
    [self controller:nav2 Title:@"Tomorrow_S" tabBarItemImage:@"icon_tabbar_merchant_selected" tabBarItemSelectedImage:@"icon_tabbar_merchant_normal"];
    [self controller:nav3 Title:@"Tomorrow_P" tabBarItemImage:@"icon_tabbar_mine_selected" tabBarItemSelectedImage:@"icon_tabbar_mine_normal" ];
    [self controller:nav4 Title:@"寻仙" tabBarItemImage:@"icon_tabbar_nearby_selected" tabBarItemSelectedImage:@"icon_tabbar_nearby_normal"];
   
    //          添加到tabbar控制器
    MytabbarController = [[UITabBarController alloc] init];
    MytabbarController.viewControllers = @[nav1,nav2,nav3,nav4];
    self.view.window.rootViewController = MytabbarController;
    MytabbarController.delegate = self;
    
    
    
    
}

#pragma  - mark tabbar 设置属性方法
- (void)controller:(UIViewController *)controller Title:(NSString *)title tabBarItemImage:(NSString *)image tabBarItemSelectedImage:(NSString *)selectedImage{
    
    controller.title = title;
    controller.tabBarItem.image = [UIImage imageNamed:image];
    // 设置 tabbarItem 选中状态的图片(不被系统默认渲染,显示图像原始颜色)
    UIImage     *imageHome  = [UIImage imageNamed:selectedImage];
    imageHome               = [imageHome imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [controller.tabBarItem setSelectedImage:imageHome];
    // 设置 tabbarItem 选中状态下的文字颜色(不被系统默认渲染,显示文字自定义颜色)
    NSDictionary *dictHome = [NSDictionary dictionaryWithObject:MainRGB forKey:NSForegroundColorAttributeName];
    [controller.tabBarItem setTitleTextAttributes:dictHome forState:UIControlStateSelected];
    
    
    
    
}


#pragma -mark 加入视频出现问题 不能使用
//#pragma -mark UITabBarController代理方法 点击刷新数据使用
//- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
//
//    if (tabBarController.selectedIndex ==0) {
//        NSLog(@"点击第1个吧");
//
//        //当tabBar被点击时发出一个通知给FirstController
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"TabBarDidSelectedNotificationTOFirstController" object:nil userInfo:nil];
//
//    }
//
//    else if (tabBarController.selectedIndex == 1){
//
//        NSLog(@"点击第2个吧");
//    }
//    else if (tabBarController.selectedIndex == 2){
//        NSLog(@"点击第3个吧");
//    }
//    else if (tabBarController.selectedIndex == 2){
//        NSLog(@"点击第4个吧");
//    }
//
//    else
//    {
//        NSLog(@"点击第5个吧");
//    }
//
//
//    static NSString *tabBarDidSelectedNotification = @"tabBarDidSelectedNotification";
//    //当tabBar被点击时发出一个通知
//    [[NSNotificationCenter defaultCenter] postNotificationName:tabBarDidSelectedNotification object:nil userInfo:nil];
//}

@end
