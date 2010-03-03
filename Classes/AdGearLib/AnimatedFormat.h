//
//  AnimatedFormat.h
//  AdGearDemo
//
//  Created by Louis-Philippe Gauthier on 03/11/09.
//  Copyright 2009 Bloom Digital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "AdSpot.h"
#import "Creative.h"
#import "OverlayBackground.h"
#import <Three20/Three20.h>

@interface AnimatedFormat : UIView <AdSpotAnimated> {	
	Creative *creative;
	NSDictionary *_config;
	CGFloat heigth;
	CGFloat width;
}

- (id)initWithConfig:(NSDictionary *)config;
@end