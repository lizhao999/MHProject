//
//  AppDelegate+JPush.m
//  CoreJPush
//
//  Created by 冯成林 on 15/9/17.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

#import "AppDelegate+JPush.h"
#import "APService.h"
#import "CoreJPush.h"

@implementation AppDelegate (JPush)


- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    NSLog(@"My token is: %@", deviceToken);

    // Required
    [APService registerDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
    // Required
    [APService handleRemoteNotification:userInfo];
}

-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    [APService showLocalNotificationAtFront:notification identifierKey:nil];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    
    NSArray *buttonArray;
    UIImage *icon;
    NSString *subtitle;
    
    NSDictionary *aps = userInfo[@"aps"];
    subtitle = aps[@"alert"];
//    icon = [UIImage imageNamed:@"icon_60pt"];
//    MPGNotification *notification = [MPGNotification notificationWithTitle:@"极互联代理端" subtitle:subtitle backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.855] iconImage:icon];
//    [notification setButtonConfiguration:buttonArray.count withButtonTitles:buttonArray];
//    notification.duration = 2.0;
//    notification.swipeToDismissEnabled = NO;
//    
//    __weak typeof(self) weakSelf = self;
//    
//    [notification setTitleColor:[UIColor whiteColor]];
//    [notification setSubtitleColor:[UIColor whiteColor]];
//    [notification setAnimationType:MPGNotificationAnimationTypeLinear];
//    [notification show];
//    [[NSNotificationCenter defaultCenter]postNotificationName:@"Push" object:self userInfo:nil];

//    [[NSUserDefaults standardUserDefaults]setObject:@"0" forKey:@"push"];
//
//    NSString *str = [NSString stringWithFormat:@"%@",userInfo[@"type"]];
//    if ([str isEqualToString:@"3"]) {
//        if (userInfo[@"status"]) {
//            self.pushType = @"3";
//        }
//    }
//    self.pushType = str;
//
//    // IOS 7 Support Required
//    [APService handleRemoteNotification:userInfo];
//    completionHandler(UIBackgroundFetchResultNewData);
//    if (![UIApplication sharedApplication].applicationState == UIApplicationStateActive) {
//        [[NSNotificationCenter defaultCenter]postNotificationName:@"Push" object:self userInfo:@{@"pushType":str}];
//    }
//    CoreJPush *jpush = [CoreJPush sharedCoreJPush];
//    [jpush didReceiveRemoteNotification:userInfo];
// 
////    UIViewController *vi = [UIApplication sharedApplication].keyWindow.rootViewController;
////    
////    RootTabBarController *rootTab = [[RootTabBarController alloc] init];
////    rootTab.selectedIndex = 0;
////    [vi presentViewController:rootTab animated:false completion:nil];
////    
//    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    [application setApplicationIconBadgeNumber:0];
    [APService setBadge:0];
//    [application cancelAllLocalNotifications];
}

@end
