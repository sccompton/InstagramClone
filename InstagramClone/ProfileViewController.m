//
//  ProfileViewController.m
//  InstagramClone
//
//  Created by Stephen Compton on 2/3/14.
//  Copyright (c) 2014 Stephen Compton. All rights reserved.
//

#import "ProfileViewController.h"
#import "Parse/Parse.h"

@interface ProfileViewController ()

{
  
    __weak IBOutlet PFImageView *userProfileImage;
    __weak IBOutlet UILabel *userNameLabel;
    PFUser *currentUser;
    
}

@end

@implementation ProfileViewController

- (void)viewDidLoad
{
    //  self.parseClassName = @"_User";
    [super viewDidLoad];
    currentUser = [PFUser currentUser];
    
//    NSData *data = currentUser[@"profilePic"];
//    userProfileImage.image = [UIImage imageWithData:data];
//    
    userNameLabel.text = currentUser[@"username"];
    
    
    PFFile *thumbnail = currentUser[@"profilePic"];
    userProfileImage.image = currentUser[@"profilePic"];
    userProfileImage.image = [UIImage imageNamed:@"005.jpg"];
    userProfileImage.file = thumbnail;
    

    [currentUser fetchIfNeededInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        //
    }];
    
//    PFFile *imageFile = [currentUser objectForKey:@"profilePic"];
//    userProfileImage.file = imageFile;
//    [userProfileImage loadInBackground];
    
  //  userProfileImage.image = currentUser[@"profilePic.jpg"];
    
//       PFQuery *query = [PFQuery queryWithClassName:@"profilePic"];
//       [query getObjectInBackgroundWithId:@"username" block:^(PFObject *object, NSError *error) {
//       }];
}


//- (void)loadInBackground:(void ( ^ ) ( UIImage *image , NSError *error ))completion



- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    
    
}

@end
