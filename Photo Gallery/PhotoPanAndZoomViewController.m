//
//  PhotoPanAndZoomViewController.m
//  Photo Gallery
//
//  Created by Diwakar Kamboj on 21/08/15.
//  Copyright (c) 2015 Nagarro. All rights reserved.
//

#import "PhotoPanAndZoomViewController.h"

@interface PhotoPanAndZoomViewController ()

@property UIImageView *imageView;

- (void)centerScrollViewContents;

@end

@implementation PhotoPanAndZoomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *image = [UIImage imageNamed:self.selectedPhotoPath];
    self.imageView = [[UIImageView alloc] initWithImage:image];
    //self.imageView.frame = (CGRect){.origin=CGPointMake(0.0f, 0.0f), .size=image.size};
    [self.photoScrollView addSubview:self.imageView];
    
    self.photoScrollView.contentSize = image.size;
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    CGRect scrollViewFrame = self.photoScrollView.frame;
    CGFloat scaleWidth = scrollViewFrame.size.width / self.photoScrollView.contentSize.width;
    CGFloat scaleHeight = scrollViewFrame.size.height / self.photoScrollView.contentSize.height;
    CGFloat minScale = MIN(scaleWidth, scaleHeight);
    
    self.photoScrollView.zoomScale = minScale;
    NSLog(@"will appear %f", minScale);
    self.photoScrollView.minimumZoomScale = 0.5f;
    self.photoScrollView.maximumZoomScale = 1.0f;
    
    [self centerScrollViewContents];
}

- (void)centerScrollViewContents {
    CGSize boundsSize = self.photoScrollView.bounds.size;
    CGRect contentsFrame = self.imageView.frame;
    
    if (contentsFrame.size.width < boundsSize.width) {
        contentsFrame.origin.x = (boundsSize.width - contentsFrame.size.width) / 2.0f;
    } else {
        contentsFrame.origin.x = 0.0f;
    }
    
    if (contentsFrame.size.height < boundsSize.height) {
        contentsFrame.origin.y = (boundsSize.height - contentsFrame.size.height) / 2.0f;
    } else {
        contentsFrame.origin.y = 0.0f;
    }
    
    self.imageView.frame = contentsFrame;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    // Return the view that you want to zoom
    return self.imageView;
}

-(void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    // The scroll view has zoomed, so you need to re-center the contents
    [self centerScrollViewContents];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
