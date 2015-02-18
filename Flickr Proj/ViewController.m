//
//  ViewController.m
//  Flickr Proj
//
//  Created by Monica Brinkman on 2015-02-12.
//  Copyright (c) 2015 Wonderlabs. All rights reserved.
//

#import "ViewController.h"
#import <FlickrKit.h>
#import "AuthViewController.h"

@interface ViewController ()
@property (nonatomic, retain) FKDUNetworkOperation *completeAuthOp;
@property (nonatomic, retain) FKDUNetworkOperation *checkAuthOp;
@property (nonatomic, retain) NSString *userID;
@end

@implementation ViewController

- (void) viewDidLoad {
    [super viewDidLoad];

   // self.myImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"images/FlickrLogo.png"]];
   // self.myImageView.image = [UIImage imageNamed:@"imageFiles.bundle/FlickrLogo.png"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userAuthenticateCallback:) name:@"UserAuthCallbackNotification" object:nil];
    
    self.checkAuthOp = [[FlickrKit sharedFlickrKit] checkAuthorizationOnCompletion:^(NSString *userName, NSString *userId, NSString *fullName, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (!error) {
                [self userLoggedIn:userName userID:userId];
            } else {
                [self userLoggedOut];
            }
        });
    }];
}



- (void) viewWillDisappear:(BOOL)animated {
    //Cancel any operations when you leave views
    
    [self.completeAuthOp cancel];
    [self.checkAuthOp cancel];
    [super viewWillDisappear:animated];
}
#pragma mark - Auth

- (void) userAuthenticateCallback:(NSNotification *)notification {
    NSURL *callbackURL = notification.object;
    self.completeAuthOp = [[FlickrKit sharedFlickrKit] completeAuthWithURL:callbackURL completion:^(NSString *userName, NSString *userId, NSString *fullName, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (!error) {
                [self userLoggedIn:userName userID:userId];
            } else {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:error.localizedDescription delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                [alert show];
            }
            [self.navigationController popToRootViewControllerAnimated:YES];
        });
    }];
}

- (void) userLoggedIn:(NSString *)username userID:(NSString *)userID {
    NSLog(@"LOGGED IN!!!");
    self.userID = userID;
    [self.loggingButton setTitle:@"Logout"];
//    self.authLabel.text = [NSString stringWithFormat:@"You are logged in as %@", username];
}

- (void) userLoggedOut {
    [self.loggingButton setTitle:@"Login"];
 //   self.authLabel.text = @"Login to flickr";
}

#pragma mark - Button Actions

- (IBAction)authButtonPressed:(UIBarButtonItem *)sender {
    if ([FlickrKit sharedFlickrKit].isAuthorized) {
        [[FlickrKit sharedFlickrKit] logout];
        [self userLoggedOut];
    } else {
        AuthViewController *authView = [[AuthViewController alloc] init];
        [self.navigationController pushViewController:authView animated:YES];
    }
}


@end
