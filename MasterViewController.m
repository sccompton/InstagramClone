//
//  FeedTableViewController.m
//  InstagramClone
//
//  Created by Stephen Compton on 2/4/14.
//  Copyright (c) 2014 Stephen Compton. All rights reserved.
//

#import "MasterViewController.h"
#import "Parse/Parse.h"
@import CoreData;
#import "AppDelegate.h"
#import "CameraViewController.h"
#import "SearchTableViewController.h"
#import "ProfileViewController.h"
//#import "CustomPFTableViewCell.h"

@interface MasterViewController ()<PFSignUpViewControllerDelegate>

{
    NSManagedObjectContext *managedObjectContext;
    PFLogInViewController *login;
}
@end


@implementation MasterViewController

- (void)viewDidAppear:(BOOL)animated
{
    self.tableView.rowHeight = 200;
//    self.tableView.sectionFooterHeight = 22;
//    self.tableView.sectionHeaderHeight = 22;
    
    if(![PFUser currentUser]) {
        login = [PFLogInViewController new];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectZero];
        login.signUpController.delegate = self;
        label.text = @"Photo Friends";
        [label sizeToFit];
        login.logInView.logo = label;
        [self presentViewController:login animated:YES completion:nil];
    }
}


-(void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user
{
    [signUpController dismissViewControllerAnimated:YES completion:nil];
}


- (PFTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object
{
    PFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"a"];
    if (!cell) {
        cell = [[PFTableViewCell alloc ]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"a"];
    }

    cell.imageView.autoresizingMask = ( UIViewAutoresizingNone );
    cell.imageView.autoresizesSubviews = NO;
    cell.imageView.bounds = CGRectMake(0, 0, 80, 80);
    cell.imageView.frame = CGRectMake(0, 0, 50, 50);
    //cell.imageView.frame=CGRectMake(80, 80, 80, 80);
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue Light" size:14];
    cell.textLabel.textColor = [UIColor colorWithRed:131/255.0 green:76/255.0 blue:53/255.0 alpha:1.0];
    
    
    PFUser *user = object[@"user"];
    [user fetchIfNeededInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        cell.textLabel.text = [@"By " stringByAppendingString:user.username];
    }];
    
    //    [cell.imageView addSubview:cell.userPhoto];
    //    [cell.imageView addSubview:cell.userLabel];
    //    [cell.imageView addSubview:cell.userImageView];
    
    PFFile *thumbnail = object[@"image"];

    cell.imageView.image = [UIImage imageNamed:@"placeholder.jpg"];
    cell.imageView.file = thumbnail;
    return cell;
}

- (void)viewDidLoad
{
    self.parseClassName = @"Photo";
    
    [super viewDidLoad];
}

@end
