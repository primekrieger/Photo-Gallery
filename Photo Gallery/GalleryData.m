//
//  GalleryData.m
//  Photo Gallery
//
//  Created by Diwakar Kamboj on 18/08/15.
//  Copyright (c) 2015 Nagarro. All rights reserved.
//

#import "GalleryData.h"

@implementation GalleryData

+ (GalleryData *) getGalleryData
{
    static GalleryData *sharedGalleryData = nil;  // Creation of object for singleton
    static dispatch_once_t oncePredicate;           // Used to test whether the block below has completed or not
    
    // The following code executes a block object once and only once for the lifetime of the application.
    // Thus, applying the concept of singletons
    dispatch_once(&oncePredicate, ^{
        
        sharedGalleryData = [[GalleryData alloc] init];
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Albums" ofType:@"plist"];
        sharedGalleryData.AlbumArray = [[NSArray alloc] initWithContentsOfFile:path];
        
    });
    
    return sharedGalleryData;
}

@end
