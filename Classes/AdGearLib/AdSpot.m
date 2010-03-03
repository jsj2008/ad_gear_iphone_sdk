//
//  AdSpot.m
//  AdGearDemo
//
//  Created by Louis-Philippe Gauthier on 26/10/09.
//  Copyright 2009 Bloom Digital. All rights reserved.
//

#import "AdSpot.h"

@implementation AdSpot

- (id)initWithLabel:(NSString *)label Origin:(CGPoint)origin {
	_label = [label retain];
	frame = CGRectZero;
	frame.origin = origin;
	if (self = [super initWithFrame:frame]) {
		self.backgroundColor = [UIColor clearColor];
    }
	return self;
}

- (void)configLoaded:(NSDictionary *)config {
	if ([[config objectForKey:@"adspots"] objectForKey:_label] == NULL) {
		NSLog(@"AdGear ERROR: AdSpotLabel doesn't exist.");
		[self autorelease];
		return;
	}
	NSURL *deliveryURL = [NSURL URLWithString:[[config objectForKey:@"adspots"] objectForKey:_label]];
	_config = [[[NSString stringWithContentsOfURL:deliveryURL] JSONValue] retain];
	if ([_config count] == 0) { 
		NSLog(@"AdGear ERROR: AdSpot is disabled.");
		[self autorelease];
		return;
	}
	if ([[_config objectForKey:@"format_id"] integerValue] == 23) {
		self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, [[_config objectForKey:@"format_width"] floatValue], [[_config objectForKey:@"format_height"] floatValue] + 30);
		format = [[[AnimatedFormat alloc] initWithConfig:_config] autorelease];
		[self addSubview:format];
	} else {
		self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, [[_config objectForKey:@"format_width"] floatValue], [[_config objectForKey:@"format_height"] floatValue]);
		format = [[[StaticFormat alloc] initWithConfig:_config] autorelease];
		[self addSubview:format];
	}
	[self setNeedsDisplay];
}

- (void)failedToLoadConfig {
	[self autorelease];
}

- (void)animateIn {
	if ([format conformsToProtocol: @protocol(AdSpotAnimated)]) {
		[format animateIn];
	}
}

- (void)animateOut {
	if ([format conformsToProtocol: @protocol(AdSpotAnimated)]) {
		[format animateOut];
	}
}

- (void)close {
	if ([format conformsToProtocol: @protocol(AdSpotAnimated)]) {
		[format close];
	}
}

- (void)dealloc {
	[_config release];
	[_label release];
	[format release];
	[super dealloc];
}

@end
