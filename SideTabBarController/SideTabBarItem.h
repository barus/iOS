//
//  SideTabBarItem.h
//  SideTabBarController
//
//  Created by Admin on 25.9.14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SideTabBarItem : UIButton

@property(nonatomic, strong) NSString *title;
@property(nonatomic) UIImage *selectedImage;

- (id)initWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage;
- (id)initWithTitle:(NSString *)title image:(UIImage *)image;
- (void)selectMe:(BOOL)sel;

@end