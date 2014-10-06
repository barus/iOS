//
//  AppDelegate.m
//  SideTabBarController
//
//  Created by Admin on 25.9.14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "AppDelegate.h"
#import "SideTabBarController.h"
#import "SideTabBarItem.h"
#import "SideTabBarContentDescription.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // first item
    SideTabBarItem *tabBarItem = [SideTabBarItem new];
    tabBarItem.title = @"First";
    
    UIViewController* firstController = [UIViewController new];
    UIWebView* webView = [UIWebView new];
    
    NSString *urlAddress = @"http://www.tut.by";
    NSURL *url = [NSURL URLWithString:urlAddress];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [webView loadRequest:requestObj];
    firstController.view = webView;
    
    SideTabBarContentDescription *content = [SideTabBarContentDescription new];
    content.controller = firstController;
    content.tabBarItem = tabBarItem;
    
    // second item
    SideTabBarItem *tabBarItem1 = [SideTabBarItem new];
    tabBarItem1.title = @"Second";
    
    UIViewController* firstController1 = [UIViewController new];
    UIWebView* webView1 = [UIWebView new];
    
    NSString *urlAddress1 = @"http://www.bbc.com";
    NSURL *url1 = [NSURL URLWithString:urlAddress1];
    NSURLRequest *requestObj1 = [NSURLRequest requestWithURL:url1];
    [webView1 loadRequest:requestObj1];
    firstController1.view = webView1;
    
    SideTabBarContentDescription *content1 = [SideTabBarContentDescription new];
    content1.controller = firstController1;
    content1.tabBarItem = tabBarItem1;
    
    // third item
    SideTabBarItem *tabBarItem2 = [SideTabBarItem new];
    tabBarItem2.title = @"Third";
    
    UIViewController* firstController2 = [UIViewController new];
    UIWebView* webView2 = [UIWebView new];
    
    NSString *urlAddress2 = @"http://www.ororo.tv";
    NSURL *url2 = [NSURL URLWithString:urlAddress2];
    NSURLRequest *requestObj2 = [NSURLRequest requestWithURL:url2];
    [webView2 loadRequest:requestObj2];
    firstController2.view = webView2;
    
    SideTabBarContentDescription *content2 = [SideTabBarContentDescription new];
    content2.controller = firstController2;
    content2.tabBarItem = tabBarItem2;
    
    
    SideTabBarController *controller = [SideTabBarController new];
    controller.contentDescriptions = [NSArray arrayWithObjects:content, content1, content2, nil];
    self.window.rootViewController = controller;
    [self.window makeKeyAndVisible];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
