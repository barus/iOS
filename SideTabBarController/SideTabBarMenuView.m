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
        self.autoresizesSubviews = YES;
        NSLog(@"%f", frame.size.width);
        self.backgroundColor = [[UIColor alloc] initWithRed:248.0/255.0 green:248.0/255.0 blue:248.0/255.0 alpha:1.0];
    }
    
    return self;
}

- (void)setItems:(NSArray *)items
{
    for (NSUInteger i = 0; i < items.count; i++) {
        SideTabBarItem *tabBarItem = [items objectAtIndex:i];
        [tabBarItem addTarget:self action:@selector(writeLog:) forControlEvents:UIControlEventTouchUpInside];
        [tabBarItem setTranslatesAutoresizingMaskIntoConstraints:NO];
        tabBarItem.tag = i + 1;
    }
    _items = items;
    [self initWithFrame:self.frame];
    
    NSInteger itemLimit = 5;
    visibleItemsCount = self.items.count > itemLimit ? itemLimit : self.items.count;
    [self refresh];
}

- (void)refresh
{
    [self deleteAllSideTabBarItems];
    [self addSideTabBarItems];
    [self selectItemWithTag:1];
    
    //NSInteger itemLimit = 5;
    //visibleItemsCount = self.items.count > itemLimit ? itemLimit : self.items.count;
    
    //for (NSUInteger i = 0; i < visibleItemsCount; i++) {
    //    SideTabBarItem *item = (SideTabBarItem *)[self.items objectAtIndex:i];
    //
    //    item.tag = i;
    //    [self addItem:item];
    //}
    
    //MoreViewController *moreController = [[MoreViewController alloc] initWithViewControllers:self.items];
    //SideTabBarItem *moreTab = [SideTabBarItem new];
    //moreTab.title = @"More";
    //[moreTab addTarget:self action:@selector(writeLog:) forControlEvents:UIControlEventTouchUpInside];
    //[self addItem:moreTab withTag:visibleItemsCount];
    
    
    /*SideTabBarItem *button = [SideTabBarItem new];
    button.title = @"WOW2";
    [button addTarget:self action:@selector(writeLog:) forControlEvents:UIControlEventTouchUpInside];
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    [[button layer] setBorderWidth:2.0f];
    [[button layer] setBorderColor:[[UIColor whiteColor] CGColor]];
    [self addItem:button withTag:0];*/
    
    //itemMaxWidth = itemMaxWidth < item.bounds.size.width ? item.bounds.size.width : itemMaxWidth;
    //button.frame = CGRectMake(0.0, 100.0, 100.0, 10.0);
    //item.frame = CGRectMake(0.0, i * itemHeight, self.bounds.size.width, 10.0);
    //item.tag = tag;
    //item.height = itemHeight;
    //item.itemTitle = @"Uh";
    //[self addSubview:button];
    
    //if (visibleItemsCount != self.items.count) {
        // show more item
    //}
}

- (void)addSideTabBarItems
{
    for (NSInteger i = 0; i < visibleItemsCount; i++) {
        [self addItemWithId:i];
    }
    
    //SideTabBarItem *button = [SideTabBarItem new];
    //button.itemTitle = @"WOW2";
    //[button addTarget:self action:@selector(writeLog:) forControlEvents:UIControlEventTouchUpInside];
    //[button setTitle:@"EEEE" forState:UIControlStateNormal];
    //button.frame = CGRectMake(0.0, 100.0, 100.0, 10.0);
    //[self addSubview:button];
    //[button setNeedsDisplay];
}

- (void)addItemWithId:(NSUInteger)itemId
{
    SideTabBarItem *item = (SideTabBarItem *)[self.items objectAtIndex:itemId];
    [self addSubview:item];
    [self setupConstraintsForItem:item];
}

- (void)addItem:(SideTabBarItem *)item
{
    [item addTarget:self action:@selector(writeLog:) forControlEvents:UIControlEventTouchUpInside];
    [item setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    //item.frame = CGRectMake(0.0, 700.0, 100.0, 10.0);
    //item.frame = CGRectMake(0.0, i * itemHeight, self.bounds.size.width, 10.0);
    //item.height = itemHeight;
    //item.itemTitle = @"Uh";
    [self addSubview:item];
    
    
    
    [[item layer] setBorderWidth:2.0f];
    [[item layer] setBorderColor:[[UIColor whiteColor] CGColor]];
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
    NSLog(@"%i - %f  - %f ", item.tag, visibleItemsCount,(1/visibleItemsCount + 2.0 * item.tag/visibleItemsCount));
    //[self addConstraint:[NSLayoutConstraint constraintWithItem:item attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0.0 constant:200.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:item attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:-0.0]];
    
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

- (void)changeSizeOfAllSideTabBarItemsWithWidth:(CGFloat) newWidth
{
    for (UIView *subview in self.subviews) {
        if ([subview isMemberOfClass:[SideTabBarItem class]]) {
        //    subview.bounds.size.width = newWidth;
        }
    }
}

- (void)writeLog:(id)sender
{
    if (self.selectedItem) {
        [self.selectedItem selectMe:NO];
    }
    
    self.selectedItem = (SideTabBarItem *)sender;
    [self.selectedItem selectMe:YES];
    
    NSLog(@"button was pressed");
    SEL selector = @selector(didSelectTabBarItem:);
	if (self.delegate && [self.delegate respondsToSelector:selector]) {
		[self.delegate performSelector:selector withObject:sender];
	}
}

- (void)setConstrants
{
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                                    attribute:NSLayoutAttributeWidth
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.superview
                                                                    attribute:NSLayoutAttributeWidth
                                                                   multiplier:0.5
                                                                     constant:-1]];
}

- (void)selectItemWithTag:(NSInteger)tag
{
    SideTabBarItem *item = (SideTabBarItem *)[self viewWithTag:tag];
    [item selectMe:YES];
    self.selectedItem = item;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

/*
- (void)didMoveToSuperview
{
    self.tabBarItemLimit = self.items.count > 5 ? 5 : self.items.count;
    if (self.items) {
        for (NSInteger counter = 0; counter < self.tabBarItemLimit; counter++) {
            SideTabBarItem *tabBarItem = [self.items objectAtIndex:counter];
            tabBarItem.delegate = self.delegate;
            //tabBarItem.frame = CGRectMake(0.0, counter*(self.itemWidth + self.itemSpacing), self.itemWidth, self.bounds.size.height);
            tabBarItem.frame = CGRectMake(0.0, counter*(self.itemHeight + self.itemSpacing), self.frame.size.width, 20);//self.itemHeight);
            NSLog(@"1 - %f 2 - %f", self.bounds.size.width, self.itemHeight);
            [self addSubview:tabBarItem];
        }
    }
    
    if (self.tabBarItemLimit != self.items.count) {
        NSInteger moreId = -1;
        SideTabBarItem *moreTabBarItem = [[SideTabBarItem alloc] initWithTitle:@"More..." image:nil selectedImage:nil id:moreId];
        moreTabBarItem.delegate = self.delegate;
        moreTabBarItem.frame = CGRectMake(0.0, self.tabBarItemLimit*(self.itemHeight + self.itemSpacing), self.frame.size.width, 20);//self.itemHeight);
        NSLog(@"1 - %f 2 - %f", self.bounds.size.width, self.itemHeight);
        [self addSubview:moreTabBarItem];
    }
}
*/


@end
