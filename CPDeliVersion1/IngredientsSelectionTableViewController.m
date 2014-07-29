//
//  IngredientsSelectionTableViewController.m
//  CPDeliVersion1
//
//  Created by John Battaglia on 7/22/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import "IngredientsSelectionTableViewController.h"

@interface IngredientsSelectionTableViewController ()

@end

@implementation IngredientsSelectionTableViewController

NSMutableArray *choiceGroups;
NSMutableArray *mustGroups;
NSMutableArray *excludeGroups;
NSMutableArray *ingredientsForItem;

@synthesize theIncomingObject, ingredientsTable, ingredientsGroupTable, ingredientsGroupItemTable;

- (id)initWithStyle:(UITableViewStyle)style
{
    NSLog(@"IngredientsSelectionTableViewController hahaha");
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    ingredientsTable = [IngredientsTable getIngredientsTable];
    ingredientsGroupTable = [IngredientsTable getIngredientsGroupTable];
    ingredientsGroupItemTable = [IngredientsTable getIngredientsGroupItemTable];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    
    [self getNumberOfSections];
    
    return [self getNumberOfSections];
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    IngredientsSelectionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ingredientCell" forIndexPath:indexPath];
    
    // Configure the cell...
    NSNumber *ingredientLookUpNumber;
    ingredientLookUpNumber = [theIncomingObject.ingredients objectAtIndex:indexPath.row];
    
    for(int i = 0; i<ingredientsTable.count; i++)
    {
        if([[[ingredientsTable objectAtIndex:i] ingredientsID] isEqualToNumber:ingredientLookUpNumber])
        {
            cell.ingredientLabel.text = [[ingredientsTable objectAtIndex:i] ingredientsName];
        }
    }
    
    
    return cell;
    
    
    /*
     // Configure the cell...
     IndividualItems *individualItemObject;
     individualItemObject = [theItemArray objectAtIndex:indexPath.row];
     
     cell.individualItemLabel.text = individualItemObject.itemName;
     
     //accessory
     cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
     
     return cell;
     
     
     
     */
    
    
    
    
    
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)getNumberOfSections
{
    int numSections = 0;
    
    if(theIncomingObject.ingredients != nil)
    {
        numSections = numSections + 1;
    }
    
    if(theIncomingObject.choiceGroups != nil)
    {
         numSections = numSections + 1;
    }
    
    if(theIncomingObject.mustGroups != nil)
    {
        numSections = numSections + 1;
    }
    
    //exclude groups not implemented as of now
    /*
    if(theIncomingObject.excludeGroups != nil)
    {
        numSections = numSections + 1;
    }
    */
    
    return numSections;
}




@end
