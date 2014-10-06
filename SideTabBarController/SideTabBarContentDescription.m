//
//  ContentDescription.m
//  SideTabBarController
//
//  Created by Admin on 30.9.14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "SideTabBarContentDescription.h"

@implementation SideTabBarContentDescription

- (id)initWithViewController:(UIViewController *)contentController
{
    self = [super init];
    self.controller = contentController;
    
    return self;
}
@end
