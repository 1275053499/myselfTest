//
//  AppDelegate.m
//  铺皇精简版
//
//  Created by selice on 2017/12/7.
//  Copyright © 2017年 中国铺皇. All rights reserved.
//

#import "AppDelegate.h"
#import "YJLMoviwController.h"
@interface AppDelegate ()<UITabBarControllerDelegate>{
    UITabBarController *MytabbarController;
}

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    一直出现的
    YJLMoviwController *yjlCtrl = [[YJLMoviwController alloc]init];
    //         yjlCtrl.movieURL = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"movie"ofType:@"mp4"]];//选择本地的视屏
    yjlCtrl.movieURL = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"qidong"ofType:@"mp4"]];//选择本地的视屏
    //         yjlCtrl.movieURL = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"QiDongmovie"ofType:@"mp4"]];//选择本地的视屏
    self.window.rootViewController = yjlCtrl;

    
    
//    出现一次
   /*
    NSString *versionCache = [[NSUserDefaults standardUserDefaults] objectForKey:@"VersionCache"];//本地缓存的版本号  第一次启动的时候本地是没有缓存版本号的。
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];//当前应用版本号

    if (![versionCache isEqualToString:version]) //如果本地缓存的版本号和当前应用版本号不一样，则是第一次启动（更新版本也算第一次启动）
    {
        YJLMoviwController *yjlCtrl = [[YJLMoviwController alloc]init];
//         yjlCtrl.movieURL = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"movie"ofType:@"mp4"]];//选择本地的视屏
        yjlCtrl.movieURL = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"qidong"ofType:@"mp4"]];//选择本地的视屏
//         yjlCtrl.movieURL = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"QiDongmovie"ofType:@"mp4"]];//选择本地的视屏
        self.window.rootViewController = yjlCtrl;
        yjlCtrl.newwindow = self.window;
        //设置上下面这句话，将当前版本缓存到本地，下次对比一样，就不走启动视屏了。
        //也可以将这句话放在WSMovieController.m的进入应用方法里面
        //为了让每次都可以看到启动视屏，这句话先注释掉
        [[NSUserDefaults standardUserDefaults] setObject:version forKey:@"VersionCache"];
        
    }else{
            #pragma-mark 自定义tabbar
            [self BuildTAB];
    }
*/
    
    return YES;
}

#pragma -mark自定义tabbar
-(void)BuildTAB{
    
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
    self.window.rootViewController = MytabbarController;
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
//    }
//
//    else if (tabBarController.selectedIndex == 1){
//
//        NSLog(@"点击第2个吧");
//    }
//    else if (tabBarController.selectedIndex == 2){
//        NSLog(@"点击第3个吧");
//    }
//    else if (tabBarController.selectedIndex == 3){
//        NSLog(@"点击第4个吧");
//    }
//
//    else
//    {
//        NSLog(@"没有这个呢");
//    }
//
//    static NSString *tabBarDidSelectedNotification = @"tabBarDidSelectedNotification";
//    //当tabBar被点击时发出一个通知
//    [[NSNotificationCenter defaultCenter] postNotificationName:tabBarDidSelectedNotification object:nil userInfo:nil];
//}


- (void)applicationWillResignActive:(UIApplication *)application {
 
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
   
}


- (void)applicationWillTerminate:(UIApplication *)application {
    
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"_____"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
