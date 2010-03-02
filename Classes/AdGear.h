//
//  AdGear.h
//  AdGear Framework
//
//  Created by Louis-Philippe Gauthier on 25/10/09.
//  Copyright 2009 Bloom Digital. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSON.h"

@protocol AdGearDelegate
- (void)configLoaded:(NSDictionary *)config;
- (void)failedToLoadConfig;
@end

@protocol AdSpotAnimated
- (void)animateIn;
- (void)animateOut;
- (void)close;
@end

@interface AdGear : NSObject {
	Boolean overlayDelay;
	NSDictionary *config;
	NSMutableArray *delegates;
	NSMutableData *responseData;
}
@property Boolean overlayDelay;
@property (readonly) NSDictionary *config;

+ (AdGear *)shared;
- (void)loadConfigWithURL:(NSURL *)URL;
- (void)registerAdSpot:(id<AdGearDelegate>)adSpot;
@end