//
//  SearchTableViewController.m
//  InstagramClone
//
//  Created by Stephen Compton on 2/4/14.
//  Copyright (c) 2014 Stephen Compton. All rights reserved.
//

#import "SearchTableViewController.h"
#import "Parse/Parse.h"

@interface SearchTableViewController ()<PFSignUpViewControllerDelegate>

@end

@implementation SearchTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    self.parseClassName = @"User";
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{

}


- (PFTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object
{
    PFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"a"];
    if (!cell) {
        cell = [[PFTableViewCell alloc ]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"a"];
    }
    
    cell.textLabel.text = [object objectForKey:@"name"];
    

    return cell;
}



@end
