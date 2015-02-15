//
//  SearchViewController.h
//  Flickr Proj
//
//  Created by Monica Brinkman on 2015-02-13.
//  Copyright (c) 2015 Wonderlabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UITableViewController <UISearchControllerDelegate, UISearchBarDelegate, UISearchResultsUpdating>
@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UISearchBar *mySearchBar;



@property (nonatomic, strong) NSMutableArray *items;

@property (nonatomic, strong) UISearchController * searchController;

@end
