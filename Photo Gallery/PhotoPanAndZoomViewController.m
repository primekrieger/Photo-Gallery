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
    
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.selectedPhotoPath]];
    self.imageView.frame = (CGRect){.origin=CGPointMake(0.0f, 0.0f), .size=self.imageView.image.size};
    [self.photoScrollView addSubview:self.imageView];
    
    self.photoScrollView.contentSize = self.imageView.image.size;
    
    //self.navigationController.navigationBarHidden = YES;
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    CGSize scrollViewFrameSize = self.photoScrollView.frame.size;
    CGFloat scaleWidth = scrollViewFrameSize.width / self.imageView.image.size.width;
    CGFloat scaleHeight = scrollViewFrameSize.height / self.imageView.image.size.height;;
    CGFloat minScale = MIN(scaleWidth, scaleHeight);
    
    self.photoScrollView.minimumZoomScale = minScale;
    self.photoScrollView.maximumZoomScale = 1.0f;
    
    self.photoScrollView.zoomScale = minScale;
    
    //NSLog(@"will appear %f", minScale);
    
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
        contentsFrame.origin.y = (boundsSize.height - self.navigationController.navigationBar.frame.size.height - contentsFrame.size.height) / 2.0f;
        
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
