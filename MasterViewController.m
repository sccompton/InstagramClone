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

@interface MasterViewController ()<PFSignUpViewControllerDelegate>

{
    NSManagedObjectContext *managedObjectContext;
    PFLogInViewController *login;
}
@end


@implementation MasterViewController

- (void)viewDidAppear:(BOOL)animated
{
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
    
    PFRelation *owner = object[@"owner"];
    cell.textLabel.text = owner.query.getFirstObject[@"name"];
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
