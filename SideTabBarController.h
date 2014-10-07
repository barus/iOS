//
//  SideTabBarController.h
//  SideTabBarController
//
//  Created by Admin on 25.9.14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SideTabBarMenuView.h"

@class SideTabBarContentDescription;

@interface SideTabBarController : UIViewController <SideBarDelegate>

@property(nonatomic, strong) NSArray *contentDescriptions;
@property(nonatomic, weak, readonly) SideTabBarMenuView *tabBar;
@property(nonatomic) NSUInteger selectedIndex;
@property(nonatomic, assign) SideTabBarContentDescription *selectedTabBarContentDescription;

- (void)didSelectTabBarItem:(SideTabBarItem *)item;

@end