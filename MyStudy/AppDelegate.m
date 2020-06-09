//
//  AppDelegate.m
//  MyStudy
//
//  Created by 王家楠 on 2020/6/8.
//  Copyright © 2020 王家楠. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    ViewController *vc = [[ViewController alloc] init];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    
    CGRect frame = [UIScreen mainScreen].bounds;
    
    self.window = [[UIWindow alloc] initWithFrame:frame];
    
    self.window.rootViewController = nav;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}




@end
