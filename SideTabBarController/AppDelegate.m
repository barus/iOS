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
    
    NSString *urlAddress = @"http://www.tut.by";
    NSURL *url = [NSURL URLWithString:urlAddress];
    UIWebView *webView = [UIWebView new];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [webView loadRequest:requestObj];
    
    UIViewController *controller = [UIViewController new];
    controller.view = webView;
    
    SideTabBarItem *tabBarItem = [[SideTabBarItem alloc] initWithTitle:@"First" image:[UIImage imageNamed:@"emoji_objects.png"]];
    tabBarItem.selectedImage = [UIImage imageNamed:@"UIImageNameIndicatorDot@2x.png"];
    
    SideTabBarContentDescription *content = [SideTabBarContentDescription new];
    content.controller = controller;
    content.tabBarItem = tabBarItem;
    
    // second item
    
    NSString *urlAddress1 = @"http://www.bbc.com";
    NSURL *url1 = [NSURL URLWithString:urlAddress1];
    NSURLRequest *requestObj1 = [NSURLRequest requestWithURL:url1];
    UIWebView *webView1 = [UIWebView new];
    [webView1 loadRequest:requestObj1];
    
    UIViewController *controller1 = [UIViewController new];
    controller1.view = webView1;
    
    SideTabBarItem *tabBarItem1 = [[SideTabBarItem alloc] initWithTitle:@"Second" image:[UIImage imageNamed:@"emoji_people.png"]];
    tabBarItem1.selectedImage = [UIImage imageNamed:@"UIImageNameIndicatorDot@2x.png"];
    
    SideTabBarContentDescription *content1 = [SideTabBarContentDescription new];
    content1.controller = controller1;
    content1.tabBarItem = tabBarItem1;
    
    // third item
    
    NSString *urlAddress2 = @"http://www.ororo.tv";
    NSURL *url2 = [NSURL URLWithString:urlAddress2];
    NSURLRequest *requestObj2 = [NSURLRequest requestWithURL:url2];
    UIWebView *webView2 = [UIWebView new];
    [webView2 loadRequest:requestObj2];
    
    UIViewController *controller2 = [UIViewController new];
    controller2.view = webView2;
    
    SideTabBarItem *tabBarItem2 = [[SideTabBarItem alloc] initWithTitle:@"Third" image:[UIImage imageNamed:@"emoji_places.png"]];
    tabBarItem2.selectedImage = [UIImage imageNamed:@"UIImageNameIndicatorDot@2x.png"];
    
    SideTabBarContentDescription *content2 = [SideTabBarContentDescription new];
    content2.controller = controller2;
    content2.tabBarItem = tabBarItem2;
    
    SideTabBarController *mainController = [SideTabBarController new];
    mainController.contentDescriptions = [NSArray arrayWithObjects:content, content1, content2, [SideTabBarContentDescription new] , nil];
    self.window.rootViewController = mainController;
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
