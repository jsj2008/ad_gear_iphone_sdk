//
//  AdGear.m
//  AdGear Framework
//
//  Created by Louis-Philippe Gauthier on 25/10/09.
//  Copyright 2009 Bloom Digital. All rights reserved.
//

#import "AdGear.h"

@implementation AdGear

@synthesize overlayDelay, config;

static AdGear *sharedInstance = NULL;

+ (AdGear *)shared { 
    if(sharedInstance) {
        return sharedInstance;
	}
    @synchronized(self) {
		if (sharedInstance == NULL) {
            sharedInstance = [[self alloc] init];
		}
    }
    return sharedInstance;
}

- (void)loadConfigWithURL:(NSURL *)URL {
	NSURLRequest *request = [NSURLRequest requestWithURL:URL];
	[[NSURLConnection alloc] initWithRequest:request delegate:self];
}

- (void)registerAdSpot:(id<AdGearDelegate>)adSpot {
	if (delegates == NULL) {
		delegates = [[NSMutableArray alloc] init];
	}
	[delegates addObject:adSpot];
	if (config != NULL) {
		[adSpot configLoaded:config];
	}
}

#pragma mark NSURLConnection delegate methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    responseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	NSLog(@"AdGear ERROR: Could not connect to server.");
    [responseData release];
    [connection release];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
	config = [[[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] JSONValue] retain];
	NSEnumerator *enumerator = [delegates objectEnumerator];
	id<AdGearDelegate> adSpot;
	while(adSpot = [enumerator nextObject]) {
		[adSpot configLoaded:config];
    }
    [responseData release];
    [connection release];
}

- (void)dealloc {
	[config release];
	[delegates release];
	[responseData release];
	[super dealloc];
}

@end