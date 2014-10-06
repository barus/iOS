//
//  SideTabBarItem.m
//  SideTabBarController
//
//  Created by Admin on 25.9.14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "SideTabBarItem.h"
#import "SideTabBarMenuView.h"

@interface SideTabBarItem()

@end

@implementation SideTabBarItem

- (id)init
{
    self = [[super class] buttonWithType:UIButtonTypeRoundedRect];
    [self setTitleColor:[[UIColor alloc] initWithRed:175.0/255.0 green:175.0/255.0 blue:175.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    
    return self;
}

- (void)setTitle:(NSString *)title
{
    [self setTitle:title forState:UIControlStateNormal];
}

- (void)selectMe:(BOOL)sel
{
    if (sel) {
        [self setTitleColor:[[UIColor alloc] initWithRed:17.0/255.0 green:140.0/255.0 blue:255.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    } else {
        [self setTitleColor:[[UIColor alloc] initWithRed:175.0/255.0 green:175.0/255.0 blue:175.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    }
}

@end
