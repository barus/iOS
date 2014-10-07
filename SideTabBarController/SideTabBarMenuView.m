//
//  SideTabBar.m
//  SideTabBarController
//
//  Created by Admin on 25.9.14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "SideTabBarMenuView.h"
#import "SideTabBarItem.h"
#import "MoreViewController.h"

@interface SideTabBarMenuView()
{
    CGFloat visibleItemsCount;
}

@end

@implementation SideTabBarMenuView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor alloc] initWithRed:248.0/255.0 green:248.0/255.0 blue:248.0/255.0 alpha:1.0];
    }
    
    return self;
}

- (void)setItems:(NSArray *)items
{
    for (NSUInteger i = 0; i < items.count; i++) {
        SideTabBarItem *tabBarItem = [items objectAtIndex:i];
        [tabBarItem addTarget:self action:@selector(itemWasSelected:) forControlEvents:UIControlEventTouchUpInside];
        [tabBarItem setTranslatesAutoresizingMaskIntoConstraints:NO];
        tabBarItem.tag = i + 1;
    }
    
    _items = items;
    visibleItemsCount = self.items.count;
    
    [self refresh];
}

- (void)refresh
{
    [self deleteAllSideTabBarItems];
    [self addSideTabBarItems];
    [self selectItemWithTag:1];
}

- (void)addSideTabBarItems
{
    for (NSInteger i = 0; i < visibleItemsCount; i++) {
        [self addItemWithId:i];
    }
}

- (void)addItemWithId:(NSUInteger)itemId
{
    SideTabBarItem *item = (SideTabBarItem *)[self.items objectAtIndex:itemId];
    [self addSubview:item];
    [self setupConstraintsForItem:item];
}

- (void)setupConstraintsForItem:(SideTabBarItem *)item
{
    [self addConstraint:[NSLayoutConstraint constraintWithItem:item attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0]];
    
    if (item.tag == (NSUInteger)visibleItemsCount) {
        [self addConstraint:[NSLayoutConstraint constraintWithItem:item attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0]];
    } else {
        [self addConstraint:[NSLayoutConstraint constraintWithItem:item attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.0/visibleItemsCount constant:0.0]];
    }
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:item attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:item attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:item attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:(1/visibleItemsCount + 2.0 * (item.tag - 1)/visibleItemsCount) constant: 0.0]];
}

- (void)deleteAllSideTabBarItems
{
    for (UIView *subview in self.subviews) {
        if ([subview isMemberOfClass:[SideTabBarItem class]]) {
            [subview removeFromSuperview];
        }
    }
}

- (void)itemWasSelected:(id)sender
{
    if (self.selectedItem) {
        [self.selectedItem selectMe:NO];
    }
    
    self.selectedItem = (SideTabBarItem *)sender;
    [self.selectedItem selectMe:YES];
    
    SEL selector = @selector(didSelectTabBarItem:);
	if (self.delegate && [self.delegate respondsToSelector:selector]) {
		[self.delegate performSelector:selector withObject:sender];
	}
}

- (void)selectItemWithTag:(NSInteger)tag
{
    SideTabBarItem *item = (SideTabBarItem *)[self viewWithTag:tag];
    [item selectMe:YES];
    self.selectedItem = item;
}

@end
