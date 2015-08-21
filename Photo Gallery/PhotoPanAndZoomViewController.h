//
//  PhotoPanAndZoomViewController.h
//  Photo Gallery
//
//  Created by Diwakar Kamboj on 21/08/15.
//  Copyright (c) 2015 Nagarro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoPanAndZoomViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *photoScrollView;

@end
