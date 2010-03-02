//
//  StaticFormat.m
//  AdGearDemo
//
//  Created by Louis-Philippe Gauthier on 03/11/09.
//  Copyright 2009 Bloom Digital. All rights reserved.
//

#import "StaticFormat.h"

@implementation StaticFormat

- (id)initWithConfig:(NSDictionary *)config {
	_config = [config retain];
	
	CGRect frame = CGRectMake(0, 0, [[_config objectForKey:@"format_width"] floatValue], [[_config objectForKey:@"format_height"] floatValue]);
	
	if (self = [super initWithFrame:frame]) {
		AdGear *shared = [AdGear shared];

		self.backgroundColor = [UIColor clearColor];
		
		creative = [[[Creative alloc] initWithFrame:frame
		  ImageURL:[NSURL URLWithString:[[shared.config objectForKey:@"a_uri"] stringByAppendingString:[[config objectForKey:@"files"] objectForKey:@"image"]]]
		  ClickURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", [shared.config objectForKey:@"d_uri"],[[_config objectForKey:@"clicks"] objectForKey:@"action_uri"]]]] 
		  autorelease];
		[self addSubview:creative];
	}
	return self;
}

- (void)dealloc {
	[creative release];
	[_config release];
    [super dealloc];
}

@end