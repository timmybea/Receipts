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


@property (weak, nonatomic) IBOutlet UITextField *amountTextField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *categoriesArray;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self categorySetUp];
}





//- (IBAction)saveAction:(UIBarButtonItem *)sender
//{
//    [self dismissViewControllerAnimated:YES completion:nil];
//    
//    // Helpers
//    NSString *name = self.titleTextField.text;
//    
//    if (name && name.length)
//    {
//        // Create Entity
//        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Item" inManagedObjectContext:self.managedObjectContext];
//        
//        // Initialize Record
//        NSManagedObject *record = [[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:self.managedObjectContext];
//        
//        // Populate Record
//        [record setValue:name forKey:@"name"];
//        [record setValue:[NSDate date] forKey:@"createdAt"];//**
//        
//        // Save Record
//        NSError *error = nil;
//        
//        if ([self.managedObjectContext save:&error])
//        {
//            // Dismiss View Controller
//            [self dismissViewControllerAnimated:YES completion:nil];
//            
//        }
//        else
//        {
//            if (error)
//            {
//                NSLog(@"Unable to save record.");
//                NSLog(@"%@, %@", error, error.localizedDescription);
//            }
//        }
//    }
//}
//
//- (IBAction)cancelAction:(UIBarButtonItem *)sender
//{
//    [self dismissViewControllerAnimated:YES completion:nil];
//}



#pragma - category table view set up -

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
