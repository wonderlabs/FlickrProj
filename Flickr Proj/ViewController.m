//
//  ViewController.m
//  Flickr Proj
//
//  Created by Monica Brinkman on 2015-02-12.
//  Copyright (c) 2015 Wonderlabs. All rights reserved.
//

#import "ViewController.h"
#import <FlickrKit.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[FlickrKit sharedFlickrKit] initializeWithAPIKey:@"186fdba21ffbbfe15eb0f2c44ff4846e" sharedSecret:@"1f598175f80de49f"];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
