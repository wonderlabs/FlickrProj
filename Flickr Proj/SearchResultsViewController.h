//
//  SearchResultsViewController.h
//  Flickr Proj
//
//  Created by Monica Brinkman on 2015-02-15.
//  Copyright (c) 2015 Wonderlabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchResultsViewController : UICollectionViewController <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSString *searchString;

@property (strong, nonatomic) IBOutlet UICollectionView *myCollectionView;


@end
