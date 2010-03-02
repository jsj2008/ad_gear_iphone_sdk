//
//  AdSpot.h
//  AdGear Framework
//
//  Created by Louis-Philippe Gauthier on 26/10/09.
//  Copyright 2009 Bloom Digital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "AdGear.h"
#import "StaticFormat.h"
#import "AnimatedFormat.h"

@interface AdSpot : UIView <AdGearDelegate, AdSpotAnimated> {
	NSDictionary *_config;
	NSString *_label;
	CGRect frame;
	id format;
}

- (id)initWithLabel:(NSString *)label Origin:(CGPoint)origin;
@end