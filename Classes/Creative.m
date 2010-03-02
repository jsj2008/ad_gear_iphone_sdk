//
//  Creative.m
//  AdGearDemo
//
//  Created by Louis-Philippe Gauthier on 03/11/09.
//  Copyright 2009 Bloom Digital. All rights reserved.
//

#import "Creative.h"

@implementation Creative

- (id)initWithFrame:(CGRect)frame ImageURL:(NSURL *)imageURL ClickURL:(NSURL *)clickURL {
	_clickURL = [clickURL retain];
    
	if (self = [super initWithFrame:frame]) {
		TTImageView *imageView = [[[TTImageView alloc] initWithFrame:frame] autorelease];
		imageView.urlPath = [imageURL description];
		[self addSubview:imageView];
    }
    return self;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	[[UIApplication sharedApplication] openURL:_clickURL];
}

- (void)dealloc {
	[_clickURL release];
    [super dealloc];
}

@end