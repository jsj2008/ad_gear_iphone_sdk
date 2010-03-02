//
//  AdGearDemoAppDelegate.h
//  AdGearDemo
//
//  Created by Louis-Philippe Gauthier on 25/10/09.
//  Copyright Bloom Digital 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AdGearDemoViewController;

@interface AdGearDemoAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    AdGearDemoViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet AdGearDemoViewController *viewController;

@end

