//
//  AlbumsCollectionViewController.m
//  Photo Gallery
//
//  Created by Diwakar Kamboj on 19/08/15.
//  Copyright (c) 2015 Nagarro. All rights reserved.
//

#import "AlbumsCollectionViewController.h"
#import "GalleryData.h"
#import "PhotosCollectionViewController.h"

@interface AlbumsCollectionViewController ()

@end

@implementation AlbumsCollectionViewController

static NSString * const reuseIdentifier = @"AlbumCollectionCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    // [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Albums";
    self.Albums = [[GalleryData getGalleryData] AlbumsArray];     // Get the array object loaded from plist
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// The following method sets the selectedRowNum property of the DetailViewController to the selected row
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"selectedAlbumFromTiles"]) {
        NSIndexPath *indexPath = [[self.collectionView indexPathsForSelectedItems] objectAtIndex:0];    //*****************
        [[segue destinationViewController] setSelectedAlbumNum:indexPath.item]; // Functionally indexPath.item is same as indexPath.row
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

    return self.Albums.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    UIImageView *cellImage = (UIImageView *)[cell viewWithTag:100];
    UILabel *cellLabel = (UILabel *)[cell viewWithTag:99];
    
    NSString *albumName = [[self.Albums objectAtIndex:indexPath.row] objectForKey:@"AlbumName"];   // Get the value from the name key present in the dictionary object of the array
    cellLabel.text = albumName;
    
    NSString *firstImageName = [[[self.Albums objectAtIndex:indexPath.row] objectForKey:@"AlbumImages"] objectAtIndex:0];
    cellImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"Photos/%@/%@", albumName, firstImageName]];
    
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
