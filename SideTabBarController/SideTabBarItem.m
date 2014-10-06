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

@property(nonatomic) UIImage *image;

@end

@implementation SideTabBarItem

- (id)init
{
    self = [[super class] buttonWithType:UIButtonTypeRoundedRect];
    if (self)
    {
        [self setTintColor:[[UIColor alloc] initWithRed:175.0/255.0 green:175.0/255.0 blue:175.0/255.0 alpha:1.0]];
    }
    
    return self;
}

- (id)initWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage;
{
    self = [self initWithTitle:title image:image];
    self.selectedImage = selectedImage;
    
    return self;
}

- (id)initWithTitle:(NSString *)title image:(UIImage *)image
{
    self = [self init];
    [self setTitle:title];
    self.image = image;
    [self setImage:image forState:UIControlStateNormal];
    
    return self;
}

- (void)setTitle:(NSString *)title
{
    [self setTitle:title forState:UIControlStateNormal];
}

- (void)selectMe:(BOOL)sel
{
    if (sel) {
        if (self.selectedImage) {
            [self setImage:self.selectedImage forState:UIControlStateNormal];
        }
        [self setTintColor:[[UIColor alloc] initWithRed:17.0/255.0 green:140.0/255.0 blue:255.0/255.0 alpha:1.0]];
    } else {
        [self setTintColor:[[UIColor alloc] initWithRed:175.0/255.0 green:175.0/255.0 blue:175.0/255.0 alpha:1.0]];
        [self setImage:self.image forState:UIControlStateNormal];
    }
}

@end
