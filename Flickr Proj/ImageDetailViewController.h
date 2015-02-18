//
//  ImageDetailViewController.h
//  Flickr Proj
//
//  Created by Monica Brinkman on 2015-02-16.
//  Copyright (c) 2015 Wonderlabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageDetailViewController : UITableViewController

@property (nonatomic, strong) NSString *imageId;
@property (nonatomic, strong) UIImage *image;
@property (strong, nonatomic) IBOutlet UITableView *myTableView;



@end
