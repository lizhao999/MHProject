//
//  HGTabView.h
//  HiGo
//
//  Created by Think_lion on 15/7/25.
//  Copyright (c) 2015年 Think_lion. All rights reserved.
//

#import <UIKit/UIKit.h>

@class  MHTabView;

@protocol MHTabViewDelegate <NSObject>

@optional
-(void)tabView:(MHTabView*)tabView didSelectedFrom:(int)from toIndex:(int)to;

@end


@interface MHTabView : UIView

-(void)addTabItem:(UITabBarItem*)item;
@property (nonatomic,weak) id<MHTabViewDelegate>delegate;

@end