//
//  SideTabBarView.h
//  SideTabBarController
//
//  Created by Admin on 3.10.14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SideTabBarMenuView;

@interface SideTabBarView : UIView

@property(nonatomic, weak, readonly) SideTabBarMenuView *menu;
@property(nonatomic, weak) UIView *contentView;

@end
