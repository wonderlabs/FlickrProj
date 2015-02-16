//
//  SearchViewController.m
//  Flickr Proj
//
//  Created by Monica Brinkman on 2015-02-13.
//  Copyright (c) 2015 Wonderlabs. All rights reserved.
//

#import "SearchViewController.h"
#import "CustomTableViewCell.h"
#import "SearchResultsViewController.h"

NSString *RecentSearchesKey = @"RecentSearchesKey";

@interface SearchViewController ()

@property (nonatomic, strong) NSArray *recentSearches;
@property (nonatomic, strong) NSArray *displayedRecentSearches;


@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.mySearchBar.delegate = self;

    
    NSArray *recents = [[NSUserDefaults standardUserDefaults] objectForKey:RecentSearchesKey];
    if (recents) {
        self.recentSearches = recents;
        self.displayedRecentSearches = recents;
    }
    else {
        self.recentSearches = [NSArray array];
        self.displayedRecentSearches = [NSArray array];
    }
    
    self.items = [[NSMutableArray alloc] initWithArray:self.recentSearches];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    // Ensure the complete list of recents is shown on first display.
    [super viewWillAppear:animated];
    self.displayedRecentSearches = self.recentSearches;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

#pragma mark - UISearchBarDelegate

//-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
//    [searchBar resignFirstResponder];
//}



-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    [self filterResultsUsingString:(NSString *) searchText];
}

- (void)didSelectString:(NSString *)searchString {
    
    // The user selected a row in the recent searches list (UITableView).
    // Set the text in the search bar to the search string, and conduct the search.
    self.mySearchBar.text = searchString;
    [self finishSearchWithString:searchString];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{

    // When the search button is tapped, add the search term to recents and conduct the search.
    NSString *searchString = [self.mySearchBar text];
    [self addToRecentSearches:searchString];
    
    //TODO: Implement the search
    [self finishSearchWithString:searchString];
    
}

- (void)finishSearchWithString:(NSString *) searchString {
    [self.view endEditing:YES];
        
    UICollectionViewFlowLayout *aFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    [aFlowLayout setItemSize:CGSizeMake(100, 100)];
    [aFlowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];

    SearchResultsViewController *fivePhotos = [[SearchResultsViewController alloc] initWithCollectionViewLayout:aFlowLayout];

    fivePhotos.searchString = searchString;
    [self.navigationController pushViewController:fivePhotos animated:YES];    
    
    //[self.mySearchBar resignFirstResponder];//TODO: Investigate why this is used.
    
}


#pragma mark - Saved Search Results

-(void)filterResultsUsingString:(NSString *) searchString{
    // If the search string is zero-length, then restore the recent searches, otherwise
    // create a predicate to filter the recent searches using the search string.
    //
    
    NSMutableArray *searchInitialResults = [[NSMutableArray alloc] initWithArray:self.recentSearches];
    //TODO: Still need to implement the saved searches feature and load them here.
    if ([searchString length] == 0) {
        self.items = searchInitialResults;
    }
    else {
        NSPredicate *filterPredicate = [NSPredicate predicateWithFormat:@"self BEGINSWITH[cd] %@", searchString];
        NSArray *filteredRecentSearches = [searchInitialResults filteredArrayUsingPredicate:filterPredicate];
        self.items = [[NSMutableArray alloc] initWithArray:filteredRecentSearches];
    }
    
    [self.tableView reloadData];
}

- (void)addToRecentSearches:(NSString *)searchString{
    
    // Filter out any strings that shouldn't be in the recents list.
    if ([searchString isEqualToString:@""]) {
        return;
    }
    
    // Create a mutable copy of recent searches and remove the search string if it's already there (it's added to the top of the list later).
    
    NSMutableArray *mutableRecentSearches = [self.recentSearches mutableCopy];
    [mutableRecentSearches removeObject:searchString];
    
    // Add the new string at the top of the list.
    [mutableRecentSearches insertObject:searchString atIndex:0];
    
    // Update user defaults.
    [[NSUserDefaults standardUserDefaults] setObject:mutableRecentSearches forKey:RecentSearchesKey];
    
    // Set self's recent searches to the new recents array, and reload the table view.
    self.recentSearches = mutableRecentSearches;
    self.displayedRecentSearches = mutableRecentSearches;
    [self.tableView reloadData];
    
//    // Ensure the clear button is enabled.
//    self.clearButtonItem.enabled = YES;
}

#pragma mark - UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.items count];
}

-(CustomTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"CustomTableCell";
    
    CustomTableViewCell *cell = (CustomTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier
                                                                                    forIndexPath:indexPath];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Display recipe in the table cell
    id cellItem = [self.items objectAtIndex:indexPath.row];
    if([cellItem isKindOfClass:[NSString class]]){
        cell.label.text = (NSString *)cellItem;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //this is where you push the detail view conroller view for the selected item
    
    [self didSelectString:[self.displayedRecentSearches objectAtIndex:indexPath.row]];
}

#pragma mark - Navigation

//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//    
//    if ([[segue identifier] isEqualToString:@"showSearchResults"])
//    {
//        
//        // Get reference to the destination view controller
//        SearchResultsViewController *vc = [segue destinationViewController];
//        
//        // Pass any objects to the view controller here, like...
//        [vc setSearchString:self.mySearchString];
//    }
//}


@end
