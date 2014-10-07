//
//  SideTabBarController.m
//  SideTabBarController
//
//  Created by Admin on 25.9.14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "SideTabBarController.h"
#import "SideTabBarItem.h"
#import "SideTabBarMenuView.h"
#import "SideTabBarController/SideTabBarContentDescription.h"
#import "SideTabBarView.h"

@interface SideTabBarController()

@property(nonatomic, strong) NSArray *items;

@end

@implementation SideTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tabBar.items = self.items;
    self.tabBar.delegate = self;
}

- (SideTabBarMenuView *)tabBar
{
    return ((SideTabBarView *)self.view).menu;
}

- (void)setContentDescriptions:(NSArray *)descriptions
{
    NSMutableArray *sideTabBarItems = [NSMutableArray new];
    
    for (SideTabBarContentDescription *description in descriptions) {
        if (description.tabBarItem) {
            [sideTabBarItems addObject:description.tabBarItem];
        }
    }
    
    self.items = (NSArray *)sideTabBarItems.copy;
    _contentDescriptions = descriptions;
    
    if (self.selectedTabBarContentDescription) {
        [self.selectedTabBarContentDescription.controller willMoveToParentViewController:nil];
    }
    
    self.selectedIndex = 0;
    self.selectedTabBarContentDescription = (SideTabBarContentDescription *)[descriptions objectAtIndex:self.selectedIndex];
}

- (void)loadView
{
    SideTabBarView *mainView = [SideTabBarView new];
    self.view = mainView;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (self.selectedTabBarContentDescription.controller.parentViewController == self) {
        return;
    }
    
    [self addChildViewController:self.selectedTabBarContentDescription.controller];
    [self.selectedTabBarContentDescription.controller didMoveToParentViewController:self];
    ((SideTabBarView *)self.view).contentView = self.selectedTabBarContentDescription.controller.view;
}

- (void)didSelectTabBarItem:(SideTabBarItem *)sender
{
    if (self.selectedIndex == sender.tag - 1) {
        return;
    }
    
    [self.selectedTabBarContentDescription.controller willMoveToParentViewController:nil];
    
    self.selectedIndex = (NSUInteger) sender.tag - 1;
    self.selectedTabBarContentDescription = (SideTabBarContentDescription *)[self.contentDescriptions objectAtIndex:self.selectedIndex];
    
    [self addChildViewController:self.selectedTabBarContentDescription.controller];
    [self.selectedTabBarContentDescription.controller didMoveToParentViewController:self];
    ((SideTabBarView *)self.view).contentView = self.selectedTabBarContentDescription.controller.view;
}

@end
