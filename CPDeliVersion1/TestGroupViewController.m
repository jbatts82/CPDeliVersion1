//
//  TestGroupViewController.m
//  CPDeliVersion1
//
//  Created by John Battaglia on 8/7/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import "TestGroupViewController.h"

#define testGroupURL @"http://71.238.152.208:1986/cpdeliwebservice.asmx/TESTING_GROUP"

@interface TestGroupViewController ()

@end

@implementation TestGroupViewController
{
    NSMutableData *responseData;
    NSMutableString *currentElement;
    NSMutableString *finalResponse;
}

@synthesize nameLabel,lastNameText,firstNameText,theConnection;

-(IBAction)buttonClick:(id)sender
{

    //web service address and function
    NSString *urlString = testGroupURL;
    
    //convert string to url data type
    NSURL *url = [NSURL URLWithString:urlString];
    
    //make the request
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    //set request type: "POST"
    [request setHTTPMethod: @"POST"];
    
    
    //here we want the key jsonCustomerInfo
    NSString *myRequestString1 = @"firstName"; // Attention HERE!!!!
    
    //here we want the key jsonCartItems
    NSString *myRequestString2 = @"lastName"; // Attention HERE!!!!
    
    //and three more parameters
    
    NSString *myParamString1 = self.firstNameText.text;
    NSString *myParamString2 = self.lastNameText.text;

    NSString *reqStringFUll=[NSString stringWithFormat:@"%@=%@&%@=%@",myRequestString1,myParamString1,myRequestString2,myParamString2];
    
    NSData *requestData = [NSData dataWithBytes:[reqStringFUll UTF8String] length:[reqStringFUll length]];
    
    [request setHTTPBody:requestData];
    
    theConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    
}

#pragma mark NSURLConnection Delegate Methods

- (void)connection:(NSURLConnection *)connection
didReceiveResponse:(NSURLResponse *)response {
    // A response has been received, this is where we initialize the instance var you created
    // so that we can append data to it in the didReceiveData method
    // Furthermore, this method is called each time there is a redirect so reinitializing it
    // also serves to clear it
    responseData = [[NSMutableData alloc] init];
    NSLog(@"Here I am");
    
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

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // The request has failed for some reason!
    // Check the error var
    NSLog(@"Error : %@",[error localizedDescription]);
}


/////////////////////////////////////////////////////////

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

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    [currentElement appendString:string];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if([elementName isEqualToString:@"string"])
    {
        return;
    }
}

- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    finalResponse = currentElement;
    nameLabel.text = finalResponse;
}

/********************************/

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
