//
//  DetailViewController.m
//  Receipts
//
//  Created by Tim Beals on 2016-11-24.
//  Copyright © 2016 Tim Beals. All rights reserved.
//

#import "DetailViewController.h"
#import "CategoryTableViewCell.h"

@interface DetailViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *categoriesArray;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self categorySetUp];
}


- (void)categorySetUp
{
    self.categoriesArray = @[@"Personal", @"Family", @"Business"];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.categoriesArray.count;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
        return @"Categories";
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"categoryCell" forIndexPath:indexPath];
    NSString *category = self.categoriesArray[indexPath.row];
    cell.textLabel.text = category;
    return cell;
}


@end
