//
//  SearchTableViewController.m
//  InstagramClone
//
//  Created by Stephen Compton on 2/4/14.
//  Copyright (c) 2014 Stephen Compton. All rights reserved.
//

#import "SearchTableViewController.h"
#import "Parse/Parse.h"

@interface SearchTableViewController ()<PFSignUpViewControllerDelegate, UISearchBarDelegate>
{
    
    __weak IBOutlet UISearchBar *searchBar;
    
}
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
    self.parseClassName = @"_User";
    [super viewDidLoad];
    searchBar.delegate = self;
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
    
    cell.textLabel.text = [object objectForKey:@"username"];    
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue Light" size:14];
    cell.textLabel.textColor = [UIColor colorWithRed:131/255.0 green:76/255.0 blue:53/255.0 alpha:1.0];


    return cell;
}

-(PFQuery *)queryForTable
{

    PFQuery *query = [PFUser query];
    [query whereKey:@"username" containsString:searchBar.text];
    return query;
    
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [self loadObjects];
}






@end
