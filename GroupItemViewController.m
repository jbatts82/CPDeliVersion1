//
//  GroupItemViewController.m
//  CPDeliVersion1
//
//  Created by John Battaglia on 5/20/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//
//

#import "GroupItemViewController.h"
#import "MenuGroups.h"

#define getDataURL @"http://71.238.152.229:1985/CPDeliWebService.asmx/GetGroupItemsJSON"


@interface GroupItemViewController ()

@end

@implementation GroupItemViewController

@synthesize jsonArray, menuGroupArray, menuGroupDictionary, tempArray;

NSMutableData *responseData; //raw xml array
NSMutableString *currentElement; //raw json array
NSData *menuGroupData; //json in data format for use with jsonserialization

#pragma mark NSURLConnection Delegate Methods

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
    
    
    //NSURL *testURL = [
   // NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL urlWithString:getDataURL]];

    
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
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}



/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) retrieveData
{
    //Create the request
    NSURL *url = [NSURL URLWithString:getDataURL];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];

    //Create URL connection and fire request
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
}//end retrieveData
    
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
}
    
- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    // Return nil to indicate not necessary to store a cached response for this connection
    return nil;
}
    
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // The request is complete and data has been received
    // You can parse the stuff in your instance variable now
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
    //convert string to dataObject
    menuGroupData = [currentElement dataUsingEncoding:NSUTF8StringEncoding];
    
    //remove trailing \0 for use with NSJSONSerilaization:JSONObjectWithData
    //menuGroupData = [menuGroupData subdataWithRange:NSMakeRange(0, [menuGroupData length] -1)];
    
    NSError *error;
    menuGroupDictionary = [NSJSONSerialization JSONObjectWithData:menuGroupData options:NSJSONReadingMutableContainers error:&error];
    
    if(error)
    {
        NSLog(@"%@", [error localizedDescription]);
    }
    else
    {
        tempArray = menuGroupDictionary[@"MenuGroupsTable"];
        
    }
    
    menuGroupArray = [[NSMutableArray alloc] init];
    
    for(int i = 0; i<tempArray.count; i++)
    {
        //create our menuGroupObjects
        //objectForKey value must match exactly to JSON string keys
        NSNumber *gID = [[tempArray objectAtIndex:i] objectForKey:@"GroupID"];
        NSString *gItem = [[tempArray objectAtIndex:i] objectForKey:@"GroupItem"];
        NSString *gImageURL = [[tempArray objectAtIndex:i] objectForKey:@"ImageURL"];
        
        
        
                             
        
        [menuGroupArray addObject:[[MenuGroups alloc]initWithGroupID:gID andGroupItem:gItem andImageURL:gImageURL]];
        
    }
    
    
    
    
   
    
    //reload our table view
    //[self.tableView reloadData];
    
    
}


@end
