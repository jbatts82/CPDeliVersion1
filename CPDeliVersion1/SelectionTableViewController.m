//
//  SelectionTableViewController.m
//  CPDeliVersion1
//
//  Created by John Battaglia on 7/31/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import "SelectionTableViewController.h"

#define ingredientsSection 0
#define choiceSection 1
#define mustSection 2
#define excludeSection 3

@interface SelectionTableViewController ()

@end

@implementation SelectionTableViewController

@synthesize ingredientsTable, ingredientsGroupTable, ingredientsGroupItemTable, anotherIncomingObject, oldIndexPath;;

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
    [super viewDidLoad];
    
    ingredientsTable = [IngredientsTable getIngredientsTable];
    ingredientsGroupTable = [IngredientsTable getIngredientsGroupTable];
    ingredientsGroupItemTable = [IngredientsTable getIngredientsGroupItemTable];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return anotherIncomingObject.arrayOfChoice.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SelectionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"selectionCell" forIndexPath:indexPath];
   
    switch(anotherIncomingObject.typeOfChoice.intValue)
    {
        case ingredientsSection:
        {
            for(int i = 0; i<ingredientsTable.count ; i++)
            {
                if([[[ingredientsTable objectAtIndex:i] ingredientsID] isEqualToNumber:anotherIncomingObject.arrayOfChoice[indexPath.row]] )
                {
                    cell.choiceItem.text = [[ingredientsTable objectAtIndex:i] ingredientsName];
                }
            }
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            return cell;
            break;
        }
        case choiceSection:
        {
            cell.choiceItem.text = [[anotherIncomingObject.arrayOfChoice objectAtIndex:indexPath.row] ItemName];
            break;
        }
        case mustSection:
        {
            cell.choiceItem.text = [[anotherIncomingObject.arrayOfChoice objectAtIndex:indexPath.row] ItemName];
            break;
        }
        default:
            NSLog(@"unknown section");

            
    }//end switch
    
    return cell;
}

-(void)tableView:(UITableView *)theTableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *selectedCell = [theTableView cellForRowAtIndexPath:indexPath];
    NSNumber *multiple = [[NSNumber alloc]initWithInt:1];
    NSNumber *onlyOne = [[NSNumber alloc]initWithInt:0];
    
    [theTableView deselectRowAtIndexPath:[theTableView indexPathForSelectedRow] animated:NO];
    
    switch(anotherIncomingObject.typeOfChoice.intValue)
    {
        case ingredientsSection:
        {
            if (selectedCell.accessoryType == UITableViewCellAccessoryNone)
            {
                selectedCell.accessoryType = UITableViewCellAccessoryCheckmark;
                // Reflect selection in data model
            }
            else if (selectedCell.accessoryType == UITableViewCellAccessoryCheckmark)
            {
                selectedCell.accessoryType = UITableViewCellAccessoryNone;
                // Reflect deselection in data model
            }
          
            break;
        }
        case choiceSection:
        case mustSection:
        {
            if([anotherIncomingObject.isMultiple isEqualToNumber:multiple]) //multiple selections - inclusive list
            {
                if (selectedCell.accessoryType == UITableViewCellAccessoryNone)
                {
                    selectedCell.accessoryType = UITableViewCellAccessoryCheckmark;
                    // Reflect selection in data model
                }
                else if (selectedCell.accessoryType == UITableViewCellAccessoryCheckmark)
                {
                    selectedCell.accessoryType = UITableViewCellAccessoryNone;
                    // Reflect deselection in data model
                }
            }
            else if([anotherIncomingObject.isMultiple isEqualToNumber:onlyOne]) //single selection - exclusive list
            {
                
                if (selectedCell.accessoryType == UITableViewCellAccessoryNone)
                {
                    UITableViewCell *oldCell = [theTableView cellForRowAtIndexPath:self.oldIndexPath];
                    
                    if (oldCell.accessoryType == UITableViewCellAccessoryCheckmark)
                    {
                        oldCell.accessoryType = UITableViewCellAccessoryNone;
                    }
                    selectedCell.accessoryType = UITableViewCellAccessoryCheckmark;
                    //Reflect selection in data model
                    self.oldIndexPath = indexPath;
                }
                else if(selectedCell.accessoryType == UITableViewCellAccessoryCheckmark)
                {
                    UITableViewCell *oldCell = [theTableView cellForRowAtIndexPath:self.oldIndexPath];
                    
                    if (oldCell.accessoryType == UITableViewCellAccessoryCheckmark)
                    {
                        oldCell.accessoryType = UITableViewCellAccessoryNone;
                    }
                    selectedCell.accessoryType = UITableViewCellAccessoryNone;
                    //Reflect deselection in data model
                    self.oldIndexPath = indexPath;
                }
            }
            else
            {
                NSLog(@"Unknown Selection");
            }
            
            break;
        }
        default:
            NSLog(@"unknown section");
        
    }//end switch
    
}//end tableView:didSelectRowAtIndexPath



/*
 NSLog(@"row: %lu", (unsigned long)indexPath.row);
 NSLog(@"arrayOfChoiceVal: %ld", (long)[anotherIncomingObject.arrayOfChoice[indexPath.row] integerValue]);
 NSLog(@"ingredientTableID: %ld", (long)[[[ingredientsTable objectAtIndex:i] ingredientsID]  integerValue]);
 */

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



@end
