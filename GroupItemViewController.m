//
//  GroupItemViewController.m
//  CPDeliVersion1
//
//  Created by John Battaglia on 5/20/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//
//

#import "GroupItemViewController.h"

#define getGroupItemsJSONURL @"http://71.238.152.208:1986/CPDeliWebService.asmx/GetGroupItemsJSON"

#define getIndividualItemsJSONURL @"http://71.238.152.208:1986/CPDeliWebService.asmx/GetIndividualItemsJSON"

#define getIngredientsTableJSONURL @"http://71.238.152.208:1986/CPDeliWebService.asmx/GetIngredientsTableJSON"

#define getIngredientsGroupItemsTableJSONURL @"http://71.238.152.208:1986/CPDeliWebService.asmx/GetIngredientGroupItemsTableJSON"

#define getIngredientsGroupTableJSONURL @"http://71.238.152.208:1986/CPDeliWebService.asmx/GetIngredientGroupTableJSON"

@interface GroupItemViewController ()

@end

@implementation GroupItemViewController

@synthesize groupItemArray, individualItemArray, ingredientsTableArray, ingredientsGroupTableArray, ingredientsGroupItemTableArray;
@synthesize connection1, connection2, connection3, connection4, connection5;

NSMutableData *responseData;                                //raw xml array
NSMutableString *currentElement;                            //raw json array

NSData *groupItemData;                                      //json in data format for use with jsonserialization
NSMutableDictionary *groupItemDictionary;                   //data in dictionary form
NSMutableArray *tempGroupItemArray;                         //temp data array

NSData *individualItemData;                                 //json in data format for use with jsonserialization
NSMutableDictionary *individualItemDictionary;              //data in dictionary form
NSMutableArray *tempIndividualItemArray;                    //temp data array

NSData *ingredientsTableData;                               //json in data format for use with jsonserialization
NSMutableDictionary *ingredientsTableDictionary;            //data in dictionary form
NSMutableArray *tempIngredientsTableArray;                  //temp data array

NSData *ingredientsGroupTableData;                          //json in data format for use with jsonserialization
NSMutableDictionary *ingredientsGroupTableDictionary;       //data in dictionary form
NSMutableArray *tempIngredientsGroupTableArray;             //temp data array

NSData *ingredientsGroupItemTableData;                      //json in data format for use with jsonserialization
NSMutableDictionary *ingredientsGroupItemTableDictionary;   //data in dictionary form
NSMutableArray *tempIngredientsGroupItemTableArray;         //temp data array

int connectionFlag = 0;                                     //determines which connection is being worked with
bool groupItemsFetched = false;                             //mark groupItems fetched with true
bool individualItemsFetched = false;                        //mark individualItems fetched with true
bool ingredientsTableFetched = false;                       //mark ingredientsTable fetched with true
bool ingredientsGroupTableFeteched = false;                 //mark ingredientsGroupTable fetched with true
bool ingredientsGroupItemTableFetched = false;              //mark ingredientsGroupItemTable fetched with true

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
    
    [self retrieveData];
    
    
    
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return groupItemArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GroupItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MenuGroups" forIndexPath:indexPath];
    
    // Configure the cell...
    MenuGroups *groupObject;
    groupObject = [groupItemArray objectAtIndex:indexPath.row];
    
    cell.groupItemLabel.text = groupObject.groupItem;
    cell.groupItemImage.image = groupObject.theImage;
    
    //accessory
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
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
 
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if([[segue identifier] isEqualToString:@"groupToIndividual"])
    {
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        
        IndividualItemViewController *itemViewController;
        itemViewController = [segue destinationViewController];
        
        //get the object for the selected row
        MenuGroups *theGroupObject = [groupItemArray objectAtIndex:myIndexPath.row];
        
        [[segue destinationViewController] getItem:theGroupObject];
    
    }
}

