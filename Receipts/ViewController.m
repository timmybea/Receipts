//
//  ViewController.m
//  Receipts
//
//  Created by Tim Beals on 2016-11-24.
//  Copyright © 2016 Tim Beals. All rights reserved.
//

#import "ViewController.h"
#import "ReceiptTableViewCell.h"
#import "DetailViewController.h"

#import <CoreData/CoreData.h>

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSArray *tempArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //TEST DATA
    [self setupData];
 
  
    // Initialize Fetch Request
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Receipt"];
    
     //Add Sort Descriptors
    [fetchRequest setSortDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"createdAt" ascending:YES]]];
    
    NSError *error = nil;
    
    NSAsynchronousFetchResult *result = [self.managedObjectContext executeRequest:fetchRequest error:&error];
    
    
    // Initialize Fetched Results Controller
//    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:nil sectionNameKeyPath:nil cacheName:nil];
//
//    // Configure Fetched Results Controller
//    [self.fetchedResultsController setDelegate:self];
//    
//    // Perform Fetch
//    NSError *error = nil;
//    [self.fetchedResultsController performFetch:&error];
//    
//    if (error) {
//        NSLog(@"Unable to perform fetch.");
//        NSLog(@"%@, %@", error, error.localizedDescription);
//    }
    
    NSLog(@"The managed object context is: %@", self.managedObjectContext);
}


#pragma - table view delegate methods -

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"Number of rows: %ld", self.tempArray.count);
    return self.tempArray.count;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Family";
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ReceiptTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"receiptCell" forIndexPath:indexPath];
    NSString *currentObject = self.tempArray[indexPath.row];
    cell.receiptLabel.text = currentObject;
    return cell;
}


#pragma - segue -

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([segue.identifier isEqualToString:@"detailVCSegue"]) {
//        // Obtain Reference to View Controller
//        DetailViewController *vc = [segue destinationViewController];
//        
//        // Configure View Controller
//        vc.managedObjectContext = self.managedObjectContext;
//    }
//}



#pragma - data setup (temp)

-(void)setupData
{
    self.tempArray = @[@"one", @"two", @"three"];
}



@end
