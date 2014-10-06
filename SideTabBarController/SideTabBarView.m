//
//  SideTabBarView.m
//  SideTabBarController
//
//  Created by Admin on 3.10.14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "SideTabBarView.h"
#import "SideTabBarMenuView.h"

@implementation SideTabBarView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configure];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self configure];
    }
    return self;
}

- (id)init
{
    return [self initWithFrame:CGRectZero];
}

- (void)configure
{
    self.backgroundColor = [UIColor whiteColor];
    self.userInteractionEnabled = YES;
    
    UIView *content = [UIView new];
    [content setTranslatesAutoresizingMaskIntoConstraints:NO];
    content.backgroundColor = [UIColor whiteColor];
    [self addSubview:content];
    _contentView = content;
    
    SideTabBarMenuView *menu = [SideTabBarMenuView new];
    [menu setTranslatesAutoresizingMaskIntoConstraints:NO];
    //menu.backgroundColor = [UIColor grayColor];
    [self addSubview:menu];
    _menu = menu;
    
    [self setupConstraints];
}

- (void)setupConstraints
{
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.menu attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.menu attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.menu attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:0.25 constant:0.0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.menu attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0]];
    
    //[self addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0]];
    
    //[self addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0]];
    
    //[self addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.menu attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0]];
    
    //[self addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0]];
}

- (void)setContentView:(UIView *)contentView
{
    [_contentView removeFromSuperview];
    _contentView = contentView;
    [_contentView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addSubview:_contentView];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_contentView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_contentView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_contentView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.menu attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_contentView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0]];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
@end