- (void) retrieveData
{
    //Create the request
    NSURL *groupItemsURL = [NSURL URLWithString:getGroupItemsJSONURL];
    NSURLRequest *groupItemsRequest = [NSURLRequest requestWithURL:groupItemsURL];
    //Create URL connection and fire request
    connection1 = [[NSURLConnection alloc] initWithRequest:groupItemsRequest delegate:self];
    
    //create the request
    NSURL *individualItemsURL = [NSURL URLWithString:getIndividualItemsJSONURL];
    NSURLRequest *individualItemsRequest = [NSURLRequest requestWithURL:individualItemsURL];
    //Create URL connection and fire request
    connection2 = [[NSURLConnection alloc] initWithRequest:individualItemsRequest delegate:self];
    
    //create the request
    NSURL *ingredientsTableURL = [NSURL URLWithString:getIngredientsTableJSONURL];
    NSURLRequest *ingredientsTableRequest = [NSURLRequest requestWithURL:ingredientsTableURL];
    //Create URL connection and fire request
    connection3 = [[NSURLConnection alloc] initWithRequest:ingredientsTableRequest delegate:self];
    
    //create the request
    NSURL *ingredientsGroupTableURL = [NSURL URLWithString:getIngredientsGroupTableJSONURL];
    NSURLRequest *ingredientsGroupTableRequest = [NSURLRequest requestWithURL:ingredientsGroupTableURL];
    //Create URL connection and fire request
    connection4 = [[NSURLConnection alloc] initWithRequest:ingredientsGroupTableRequest delegate:self];
    
    //create the request
    NSURL *ingredientsGroupItemTableURL = [NSURL URLWithString:getIngredientsGroupItemsTableJSONURL];
    NSURLRequest *ingredientsGroupItemTableRequest = [NSURLRequest requestWithURL:ingredientsGroupItemTableURL];
    //Create URL connection and fire request
    connection5 = [[NSURLConnection alloc] initWithRequest:ingredientsGroupItemTableRequest delegate:self];
    
}
    
#pragma mark NSURLConnection Delegate Methods
    
- (void)connection:(NSURLConnection *)connection
didReceiveResponse:(NSURLResponse *)response {
    // A response has been received, this is where we initialize the instance var you created
    // so that we can append data to it in the didReceiveData method
    // Furthermore, this method is called each time there is a redirect so reinitializing it
    // also serves to clear it
    responseData = [[NSMutableData alloc] init];
}
    
- (void)connection:(NSURLConnection *)connection
    didReceiveData:(NSData *)data {
    // Append the new data to the instance variable you declared
    [responseData appendData:data];
    [self.tableView reloadData];
}
    
- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    // Return nil to indicate not necessary to store a cached response for this connection
    return nil;
}
    
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // The request is complete and data has been received
    // You can parse the stuff in your instance variable now
    
    if(connection == connection1)
    {
        connectionFlag = 1;
    }
    else if(connection == connection2)
    {
        connectionFlag = 2;
    }
    else if(connection == connection3)
    {
        connectionFlag = 3;
    }
    else if(connection == connection4)
    {
        connectionFlag = 4;
    }
    else if(connection == connection5)
    {
        connectionFlag = 5;
    }
    else
    {
        NSLog(@"Unknown NSURLConnection");
    }
    
    //Use XML delegate
    NSXMLParser *parser=[[NSXMLParser alloc] initWithData:responseData];
    [parser setDelegate:self];
    [parser parse];
    
}
    
- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error {
    // The request has failed for some reason!
    // Check the error var
    NSLog(@"Error : %@",[error localizedDescription]);
}

#pragma mark Parse Methods

- (void)parserDidStartDocument:(NSXMLParser *)parser
{
    NSLog(@"Parser start");
}

- (void) parser: (NSXMLParser *) parser
didStartElement: (NSString *) elementName
   namespaceURI: (NSString *) namespaceURI
  qualifiedName: (NSString *) qName
     attributes: (NSDictionary *) attributeDict
{
    if ([elementName isEqualToString:@"string"])
    {
        currentElement = [[NSMutableString alloc] init];
        return;
    }
}

- (void)parser:(NSXMLParser *)parser
foundCharacters:(NSString *)string
{
    [currentElement appendString:string];
}

- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
{
    if([elementName isEqualToString:@"string"])
    {
        return;
    }
}

- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    
    if(connectionFlag == 1)
    {
        NSLog(@"connection1");
        
        //convert string to dataObject
        groupItemData = [currentElement dataUsingEncoding:NSUTF8StringEncoding];
        
        NSError *groupItemError;
        groupItemDictionary = [NSJSONSerialization JSONObjectWithData:groupItemData options:NSJSONReadingMutableContainers error:&groupItemError];
        
        if(groupItemError)
        {
            NSLog(@"%@", [groupItemError localizedDescription]);
        }
        else
        {
            tempGroupItemArray = groupItemDictionary[@"MenuGroupsTable"];
        }
        
        groupItemArray = [[NSMutableArray alloc] init];
        
        for(int i = 0; i<tempGroupItemArray.count; i++)
        {
            //create our groupItemObjects
            //objectForKey value must match exactly to JSON string keys
            NSNumber *gID = [[tempGroupItemArray objectAtIndex:i] objectForKey:@"GroupID"];
            NSString *gItem = [[tempGroupItemArray objectAtIndex:i] objectForKey:@"GroupItem"];
            NSString *gImageURL = [[tempGroupItemArray objectAtIndex:i] objectForKey:@"ImageURL"];

            [groupItemArray addObject:[[MenuGroups alloc]initWithGroupID:gID andGroupItem:gItem andImageURL:gImageURL]];
        }
        
        //clear responseData to it can be reused for other connections
        [responseData setLength:0];
        
        //mark as fetched
        groupItemsFetched = true;
        
        //if all menu items fetched create the data structure
        if(groupItemsFetched && individualItemsFetched && ingredientsTableFetched && ingredientsGroupTableFeteched && ingredientsGroupItemTableFetched)
        {
            [self createTheDataStructure];
        }
        
    }
    else if(connectionFlag == 2)
    {
        NSLog(@"connection2");
        
        //convert string to dataObject
        individualItemData = [currentElement dataUsingEncoding:NSUTF8StringEncoding];
        
        NSError *individualItemError;
        individualItemDictionary = [NSJSONSerialization JSONObjectWithData:individualItemData options:NSJSONReadingMutableContainers error:&individualItemError];
        
        if(individualItemError)
        {
            NSLog(@"%@", [individualItemError localizedDescription]);
        }
        else
        {
            tempIndividualItemArray = individualItemDictionary[@"IndividualItemsTable"];
        }
        
        individualItemArray = [[NSMutableArray alloc] init];
        
        for(int i = 0; i<tempIndividualItemArray.count; i++)
        {
            //create our individualItem objects
            //objectForKey value must match exactly to JSON string keys
            NSNumber *iID = [[tempIndividualItemArray objectAtIndex:i] objectForKey:@"ItemID"];
            NSString *iName = [[tempIndividualItemArray objectAtIndex:i] objectForKey:@"ItemName"];
            NSString *iDescription = [[tempIndividualItemArray objectAtIndex:i] objectForKey:@"ItemDescription"];
        
            NSError *error4;
            NSString *iIngredients = [[tempIndividualItemArray objectAtIndex:i] objectForKey:@"Ingredients"];
            NSData *jsonIngredients =[iIngredients dataUsingEncoding:NSUTF8StringEncoding];
            NSArray *theIngredientsGroup = [NSJSONSerialization JSONObjectWithData:jsonIngredients options:0 error:&error4];
            NSLog(@"%@", theIngredientsGroup);
            
            NSString *iDeluxeIngredients = [[tempIndividualItemArray objectAtIndex:i] objectForKey:@"DeluxeIngredients"];
            NSNumber *iParentGroup = [[tempIndividualItemArray objectAtIndex:i] objectForKey:@"ParentGroup"];
            NSNumber *iPrice = [[tempIndividualItemArray objectAtIndex:i] objectForKey:@"Price"];
            
            NSString *iChoiceGroups = [[tempIndividualItemArray objectAtIndex:i] objectForKey:@"ChoiceGroups"];
            NSError *error1;
            NSData *jsonChoiceGroups = [iChoiceGroups dataUsingEncoding:NSUTF8StringEncoding];
            NSArray *theChoiceGroups = [NSJSONSerialization JSONObjectWithData:jsonChoiceGroups options:0 error:&error1];
            
            NSString *iMustGroups = [[tempIndividualItemArray objectAtIndex:i] objectForKey:@"MustGroups"];
            NSError *error2;
            NSData *jsonMustGroups = [iMustGroups dataUsingEncoding:NSUTF8StringEncoding];
            NSArray *theMustGroups = [NSJSONSerialization JSONObjectWithData:jsonMustGroups options:0 error:&error2];
            
            NSString *iExcludeGroups = [[tempIndividualItemArray objectAtIndex:i] objectForKey:@"ExcludeItems"];
            NSError *error3;
            NSData *jsonExcludeGroups = [iExcludeGroups dataUsingEncoding:NSUTF8StringEncoding];
            NSArray *theExcludeGroups = [NSJSONSerialization JSONObjectWithData:jsonExcludeGroups options:0 error:&error3];
            
            [individualItemArray addObject:[[IndividualItems alloc]initWithItemID:iID andItemName:iName andItemDescription:iDescription andIngredients:theIngredientsGroup andDeluxeIngredients:iDeluxeIngredients andParentGroup:iParentGroup andPrice:iPrice andChoiceGroups:theChoiceGroups andMustGroups:theMustGroups andExcludeGroups:theExcludeGroups]];
        }
        
        //clear responseData to it can be reused for other connections
        [responseData setLength:0];
        
        //mark as fetched
        individualItemsFetched = true;
        
        //if all menu items fetched create the data structure
        if(groupItemsFetched && individualItemsFetched && ingredientsTableFetched && ingredientsGroupTableFeteched && ingredientsGroupItemTableFetched)
        {
            [self createTheDataStructure];
        }

    }
    else if(connectionFlag == 3)
    {
        NSLog(@"connection3");
        
        //convert string to dataObject
        ingredientsTableData = [currentElement dataUsingEncoding:NSUTF8StringEncoding];
        
        //determine if any errors occured, if yes: display error message if no: create temp array
        NSError *ingredientsTableError;
        
        ingredientsTableDictionary = [NSJSONSerialization JSONObjectWithData:ingredientsTableData options:NSJSONReadingMutableContainers error:&ingredientsTableError];
        
        if(ingredientsTableError)
        {
            NSLog(@"%@", [ingredientsTableError localizedDescription]);
        }
        else
        {
            tempIngredientsTableArray = ingredientsTableDictionary[@"IngredientsTable"];
        }
        
        ingredientsTableArray = [[NSMutableArray alloc] init];
        
        for(int i = 0; i<tempIngredientsTableArray.count; i++)
        {
            //create our individualItem objects
            //objectForKey value must match exactly to JSON string keys
            NSNumber *ingIngredientID = [[tempIngredientsTableArray objectAtIndex:i] objectForKey:@"IngredientID"];
            NSString *ingIngredientName = [[tempIngredientsTableArray objectAtIndex:i] objectForKey:@"IngredientName"];
            NSNumber *ingPrice = [[tempIngredientsTableArray objectAtIndex:i] objectForKey:@"Price"];
            NSString *ingDayRequired = [[tempIngredientsTableArray objectAtIndex:i] objectForKey:@"DayRequired"];
            NSNumber *ingPercentageBased = [[tempIngredientsTableArray objectAtIndex:i] objectForKey:@"PercentageBased"];
            
            [ingredientsTableArray addObject:[[Ingredients alloc]initWithIngredientsID:ingIngredientID andIngredientsName:ingIngredientName andPrice:ingPrice andDayRequired:ingDayRequired andPercentageBased:ingPercentageBased]];
        }
        
        [IngredientsTable loadIngredientsTable:ingredientsTableArray];
        
        //clear responseData to it can be reused for other connections
        [responseData setLength:0];
        
        //mark as fetched
        ingredientsTableFetched = true;
        
        //if all menu items fetched create the data structure
        if(groupItemsFetched && individualItemsFetched && ingredientsTableFetched && ingredientsGroupTableFeteched && ingredientsGroupItemTableFetched)
        {
            [self createTheDataStructure];
        }
        
    }
    else if(connectionFlag == 4)
    {
        NSLog(@"connection4");
        
        //convert string to dataObject
        ingredientsGroupTableData = [currentElement dataUsingEncoding:NSUTF8StringEncoding];
        
        //determine if any errors occured, if yes: display error message if no: create temp array
        NSError *ingredientsGroupTableError;
        
        ingredientsGroupTableDictionary = [NSJSONSerialization JSONObjectWithData:ingredientsGroupTableData options:NSJSONReadingMutableContainers error:&ingredientsGroupTableError];
        
        if(ingredientsGroupTableError)
        {
            NSLog(@"%@", [ingredientsGroupTableError localizedDescription]);
        }
        else
        {
            tempIngredientsGroupTableArray = ingredientsGroupTableDictionary[@"IngredientGroupTable"];
        }
        
        ingredientsGroupTableArray = [[NSMutableArray alloc] init];
        
        for(int i = 0; i<tempIngredientsGroupTableArray.count; i++)
        {
            //create our ingredientsGroupTable objects
            //objectForKey value must match exactly to JSON string keys
            NSNumber *ingGroupID = [[tempIngredientsGroupTableArray objectAtIndex:i] objectForKey:@"GroupID"];
            NSString *ingGroupName = [[tempIngredientsGroupTableArray objectAtIndex:i] objectForKey:@"GroupName"];
            NSNumber *ingSelectMultiple = [[tempIngredientsGroupTableArray objectAtIndex:i] objectForKey:@"SelectMultiple"];
            
            [ingredientsGroupTableArray addObject:[[IngredientsGroupItem alloc] initWithGroupID:ingGroupID andGroupName:ingGroupName andSelectMultiple:ingSelectMultiple]];
        }
        
        [IngredientsTable loadIngredientsGroupTable:ingredientsGroupTableArray];
        
        //clear responseData to it can be reused for other connections
        [responseData setLength:0];
        
        //mark as fetched
        ingredientsGroupTableFeteched = true;
        
        //if all menu items fetched create the data structure
        if(groupItemsFetched && individualItemsFetched && ingredientsTableFetched && ingredientsGroupTableFeteched && ingredientsGroupItemTableFetched)
        {
            [self createTheDataStructure];
        }
        
    }
    else if(connectionFlag == 5)
    {
        NSLog(@"connection5");
        
        //convert string to dataObject
        ingredientsGroupItemTableData = [currentElement dataUsingEncoding:NSUTF8StringEncoding];
        
        //determine if any errors occured, if yes: display error message if no: create temp array
        NSError *ingredientsGroupItemTableError;
        
        ingredientsGroupItemTableDictionary = [NSJSONSerialization JSONObjectWithData:ingredientsGroupItemTableData options:NSJSONReadingMutableContainers error:&ingredientsGroupItemTableError];
        
        if(ingredientsGroupItemTableError)
        {
            NSLog(@"%@", [ingredientsGroupItemTableError localizedDescription]);
        }
        else
        {
            tempIngredientsGroupItemTableArray = ingredientsGroupItemTableDictionary[@"IngredientGroupItemsTable"];
        }
        
        ingredientsGroupItemTableArray = [[NSMutableArray alloc] init];
        
        for(int i = 0; i<tempIngredientsGroupItemTableArray.count; i++)
        {
            //create our individualItem objects
            //objectForKey value must match exactly to JSON string keys
            NSNumber *ingItemID = [[tempIngredientsGroupItemTableArray objectAtIndex:i] objectForKey:@"ItemID"];
            NSString *ingItemName = [[tempIngredientsGroupItemTableArray objectAtIndex:i] objectForKey:@"ItemName"];
            NSNumber *ingParentGroup = [[tempIngredientsGroupItemTableArray objectAtIndex:i] objectForKey:@"ParentGroup"];
            NSNumber *ingPrice = [[tempIngredientsGroupItemTableArray objectAtIndex:i] objectForKey:@"Price"];
            
            [ingredientsGroupItemTableArray addObject:[[IngredientsGroupItemItem alloc]initWithItemID:ingItemID andItemName:ingItemName andParentGroup:ingParentGroup andPrice:ingPrice]];
        }
        
        [IngredientsTable loadIngredientsGroupItemTable:ingredientsGroupItemTableArray];
        
        //clear responseData to it can be reused for other connections
        [responseData setLength:0];
        
        //mark as fetched
        ingredientsGroupItemTableFetched = true;
        
        //if all menu items fetched create the data structure
        if(groupItemsFetched && individualItemsFetched && ingredientsTableFetched && ingredientsGroupTableFeteched && ingredientsGroupItemTableFetched)
        {
            [self createTheDataStructure];
        }
        
    }
    else
    {
        NSLog(@"Unknown ConnectionFlag");
    }

}

- (void) createTheDataStructure
{
    NSLog(@"createTheDataStructure");
    MenuGroups *tempGroupItem;
    IndividualItems *tempIndividualItems;
    
    //add individual items to the appropriate groupItem array.
    //eg. add all individual items that are breakfast sandwiches to breakfastSandwich group array
    for(int i = 0; i<groupItemArray.count; i++)
    {
        tempGroupItem = groupItemArray[i];
        
        for(int j=0; j<individualItemArray.count; j++)
        {
            tempIndividualItems = individualItemArray[j];
            
            if([tempGroupItem.groupID isEqualToNumber:tempIndividualItems.parentGroup])
            {
                [[[groupItemArray objectAtIndex:i] individualItemsArray] addObject:tempIndividualItems];
            }
        }
    }
    
    //reload data to display in tables
    [self.tableView reloadData];
}




@end
