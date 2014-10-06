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

- (id)initWithFrame:(CGRect)frame title:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage tag:(NSInteger)itemTag;
- (void)selectMe:(BOOL)sel;

@end