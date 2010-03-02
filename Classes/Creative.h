//
//  Creative.h
//  AdGearDemo
//
//  Created by Louis-Philippe Gauthier on 03/11/09.
//  Copyright 2009 Bloom Digital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdGear.h"
#import "Three20/Three20.h"


@interface Creative : UIView {
	NSURL *_clickURL;
}

- (id)initWithFrame:(CGRect)frame ImageURL:(NSURL *)imageURL ClickURL:(NSURL *)clickURL;
@end