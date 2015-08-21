//
//  PhotosCollectionViewController.m
//  Photo Gallery
//
//  Created by Diwakar Kamboj on 20/08/15.
//  Copyright (c) 2015 Nagarro. All rights reserved.
//

#import "PhotosCollectionViewController.h"
#import "GalleryData.h"
#import "PhotoPanAndZoomViewController.h"

@interface PhotosCollectionViewController ()

@property NSDictionary *currentAlbum;
@property NSString *albumName;

@end

@implementation PhotosCollectionViewController

static NSString * const reuseIdentifier = @"PhotoCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    //[self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    
    self.currentAlbum = [[[GalleryData getGalleryData] AlbumsArray] objectAtIndex:self.selectedAlbumNum];     // Get the array object loaded from plist
    self.albumName = [self.currentAlbum objectForKey:@"AlbumName"];
    self.navigationItem.title = self.albumName;
    
    self.tabBarController.tabBar.hidden = YES;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showSelectedPhoto"]) {
        NSIndexPath *indexPath = [[self.collectionView indexPathsForSelectedItems] objectAtIndex:0];
        NSString *imageName = [[self.currentAlbum objectForKey:@"AlbumImages"] objectAtIndex:indexPath.item];
        [[segue destinationViewController] setSelectedPhotoPath:[NSString stringWithFormat:@"Photos/%@/%@", self.albumName, imageName]];
    }
}


#pragma mark <UICollectionViewDataSource>

/*
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete method implementation -- Return the number of sections
    return 0;
}
*/


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[self.currentAlbum objectForKey:@"AlbumImages"] count];
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    NSString *imageName = [[self.currentAlbum objectForKey:@"AlbumImages"] objectAtIndex:indexPath.row];
    
    UIImageView *cellImage = (UIImageView *)[cell viewWithTag:50];
    cellImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"Photos/%@/%@", self.albumName, imageName]];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
