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

@synthesize ingredientsTable, ingredientsGroupTable, ingredientsGroupItemTable, anotherIncomingObject;

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
                NSLog(@"row: %lu", (unsigned long)indexPath.row);
                NSLog(@"arrayOfChoiceVal: %ld", (long)[anotherIncomingObject.arrayOfChoice[indexPath.row] integerValue]);
                NSLog(@"ingredientTableID: %ld", (long)[[[ingredientsTable objectAtIndex:i] ingredientsID]  integerValue]);
                
                if([[[ingredientsTable objectAtIndex:i] ingredientsID] isEqualToNumber:anotherIncomingObject.arrayOfChoice[indexPath.row]] )
                {
                    cell.choiceItem.text = [[ingredientsTable objectAtIndex:i] ingredientsName];
                }
            }
        }
            break;
        case choiceSection:
            break;
        case mustSection:
            break;
        default:
            NSLog(@"unknown section");

            
    }//end switch
    

    
    /*
     
     for(int i = 0; i<ingredientsGroupTable.count ; i++)
     {
     if([[[ingredientsGroupTable objectAtIndex:i] GroupID] isEqualToNumber:theIncomingObject.choiceGroups[indexPath.row]] )
     {
     cell.ingredientLabel.text = [[ingredientsGroupTable objectAtIndex:i] GroupName];
     }
     }
     
     
     */
    
    
    /*
     for(int i = 0; i<anotherIncomingObject.arrayOfChoice.count; i++)
     {
     for(int j = 0; j<ingredientsTable.count; j++)
     {
     NSLog(@"row: %lu", (unsigned long)indexPath.row);
     NSLog(@"arrayOfChoiceVal: %ld", (long)[anotherIncomingObject.arrayOfChoice[i] integerValue]);
     NSLog(@"ingredientTableID: %ld", (long)[[[ingredientsTable objectAtIndex:j] ingredientsID]  integerValue]);
     
     if([anotherIncomingObject.arrayOfChoice[i] isEqualToNumber:[[ingredientsTable objectAtIndex:j] ingredientsID]])
     {
     cell.choiceItem.text = [[ingredientsTable objectAtIndex:j] ingredientsName];
     }
     }
     
     }

     
     */
    
    
   
    
    return cell;
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

@end
