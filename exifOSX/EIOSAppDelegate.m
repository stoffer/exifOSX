//
//  EIOSAppDelegate.m
//  exifOSX
//
//  Created by Christoffer Magnussen on 4/2/13.
//  Copyright (c) 2013 Christoffer Magnussen. All rights reserved.
//

#import "EIOSAppDelegate.h"

@implementation EIOSAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"IMG_0136" ofType:@"JPG"];
    NSURL *imageFileURL = [NSURL fileURLWithPath:path];
    CFURLRef imageURL = (CFURLRef)CFBridgingRetain(imageFileURL);
    CGImageSourceRef imageSource = CGImageSourceCreateWithURL(imageURL, NULL);
    
    if (imageSource == NULL) {
        NSLog(@"No image found");
        CFRelease(imageURL);
    }
    CFDictionaryRef props = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, NULL);
    CFRelease(imageURL);
    CFRelease(imageSource);
    if (props) {
       NSLog(@"%@", props);
        CFRelease(props);
    } else {
        NSLog(@"No props");
    }

}

@end
