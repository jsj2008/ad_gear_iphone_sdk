//
//  OverlayBackground.m
//  adgear
//
//  Created by Louis-Philippe Gauthier on 16/02/09.
//  Copyright 2009 Bloom Digital. All rights reserved.
//

#import "OverlayBackground.h"

@implementation OverlayBackground

- (void)fillRoundedRect:(CGRect)rect inContext:(CGContextRef)context {
    float radius = 5.0f;
    
	CGContextBeginPath(context);
	CGContextSetGrayFillColor(context, 0, 0.7);
	CGContextMoveToPoint(context, CGRectGetMinX(rect) + radius, CGRectGetMinY(rect));
	CGContextAddArc(context, CGRectGetMaxX(rect) - radius, CGRectGetMinY(rect) + radius, radius, 3 * M_PI / 2, 0, 0);
	
	CGPoint points[4];
	points[0].x = (CGFloat) CGRectGetMaxX(rect);
	points[0].y = (CGFloat) (CGRectGetMinY(rect) + radius);
	points[1].x = (CGFloat) CGRectGetMaxX(rect);
	points[1].y = (CGFloat) CGRectGetMaxY(rect);
	points[2].x = (CGFloat) CGRectGetMinX(rect);
	points[2].y = (CGFloat) CGRectGetMaxY(rect);
	points[3].x = (CGFloat) CGRectGetMinX(rect);
	points[3].y = (CGFloat) (CGRectGetMinY(rect) + radius);
	
	CGContextAddLines(context, points, 4);
	CGContextAddArc(context, CGRectGetMinX(rect) + radius, CGRectGetMinY(rect) + radius, radius, M_PI, 3 * M_PI / 2, 0);
    CGContextClosePath(context);
    CGContextFillPath(context);
}

- (void)drawRect:(CGRect)rect {
	CGRect boxRect = self.bounds;
    CGContextRef ctxt = UIGraphicsGetCurrentContext();	
	boxRect = CGRectInset(boxRect, 0, 0);
    [self fillRoundedRect:boxRect inContext:ctxt];
}

- (void)dealloc {
	[super dealloc];
}

@end