//
//  MHTabBarController.m
//  MHProject
//
//  Created by 李钊 on 16/7/13.
//  Copyright © 2016年 Mmt. All rights reserved.
//

#import "MHTabBarController.h"
#import "MHTabView.h"
#import "MHTabButton.h"
#import "MainNavViewController.h"
#import "ViewController.h"


@interface MHTabBarController ()<MHTabViewDelegate>
@property (nonatomic,weak) MHTabView *tabView;

@end

@implementation MHTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.tabBar setShadowImage:[UIImage new]];
//    [[UITabBar appearance] setShadowImage:[UIImage new]];
    
//    [[UITabBar appearance]setBackgroundImage:[UIImage new]];
    //1.添加底部自定义的标签栏
    [self setupTabBar];
    //2.添加子控制器
    [self addChildVc];

    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    ///隐藏系统TabbarView
//     return;
    for(UIView *zv in self.tabBar.subviews){
        if([zv isKindOfClass:[UIControl class]]){
            [zv removeFromSuperview];
        }
    }
    
}

#pragma mark - 添加底部的标签栏
-(void)setupTabBar
{
    MHTabView *tabView=[[MHTabView alloc]initWithFrame:self.tabBar.bounds];
    tabView.delegate=self;
    [self.tabBar addSubview:tabView];
    self.tabView=tabView;
}
#pragma mark 实现底部标签栏按钮点击的代理方法
-(void)tabView:(MHTabView *)tabView didSelectedFrom:(int)from toIndex:(int)to
{
    self.selectedIndex=to;
}


#pragma mark 添加子控制器
-(void)addChildVc
{
    //1.添加首页控制器
    ViewController  *home=[[ViewController alloc]init];
    [self addChildViewController:home title:@"首页" image:@"home" selectedImage:@"homeH"];
    ViewController  *home1=[[ViewController alloc]init];
    [self addChildViewController:home1 title:@"全球购" image:@"earth" selectedImage:@"earthH"];

    ViewController  *home2=[[ViewController alloc]init];
    [self addChildViewController:home2 title:@"设置" image:@"user" selectedImage:@"userH"];

//    //2.全球购
//    HGGlobalController *global=[[HGGlobalController alloc]init];
//    [self addChildViewController:global title:@"全球购" image:@"earth" selectedImage:@"earthH"];
//    //3.消息通知
//    HGMesageController *message=[[HGMesageController alloc]init];
//    [self addChildViewController:message title:@"购物信息" image:@"Message" selectedImage:@"MessageH"];
//    //4.购物车
//    HGCarController *car=[[HGCarController alloc]init];
//    [self addChildViewController:car title:@"购物车" image:@"cart" selectedImage:@"cartH"];
//    //5.我
//    HGMeController *me=[[HGMeController alloc]init];
//    [self addChildViewController:me title:@"设置" image:@"user" selectedImage:@"userH"];
}

#pragma mark 添加子控制器的方法

-(void)addChildViewController:(UIViewController *)childVc title:(NSString*)title image:(NSString*)image selectedImage:(NSString*)selectedImage
{
    

    

    
     childVc.navigationItem.title=title;
     childVc.tabBarItem.image=[UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage=[UIImage imageNamed:selectedImage];
//    childVc.tabBarItem.image = [[UIImage imageNamed:@"image"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:@"selectedImage"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    MainNavViewController *nav=[[MainNavViewController alloc]initWithRootViewController:childVc];
    nav.tabBarItem.title = title;
//    nav.tabBarItem.image = [[UIImage imageNamed:@"image"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    nav.tabBarItem.selectedImage = [[UIImage imageNamed:@"selectedImage"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    [self addChildViewController:nav];
    
     [self.tabView addTabItem:childVc.tabBarItem];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
 

