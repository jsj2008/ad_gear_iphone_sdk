//
//  StaticFormat.h
//  AdGearDemo
//
//  Created by Louis-Philippe Gauthier on 03/11/09.
//  Copyright 2009 Bloom Digital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "AdGear.h"
#import "Creative.h"

@interface StaticFormat : UIView {
	Creative *creative;
	NSDictionary *_config;
}

- (id)initWithConfig:(NSDictionary *)config;
@end