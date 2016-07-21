//
//  AppDelegate.m
//  Example
//
//  Created by Sibagatov Ildar on 21/07/16.
//  Copyright © 2016 SFÇD. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _window = [[UIWindow alloc] init];
    [_window setRootViewController:[[ViewController alloc] init]];
    [_window makeKeyAndVisible];
    return YES;
}

@end
