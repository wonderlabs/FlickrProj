//
//  ViewController.h
//  Flickr Proj
//
//  Created by Monica Brinkman on 2015-02-12.
//  Copyright (c) 2015 Wonderlabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate, UISearchControllerDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *loggingButton;

- (IBAction)authButtonPressed:(UIBarButtonItem *)sender;
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;

@end

