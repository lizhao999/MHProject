//
//  MainNavViewController.m
//  PerfectProject
//
//  Created by Meng huan on 15/2/26.
//  Copyright (c) 2015年 M.H Co.,Ltd. All rights reserved.
//

#import "MainNavViewController.h"
//#import "CustomTabBarViewController.h"

@interface MainNavViewController ()

@end

@implementation MainNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 隐藏 navigation bar
//    [self setNavigationBarHidden:YES animated:NO];
   
    UIFont *font = [UIFont systemFontOfSize:17.0];
    [[UINavigationBar appearance] setTintColor:[UIColor blackColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:font}];
//    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor yellowColor],UITextAttributeTextColor, [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.6],UITextAttributeTextShadowColor,[UIFont fontWithName:@"Marion-Italic" size:24.0],UITextAttributeFont,nil]];

    [UINavigationBar appearance].translucent = NO;
 //设置背景颜色
//    [[UINavigationBar appearance] setBarTintColor:[UIC olor colorWithRed:0.173 green:0.180 blue:0.184 alpha:1.000]];
    //替换<
 
  
    [[UINavigationBar appearance] setBackIndicatorImage:[UIImage imageNamed:@"back"]];
    [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"back" ]];
  
//    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    NSString *navImgPath = [[NSBundle mainBundle]pathForResource:@"。。" ofType:@"png"];
    UIImage *navBackground;
    if (navImgPath) {
        navBackground = [UIImage imageWithContentsOfFile:navImgPath];
    }else
    {
        navBackground = [self imageWithColor:[UIColor whiteColor] andSize:self.navigationBar.frame.size];
    }
//    [self.navigationBar setBackgroundColor:[UIColor whiteColor]];
    
    [[UINavigationBar appearance] setBackgroundImage:navBackground forBarMetrics:UIBarMetricsDefault];
  
    //去除下面的阴影 线
  //  [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
  
    
    
//    [self.navigationBar setBackgroundImage:navBackground forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
 
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];//状态栏颜色
    
//    // 构造首页
//    self.homeViewController = [[HomeViewController alloc] initWithNibName:nil bundle:nil];
//    [self pushViewController:self.homeViewController animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count>0) {
        viewController.hidesBottomBarWhenPushed = true;
    }
    [super pushViewController:viewController animated:YES];

}

-(NSArray<UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated
{
    if (![self.viewControllers[self.viewControllers.count-1] isKindOfClass:NSClassFromString(@"ShopListViewController")]) {
//        [CustomTabBarViewController sharedTabBar].selectedIndex = 0;
     }
    
    return  [super popToRootViewControllerAnimated:YES];
}

- (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size
{
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height+20);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
