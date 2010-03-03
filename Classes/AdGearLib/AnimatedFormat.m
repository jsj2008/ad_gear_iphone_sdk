//
//  AnimatedFormat.m
//  AdGearDemo
//
//  Created by Louis-Philippe Gauthier on 03/11/09.
//  Copyright 2009 Bloom Digital. All rights reserved.
//

#import "AnimatedFormat.h"

@implementation AnimatedFormat

- (id)initWithConfig:(NSDictionary *)config {
	_config = [config retain];
	width = [[_config objectForKey:@"format_width"] floatValue];
	heigth = [[_config objectForKey:@"format_height"] floatValue];
	
	CGRect frame = CGRectMake(0, 0, width, heigth + 30);
	
	if (self = [super initWithFrame:frame]) {
		AdGear *shared = [AdGear shared];
		
		self.backgroundColor = [UIColor clearColor];
		self.hidden = YES;
		
		OverlayBackground *background = [[[OverlayBackground alloc] initWithFrame:CGRectMake(0, 0, width , heigth + 30)] autorelease];
		background.backgroundColor = [UIColor clearColor];
		[self addSubview:background];	
		
		UILabel *label = [[[UILabel alloc] initWithFrame:CGRectMake(6, 4, 100, 12)] autorelease];
		label.backgroundColor = [UIColor clearColor];
		label.textColor = [UIColor lightGrayColor];
		label.text = [shared.config objectForKey:@"powered_by_label"];
		label.font = [UIFont fontWithName:@"Helvetica" size:10];
		[self addSubview:label];

		UIButton *close = [UIButton buttonWithType:UIButtonTypeCustom];
		close.frame = CGRectMake(width-16, 4, 11, 11);
		[close setImage:[UIImage imageNamed:@"close_up.png"] forState:UIControlStateNormal];
		[close setBackgroundImage:[UIImage imageNamed:@"close_down.png"] forState:UIControlStateNormal];
		[close addTarget:self action:@selector(animateOut) forControlEvents:UIControlEventTouchUpInside];
		[self addSubview:close];

		creative = [[[Creative alloc] initWithFrame:CGRectMake(0, 0, width, heigth)
			ImageURL:[NSURL URLWithString:[[shared.config objectForKey:@"a_uri"] stringByAppendingString:[[config objectForKey:@"files"] objectForKey:@"image"]]]
			ClickURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", [shared.config objectForKey:@"d_uri"],[[_config objectForKey:@"clicks"] objectForKey:@"action_uri"]]]] 
			autorelease];
		creative.frame = CGRectMake(0, 19, width, heigth);
		[self addSubview:creative];
	}
	return self;
}

- (void)animateIn {
	AdGear *shared = [AdGear shared];
	if(!shared.overlayDelay) {
		shared.overlayDelay = YES;
		self.frame = CGRectMake(0, 0, width, heigth);
		self.hidden = NO;
		CATransition *animation = [CATransition animation];
		[animation setType:kCATransitionMoveIn];
		[animation setSubtype:kCATransitionFromTop];
		[animation setDuration:2];
		[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
		[[self layer] addAnimation:animation forKey:@"showAnimation"];
		[NSTimer scheduledTimerWithTimeInterval:[[shared.config objectForKey:@"overlay_animation_secs"] floatValue] target:self selector:@selector(animateOut) userInfo:nil repeats:NO];
	}
}

- (void)animateOut {
	AdGear *shared = [AdGear shared];
	[shared performSelector:@selector(setOverlayDelay:) withObject:NO afterDelay:[[shared.config objectForKey:@"overlay_global_delay_secs"] floatValue]];
	self.frame = CGRectMake(0, 600, width, heigth);
	CATransition *animation = [CATransition animation];
	[animation setType:kCATransitionPush];
	[animation setSubtype:kCATransitionFromBottom];     
	[animation setDuration:2];
	[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
	[[self layer] addAnimation:animation forKey:@"slideAnimation"];
}

- (void)close {
	[self animateOut];
}

- (void)dealloc {
	[creative release];
	[_config release];
    [super dealloc];
}

@end