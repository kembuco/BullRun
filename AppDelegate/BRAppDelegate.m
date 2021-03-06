//
//  BRAppDelegate.m
//  Bull Run
//
//  Created by Dave Townsend on 12/13/12.
//  Copyright (c) 2012 Dave Townsend. All rights reserved.
//

#import "BRAppDelegate.h"
#import "MapViewController.h"
#import "Game.h"
#import "Unit.h"

@implementation BRAppDelegate

static MapViewController* mvController;

#pragma mark - UIApplicationDelegate Callbacks

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    game = [[Game alloc] init];
    
    mvController = [[MapViewController alloc] initWithNibName:nil bundle:nil];
    UINavigationController* navController = [[UINavigationController alloc] initWithRootViewController:mvController];
    [navController setNavigationBarHidden:YES];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    [[self window] setRootViewController:navController];
    
    [game doSighting:CSA];

    [self.window makeKeyAndVisible];

    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Battle@ Callbacks
- (void)movePhaseWillBegin {
    [mvController movePhaseWillBegin];
}

- (void)movePhaseDidEnd {
    [mvController movePhaseDidEnd];
}

- (void)unitNowSighted:(Unit*)unit {
    [mvController unitNowSighted:unit];
}

- (void)unitNowHidden:(Unit*)unit {
    [mvController unitNowHidden:unit];
}

- (void)moveUnit:(Unit*)unit to:(Hex)hex {
    [mvController moveUnit:unit to:hex];
}

@end
