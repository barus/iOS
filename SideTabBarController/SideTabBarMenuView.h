//
//  SideTabBar.h
//  SideTabBarController
//
//  Created by Admin on 25.9.14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SideTabBarItem;
@protocol SideBarDelegate;

@interface SideTabBarMenuView : UIView

@property(nonatomic, assign) id<SideBarDelegate> delegate;
@property(nonatomic, strong) NSArray *items;
@property(nonatomic, assign) SideTabBarItem *selectedItem;

@end

@protocol SideBarDelegate <NSObject>

- (void)didSelectTabBarItem:(SideTabBarItem *)sender;

@end

