//
//  SearchResultsViewController.m
//  Flickr Proj
//
//  Created by Monica Brinkman on 2015-02-15.
//  Copyright (c) 2015 Wonderlabs. All rights reserved.
//

#import "SearchResultsViewController.h"
#import "CustomCollectionViewCell.h"
#import <FlickrKit.h>

@interface SearchResultsViewController ()

@property (nonatomic, retain) NSArray *photoURLs;
@property (nonatomic, strong) NSMutableArray *photos;
@property (nonatomic, strong) NSMutableArray *imageResults;

@end

@implementation SearchResultsViewController

int numberOfImagesToLoad = 50;

-(void)viewDidLoad{
    
   // [self.collectionView reloadData];
   // [self.photos addObjectsFromArray:self.imageResults];
    [self.collectionView registerClass:[CustomCollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];

    
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self generateInitialSearchResults:self.searchString];
}

-(void)getImagesAndReloadCollections{
    self.imageResults = [[NSMutableArray alloc] init];
    for (NSURL *url in self.photos) {
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
            
            UIImage *image = [[UIImage alloc] initWithData:data];
            [self addImageToView:image];
            
        }];
    }
    
    //[self.collectionView reloadData];
}

-(void)generateInitialSearchResults:(NSString *)searchString{
    
    FKFlickrPhotosSearch *search = [[FKFlickrPhotosSearch alloc] init];
    search.text = searchString;
    NSString* numResults = [NSString stringWithFormat:@"%i", numberOfImagesToLoad];
    search.per_page = numResults;
    [[FlickrKit sharedFlickrKit] call:search completion:^(NSDictionary *response, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (response) {
                NSMutableArray *photoURLs = [NSMutableArray array];
                for (NSDictionary *photoDictionary in [response valueForKeyPath:@"photos.photo"]) {
                    NSURL *url = [[FlickrKit sharedFlickrKit] photoURLForSize:FKPhotoSizeSmall240 fromPhotoDictionary:photoDictionary];
                    [photoURLs addObject:url];
                }
                
                self.photos = [[NSMutableArray alloc] initWithArray:photoURLs];
                //[self.collectionView reloadData];
                [self getImagesAndReloadCollections];
                
            } else {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:error.localizedDescription delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                [alert show];
            }
        });
    }];
}

- (void) addImageToView:(UIImage *)image {
    //TODO:Populate images
    [self.imageResults addObject:image];
    if([self.imageResults count] == numberOfImagesToLoad){
        [self.collectionView reloadData];
    }
}

#pragma mark - Collection View Methods

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return [self.photos count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    UIImage *image = [self.imageResults objectAtIndex:indexPath.row];
    
   // [cell addSubview:[[UIImageView alloc] initWithImage:image]];
   // cell.imageView.image = image;
    //cell.myLabel.text = @"TEST!";
    cell.backgroundColor = [UIColor colorWithPatternImage:image];

  //  [self.myCollectionView reloadData];
    
//    NSURL *url = [self.photos objectAtIndex:indexPath.row];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
//        NSLog(@"Got image data: %@", data);
////        
////        UIImage * image = [UIImage imageWithData:data];
////        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0, 100.0, 100.0)];
////        
////        imageView.contentMode = UIViewContentModeScaleAspectFit;
////        imageView.clipsToBounds = YES;
////        [imageView setImage:image];
////        
//       // cell.backgroundColor = [UIColor colorWithPatternImage:imageView.image];
//        
//        cell.imageView.image = [UIImage imageWithData:data];
//        [self.myCollectionView reloadData];
//        
//        }];
    
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark - UICollectionViewFlowLayoutDelegate

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIImage *image = [self.imageResults objectAtIndex:indexPath.row];
    
    return image.size;
}


@end
