//
//  EMAppDelegate.m
//  test
//
//  Created by garage1 on 8/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EMAppDelegate.h"

@implementation EMAppDelegate

@synthesize window = _window;
@synthesize urlEndpoint;

- (void)customizeInterface {
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque];
    
    UIImage *headerImage = [UIImage imageNamed:@"header.png"];
    [[UINavigationBar appearance] setBackgroundColor:[UIColor blackColor]];
    [[UINavigationBar appearance] setBackgroundImage:headerImage forBarMetrics: UIBarMetricsDefault];
    
    [[UIToolbar appearance] setBackgroundColor:[UIColor blackColor]];
    [[UIToolbar appearance] setBackgroundImage:headerImage forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
    
    //UIImage *backbutton = [[UIImage imageNamed:@"backbutton"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 15, 0, 8)];
    //[[UIBarButtonItem appearance] setBackButtonBackgroundImage:backbutton forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    //[[UITabBar appearance] setBackgroundColor:[UIColor clearColor]];
    //[[UITabBar appearance] setSelectionIndicatorImage:[UIImage imageNamed:@"tabBarItemSelected.png"]];
    //[[UITabBar appearance] setFrame:CGRectMake(0, 0, 320, 20)];
    
    // UITabBarController
    
    UIImage* tabBarBackground = [UIImage imageNamed:@"tabbar.png"];
    [[UITabBar appearance] setBackgroundImage:tabBarBackground];
    
    UITabBarController *tabController = (UITabBarController *)self.window.rootViewController;
    
    UITabBarItem *newsTab = [tabController.tabBar.items objectAtIndex:0];
    [newsTab setFinishedSelectedImage:[UIImage imageNamed:@"news"] withFinishedUnselectedImage:[UIImage imageNamed:@"news"]];
    //[newsTab setTitle:@""];
    
    UITabBarItem *feedTab = [tabController.tabBar.items objectAtIndex:1];
    [feedTab setFinishedSelectedImage:[UIImage imageNamed:@"sports"] withFinishedUnselectedImage:[UIImage imageNamed:@"sports"]];
    //[feedTab setTitle:@""];
    
    UITabBarItem *statsTab = [tabController.tabBar.items objectAtIndex:2];
    [statsTab setFinishedSelectedImage:[UIImage imageNamed:@"wknd"] withFinishedUnselectedImage:[UIImage imageNamed:@"wknd"]];
    //[statsTab setTitle:@""];
    
    UITabBarItem *dealsTab = [tabController.tabBar.items objectAtIndex:3];
    [dealsTab setFinishedSelectedImage:[UIImage imageNamed:@"events"] withFinishedUnselectedImage:[UIImage imageNamed:@"events"]];
    //[dealsTab setTitle:@""];
    
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    self.urlEndpoint = @"http://dailyemerald.github.com/News-App/";
    
    [self customizeInterface];
    
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
