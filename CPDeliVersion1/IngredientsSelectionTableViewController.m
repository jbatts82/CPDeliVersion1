//
//  IngredientsSelectionTableViewController.m
//  CPDeliVersion1
//
//  Created by John Battaglia on 7/22/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import "IngredientsSelectionTableViewController.h"

#define ingredientsSection 0
#define choiceSection 1
#define mustSection 2
#define excludeSection 3

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

    return [self getNumberOfSections];
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    switch (section) {
		case ingredientsSection:
			return 1;
		case choiceSection:
			return [self.theIncomingObject.choiceGroups count];
        case mustSection:
            return [self.theIncomingObject.mustGroups count];
       // case excludeGroups
       //     return [self.theIncomingObject.excludeGroups count];
		default:
			return 0;
	}
}

- (NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case ingredientsSection:
            return @"Ingredients Selection:";
        case choiceSection:
            return @"Choose:";
        case mustSection:
            return @"Must Choose Type of:";
        case excludeSection:
            return @"Exclude";
        default:
            return @"Unknown";
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    IngredientsSelectionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"choiceCell" forIndexPath:indexPath];
    
    
    // Configure the cell...
    switch(indexPath.section){
            
        case ingredientsSection:
            cell.ingredientLabel.text = @"Ingredients";
            
            break;
            
        case choiceSection:
            for(int i = 0; i<ingredientsGroupTable.count ; i++)
            {
                if([[[ingredientsGroupTable objectAtIndex:i] GroupID] isEqualToNumber:theIncomingObject.choiceGroups[indexPath.row]] )
                {
                    cell.ingredientLabel.text = [[ingredientsGroupTable objectAtIndex:i] GroupName];
                }
            }
            break;
            
        case mustSection:
            for(int i = 0; i<ingredientsGroupTable.count ; i++)
            {
                if([[[ingredientsGroupTable objectAtIndex:i] GroupID] isEqualToNumber:theIncomingObject.mustGroups[indexPath.row]] )
                {
                    cell.ingredientLabel.text = [[ingredientsGroupTable objectAtIndex:i] GroupName];
                }
            }
            break;
            
        default:
            NSLog(@"Unknown section number");
            
    }//end switch
    
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

/*
- (void)tableView:(UITableView *)tableView
accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"ingredientToSelection" sender:[tableView cellForRowAtIndexPath:indexPath]];
}
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([[segue identifier] isEqualToString:@"ingredientToSelection"])
    {
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        
        switch (myIndexPath.section) {
                
            case ingredientsSection:
            {
                SelectionTableViewController *selectionViewController;
                selectionViewController = [segue destinationViewController];
                Choices *outGoingObject = [[Choices alloc] init];
                outGoingObject.typeOfChoice = [[NSNumber alloc]initWithInt:ingredientsSection];
                outGoingObject.arrayOfChoice = theIncomingObject.ingredients;
                outGoingObject.isMultiple = [[NSNumber alloc]initWithInt:1];
                selectionViewController.anotherIncomingObject = outGoingObject;
                break;
            }
            case choiceSection:
            {
                SelectionTableViewController *selectionViewController;
                selectionViewController = [segue destinationViewController];
                Choices *outGoingObject = [[Choices alloc] init];
                outGoingObject.typeOfChoice = [[NSNumber alloc]initWithInt:choiceSection];
                outGoingObject.arrayOfChoice = [self getTheChoiceArray:theIncomingObject.choiceGroups[myIndexPath.row]];
                outGoingObject.isMultiple = [self areMultipleChoices:myIndexPath.row ];
                
                
                selectionViewController.anotherIncomingObject = outGoingObject;
                break;
            }
            case mustSection:
            {
                SelectionTableViewController *selectionViewController;
                selectionViewController = [segue destinationViewController];
                Choices *outGoingObject = [[Choices alloc] init];
                outGoingObject.typeOfChoice = [[NSNumber alloc]initWithInt:choiceSection];
                outGoingObject.arrayOfChoice = [self getTheChoiceArray:theIncomingObject.mustGroups[myIndexPath.row]];
                selectionViewController.anotherIncomingObject = outGoingObject;
                break;
            }
            default:
                NSLog(@"Unknown Section:error");
                break;
                
                
                
        }//end switch
    }
}



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

- (NSArray *)getTheChoiceArray:(NSNumber *)groupNumber
{
    NSMutableArray *theChoiceArray = [[NSMutableArray alloc] init];
    
    for(int i = 0; i<ingredientsGroupItemTable.count; i++)
    {
        if([[[ingredientsGroupItemTable objectAtIndex:i] ParentGroup] isEqualToNumber:groupNumber])
        {
            [theChoiceArray addObject:[ingredientsGroupItemTable objectAtIndex:i] ];
        }
    }
    
    return theChoiceArray;
}

-(NSNumber *)areMultipleChoices:(NSInteger)isMultiple
{
    
    NSNumber *theType = [[NSNumber alloc] init];
    NSNumber *multiple = [[NSNumber alloc] initWithInt:0];
    
    theType = [theIncomingObject.choiceGroups objectAtIndex:isMultiple];
    
    for(int i = 0; i < ingredientsGroupTable.count; i++)
    {
        if([[[ingredientsGroupTable objectAtIndex:i] GroupID] isEqualToNumber:theType])
        {
            multiple = [[ingredientsGroupTable objectAtIndex:i] SelectMultiple];
        }
    }
    
    return multiple;
}



@end
