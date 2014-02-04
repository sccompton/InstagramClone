//
//  ProfileViewController.m
//  InstagramClone
//
//  Created by Stephen Compton on 2/3/14.
//  Copyright (c) 2014 Stephen Compton. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

{
    
    __weak IBOutlet UIImageView *userProfileImage;
    __weak IBOutlet UILabel *userNameLabel;
    
}

@end

@implementation ProfileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
   // userNameLabel.text = user.name;
    
    
}

@end
