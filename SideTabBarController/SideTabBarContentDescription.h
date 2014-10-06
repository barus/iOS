//
//  ContentDescription.h
//  SideTabBarController
//
//  Created by Admin on 30.9.14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SideTabBarItem;

@interface SideTabBarContentDescription : NSObject

@property(nonatomic, strong) SideTabBarItem *tabBarItem;
@property(nonatomic, strong) UIViewController *controller;

- (id)initWithViewController:(UIViewController *)contentController;

@end
