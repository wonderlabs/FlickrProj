//
//  AuthViewController.m
//  Flickr Proj
//
//  Created by Monica Brinkman on 2015-02-12.
//  Copyright (c) 2015 Wonderlabs. All rights reserved.
//

#import "AuthViewController.h"
#import <FlickrKit.h>

@interface AuthViewController ()
@property (nonatomic, retain) FKDUNetworkOperation *authOp;
//@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation AuthViewController

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // This must be defined in your Info.plist
    // See FlickrKitDemo-Info.plist
    // Flickr will call this back. Ensure you configure your flickr app as a web app
    
//    
//    NSURL *url = [[NSURL alloc] initWithString:@"http://google.com"];
//    
//    [self.webView loadRequest:[[NSURLRequest alloc] initWithURL:url]];
    
    [self createWebView];
//    

}
-(void)createWebView
{
    float width = self.view.bounds.size.width;
    float height = self.view.bounds.size.height;
    UIWebView *webViewLogin = [[UIWebView alloc] initWithFrame:CGRectMake(0, 20, width, height)];
    webViewLogin.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    webViewLogin.scalesPageToFit = YES;
    webViewLogin.delegate = self;

    
    NSString *callbackURLString = @"iOSFlickrProj://auth";
    // Begin the authentication process
    self.authOp = [[FlickrKit sharedFlickrKit] beginAuthWithCallbackURL:[NSURL URLWithString:callbackURLString] permission:FKPermissionDelete completion:^(NSURL *flickrLoginPageURL, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (!error) {
                NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:flickrLoginPageURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
                [webViewLogin loadRequest:urlRequest];
            } else {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:error.localizedDescription delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                [alert show];
            }
        });
    }];
    
    
    
    
[self.view addSubview:webViewLogin];

}

- (void) viewWillDisappear:(BOOL)animated {
    [self.authOp cancel];
    [super viewWillDisappear:animated];
}

#pragma mark - Web View

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    //If they click NO DONT AUTHORIZE, this is where it takes you by default... maybe take them to my own web site, or show something else
    
    NSURL *url = [request URL];
    
    // If it's the callback url, then lets trigger that
    if (![url.scheme isEqual:@"http"] && ![url.scheme isEqual:@"https"]) {
        if ([[UIApplication sharedApplication]canOpenURL:url]) {
            [[UIApplication sharedApplication]openURL:url];
            return NO;
        }
    }
    
    return YES;
    
}

@end
