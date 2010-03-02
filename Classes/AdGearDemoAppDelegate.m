//
//  AdGearDemoAppDelegate.m
//  AdGearDemo
//
//  Created by Louis-Philippe Gauthier on 25/10/09.
//  Copyright Bloom Digigtal 2009. All rights reserved.
//

#import "AdGearDemoAppDelegate.h"
#import "AdGearDemoViewController.h"
#import "AdGear.h"

@implementation AdGearDemoAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
	[[AdGear shared] loadConfigWithURL:[NSURL URLWithString:@"http://a.staging.adgear.com/mobile_app/60-adgear-sdk-test.json"]];
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
