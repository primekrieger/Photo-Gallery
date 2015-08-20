//
//  GalleryData.h
//  Photo Gallery
//
//  Created by Diwakar Kamboj on 18/08/15.
//  Copyright (c) 2015 Nagarro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GalleryData : NSObject

@property NSArray *AlbumsArray;

+ (GalleryData *) getGalleryData;

@end
