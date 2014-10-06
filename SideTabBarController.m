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
#import "MoreViewController.h"
#import "SideTabBarController/SideTabBarContentDescription.h"
#import "SideTabBarView.h"

@interface SideTabBarController()

@property(nonatomic, strong) NSArray *items;
@property(nonatomic, strong) UIView *contentView;
@property(nonatomic) NSInteger itemsLimit;

@end

@implementation SideTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tabBar.items = self.items;
    self.tabBar.delegate = self;
    ((SideTabBarView *)self.view).contentView.backgroundColor = [UIColor whiteColor];
    //self.tabBar.
    //CGFloat tabBarWeight = self.view.bounds.size.width/6.0;
    //CGRect tabBarRect = CGRectMake(0.0, 0.0, tabBarWeight, self.view.bounds.size.height);
    //CGRect contentViewRect = CGRectMake(tabBarWeight, 0.0, self.view.bounds.size.width - tabBarWeight, self.view.bounds.size.height);
    
    //self.tabBar = [[SideTabBar alloc] initWithFrame:tabBarRect];
    //self.tabBar.delegate = self;
    
    //self.contentView = [[UIView alloc] initWithFrame:contentViewRect];
    //[self.tabBar setBackgroundColor:[UIColor redColor]];
    //[self.contentView setBackgroundColor:[UIColor blueColor]];
    
    //[self.view addSubview:self.tabBar];
    //[self.view addSubview:self.contentView];
    
    //[self updateViewConstraints1];
    
    //[emptyItemContentView addSubview:currentItemContentView];
    //[self.tabBar updateConstraints];
    
    //NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.tabBar attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0f constant:20.f];
    
    //[self.view addConstraint:constraint];
    //[self.tabBar setNeedsUpdateConstraints];
    // Do any additional setup after loading the view.
    //[self updateViewConstraints1];
}

- (SideTabBarMenuView *)tabBar
{
    return ((SideTabBarView *)self.view).menu;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
        // TODO: remove it
    }
    
    self.selectedTabBarContentDescription = (SideTabBarContentDescription *)[descriptions objectAtIndex:0];
}

- (void)loadView
{
    SideTabBarView *mainView = [SideTabBarView new];
    self.view = mainView;
}

/*
- (void)updateViewConstraints
{
    //[self setupConstraints];
    //[super updateViewConstraints];
}*/



/*- (void)showContent:(SideTabBarContentDescription *)contentDescription
{
    [self addChildViewController:<#(UIViewController *)#>]
}*/

/*
- (void) replaceCurrentViewWithView:(UIView *) newView
{
    if (currentItemContentView) {
        [currentItemContentView removeFromSuperview];
    }
    [emptyItemContentView addSubview:newView];
    currentItemContentView = newView;
}*/

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"current selected id %i", self.selectedIndex);
    [super viewWillAppear:animated];
    
    if (self.selectedTabBarContentDescription.controller.parentViewController == self) {
        return;
    }
    
    [self addChildViewController:self.selectedTabBarContentDescription.controller];
    [self.selectedTabBarContentDescription.controller didMoveToParentViewController:self];
    ((SideTabBarView *)self.view).contentView = self.selectedTabBarContentDescription.controller.view;
    
    //self.selectedTabBarContentDescription = (SideTabBarContentDescription *)[self.contentDescriptions objectAtIndex:self.selectedIndex];
    
    //self.selectedTabBarContentDescription.controller.view.frame = ((SideTabBarView *)self.view).contentView.bounds;
    //[self addChildViewController:self.selectedTabBarContentDescription.controller];
    //[((SideTabBarView *)self.view).contentView addSubview:self.selectedTabBarContentDescription.controller.view];
    //[self.selectedTabBarContentDescription.controller didMoveToParentViewController:self];
}

-(void)updateViewConstraints1
{/*
    NSLog(@"size is %f", self.view.frame.size.width);
    // Height constraint
    [self.view.superview addConstraint:[NSLayoutConstraint constraintWithItem:self.tabBar
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:0.5
                                                           constant:-[UIApplication sharedApplication].statusBarFrame.size.height]];*/
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.tabBar
                                                                    attribute:NSLayoutAttributeWidth
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.contentView
                                                                    attribute:NSLayoutAttributeWidth
                                                                   multiplier:0.4
                                                                     constant:0.0]];
}

- (void)didSelectTabBarItem:(SideTabBarItem *)sender
{
    
    if (self.selectedIndex == sender.tag - 1) {
        return;
    }
    
    [self.selectedTabBarContentDescription.controller willMoveToParentViewController:nil];
    
    self.selectedIndex = (NSUInteger) sender.tag - 1;
    self.selectedTabBarContentDescription = (SideTabBarContentDescription *)[self.contentDescriptions objectAtIndex:self.selectedIndex];
    
    //self.selectedTabBarContentDescription.controller.view.frame = ((SideTabBarView *)self.view).contentView.bounds;
    //self.selectedTabBarContentDescription.controller.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    [self addChildViewController:self.selectedTabBarContentDescription.controller];
    [self.selectedTabBarContentDescription.controller didMoveToParentViewController:self];
    ((SideTabBarView *)self.view).contentView = self.selectedTabBarContentDescription.controller.view;
    //[((SideTabBarView *)self.view).contentView addSubview:self.selectedTabBarContentDescription.controller.view];
    
}

/*
- (void)addConstraintForView:(UIView *)view
{
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.menu attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0]];
}*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
