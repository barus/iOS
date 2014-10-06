//
//  MoreViewController.m
//  SideTabBarController
//
//  Created by Admin on 29.9.14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "MoreViewController.h"
#import "SideTabBarContentDescription.h"
#import "SideTabBarItem.h"

@interface MoreViewController ()

@property(nonatomic, strong) NSArray *viewControllers;

@end

@implementation MoreViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithViewControllers:(NSArray *) controllersArray
{
    self = [super init];
    if (self) {
        self.viewControllers = controllersArray;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationItem setTitle:@"More"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.viewControllers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:CellIdentifier];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDetailButton;
    cell.textLabel.text = ((SideTabBarContentDescription *)[self.viewControllers objectAtIndex:indexPath.row]).tabBarItem.title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SideTabBarContentDescription *nextContent = (SideTabBarContentDescription *)[self.viewControllers objectAtIndex:indexPath.row];
    [self.navigationItem setTitle:nextContent.tabBarItem.title];
    [self.navigationController pushViewController:nextContent.controller animated:YES];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]
                                    initWithTitle:@"Back"
                                    style:UIBarButtonItemStylePlain
                                    target:self
                                    action:@selector(goToRootController:)];
    
    nextContent.controller.navigationItem.rightBarButtonItem = rightButton;
}

- (void)goToRootController:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


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
