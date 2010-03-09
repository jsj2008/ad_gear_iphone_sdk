//
//  AdGearDemoViewController.m
//  AdGearDemo
//
//  Created by Louis-Philippe Gauthier on 25/10/09.
//  Copyright Bloom Digital 2009. All rights reserved.
//

#import "AdGearDemoViewController.h"

@implementation AdGearDemoViewController

- (void)viewDidLoad {
	// AdSpot #1 using static format
	AdSpot *static_format = [[[AdSpot alloc] initWithLabel:@"static_format" Origin:CGPointMake(0, 100)] autorelease];
	[self.view addSubview:static_format];
	[[AdGear shared] registerAdSpot:static_format];
	
	// AdSpot #2 using animated format
	animated_format = [[AdSpot alloc] initWithLabel:@"animated_format" Origin:CGPointMake(0, 386)];
	[self.view addSubview:animated_format];
	[[AdGear shared] registerAdSpot:animated_format];

    [super viewDidLoad];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event { 
	// click the view to animate in
	[animated_format animateIn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
	[animated_format release];
    [super dealloc];
}

@end