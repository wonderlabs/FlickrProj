//
//  ViewController.h
//  Flickr Proj
//
//  Created by Monica Brinkman on 2015-02-12.
//  Copyright (c) 2015 Wonderlabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate, UISearchControllerDelegate>


@property (weak, nonatomic) IBOutlet UIButton *authButton;


- (IBAction)authButtonPressed:(id)sender;

@end

//
//@property (weak, nonatomic) IBOutlet UIButton *photostreamButton;
//
//@property (weak, nonatomic) IBOutlet UIButton *authButton;
//@property (weak, nonatomic) IBOutlet UILabel *authLabel;
//@property (weak, nonatomic) IBOutlet UILabel *todaysInterestingLabel;
//@property (weak, nonatomic) IBOutlet UIProgressView *progress;
//@property (weak, nonatomic) IBOutlet UILabel *progressLabel;
//@property (weak, nonatomic) IBOutlet UITextField *searchText;

