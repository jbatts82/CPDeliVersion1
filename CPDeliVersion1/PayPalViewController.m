//
//  PayPalViewController.m
//  CPDeliVersion1
//
//  Created by Ahmed Altai on 7/27/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import "PayPalViewController.h"

#define VerifyPayPalPaymentURL @"http://71.238.152.208:1986/cpdeliwebservice.asmx/VerifyPayPalPayment"

@interface PayPalViewController ()

@property (nonatomic, strong, readwrite) PayPalConfiguration *payPalConfiguration;

@end

@implementation PayPalViewController
{
    NSMutableData *responseData;
    NSMutableString *currentElement;
    NSMutableString *finalResponse;
}

@synthesize theConnection;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _payPalConfiguration = [[PayPalConfiguration alloc] init];
        
        // See PayPalConfiguration.h for details and default values.
        // Should you wish to change any of the values, you can do so here.
        // For example, if you wish to accept PayPal but not payment card payments, then add:
        _payPalConfiguration.acceptCreditCards = YES;
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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // Start out working with the test environment! When you are ready, switch to PayPalEnvironmentProduction.
    [PayPalMobile preconnectWithEnvironment:PayPalEnvironmentNoNetwork];
}

- (IBAction)pay
{
    // Create a PayPalPayment
    PayPalPayment *payment = [[PayPalPayment alloc] init];
    
    // Amount, currency, and description
    payment.amount = [[NSDecimalNumber alloc] initWithString:@"39.95"];
    payment.currencyCode = @"USD";
    payment.shortDescription = @"Awesome saws";
    
    // Use the intent property to indicate that this is a "sale" payment,
    // meaning combined Authorization + Capture. To perform Authorization only,
    // and defer Capture to your server, use PayPalPaymentIntentAuthorize.
    payment.intent = PayPalPaymentIntentSale;
    
    // Check whether payment is processable.
    if (!payment.processable) {
        // If, for example, the amount was negative or the shortDescription was empty, then
        // this payment would not be processable. You would want to handle that here.
    }
    
    // Create a PayPalPaymentViewController.
    PayPalPaymentViewController *paymentViewController;
    paymentViewController = [[PayPalPaymentViewController alloc] initWithPayment:payment
                                                                   configuration:self.payPalConfiguration
                                                                        delegate:self];
    
    // Present the PayPalPaymentViewController.
    [self presentViewController:paymentViewController animated:YES completion:nil];
}

#pragma mark - PayPalPaymentDelegate methods

- (void)payPalPaymentViewController:(PayPalPaymentViewController *)paymentViewController
                 didCompletePayment:(PayPalPayment *)completedPayment {
    // Payment was processed successfully; send to server for verification and fulfillment.
    [self verifyCompletedPayment:completedPayment];
    
    // Dismiss the PayPalPaymentViewController.
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)payPalPaymentDidCancel:(PayPalPaymentViewController *)paymentViewController {
    // The payment was canceled; dismiss the PayPalPaymentViewController.
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)verifyCompletedPayment:(PayPalPayment *)completedPayment
{
    // Send the entire confirmation dictionary
    // paypal confirmation is given as NSData from JSON serialization. Can this be used directly or should it be converted to NSString? Current code does conversion to string.
    NSData *confirmation = [NSJSONSerialization dataWithJSONObject:completedPayment.confirmation options:0 error:nil];
    
    //web service address and function
    NSString *urlString = VerifyPayPalPaymentURL;
    
    //convert string to url data type
    NSURL *url = [NSURL URLWithString:urlString];
    
    //make the request
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    //set request type: "POST"
    [request setHTTPMethod: @"POST"];
    
    //parameter string names
    NSString *myRequestString1 = @"jsonCustomerInfo";
    NSString *myRequestString2 = @"jsonCartItems";
    NSString *myRequestString3 = @"customerTotal";
    NSString *myRequestString4 = @"payPalPaymentDetails";
    NSString *myRequestString5 = @"typeOfDelivery";
    
    
    
/*******************************************************************************************************************
 
 Test Data
 
 ****************/
    
    NSString *jsonCustomerInfoTest = @"{\"AccountID\":\"21\",\"City\":\"xK9clbWAfkZyRoD0fiOXNQ==\n\",\"Zip\":\"v826u//Gzv8LODYjr5lHeg==\n\",\"EMail\":\"mhaquex19@gmail.com\",\"Street\":\"x56ZvLCGR2qkbdbaGmZbfw==\n\",\"FirstName\":\"Mahbubul\",\"LastName\":\"Haque\",\"PhoneNumber\":\"xJN2I+rJoN5lBdxfhdRnKX6CDwcFgy6TXKqDC/TagFs=\n\",\"EmailVerified\":1,\"Deliverable\":0}";
    
    NSString *jsonCartItemsTest = @"[{\"isDeluxe\":false,\"item\":{\"ChoiceGroups\":[3,2,4],\"DeluxeChoiceGroups\":[],\"DeluxeIngredients\":[],\"MustGroups\":[],\"ExcludeItems\":[],\"ImageURL\":\"*\",\"Ingredients\":[107,8,9],\"ItemDescription\":\"Ham, bacon or sausage and 2 scrambled eggs, hashbrowns and American cheese\",\"ItemName\":\"Ham, Bacon or Sausage Wrap\",\"ItemID\":13,\"DeluxePrice\":0.0,\"ParentGroup\":3,\"Price\":3.49},\"selectedChoices\":[{\"ItemName\":\"Mustard\",\"ItemID\":16,\"ParentGroup\":3,\"Price\":0.0},{\"ItemName\":\"Ranch\",\"ItemID\":9,\"ParentGroup\":2,\"Price\":0.0},{\"ItemName\":\"Swiss\",\"ItemID\":28,\"ParentGroup\":4,\"Price\":0.0}],\"selectedIngredients\":[{\"DayRequired\":[],\"IngredientName\":\"Scrambled Egg x 2\",\"IngredientID\":107,\"PercentageBased\":-1.0,\"Price\":0.0},{\"DayRequired\":[],\"IngredientName\":\"Hash-Brown\",\"IngredientID\":8,\"PercentageBased\":-1.0,\"Price\":0.0},{\"DayRequired\":[],\"IngredientName\":\"American Cheese\",\"IngredientID\":9,\"PercentageBased\":-1.0,\"Price\":0.0}],\"unselectedIngredients\":[],\"totalPrice\":3.49},{\"isDeluxe\":true,\"item\":{\"ChoiceGroups\":[3,2,4],\"DeluxeChoiceGroups\":[6],\"DeluxeIngredients\":[69],\"MustGroups\":[1],\"ExcludeItems\":[],\"ImageURL\":\"*\",\"Ingredients\":[22,23,24,25,26,27],\"ItemDescription\":\"Deli sandwiches are served on Rye, Onion Roll .50, Kaiser, Bagel, Pita .75, Croissant .50,  White or Wheat bread\",\"ItemName\":\"Hot Corned Beef\",\"ItemID\":21,\"DeluxePrice\":2.59,\"ParentGroup\":4,\"Price\":6.49},\"selectedChoices\":[{\"ItemName\":\"Broasted Potato\",\"ItemID\":42,\"ParentGroup\":6,\"Price\":0.0}],\"selectedIngredients\":[{\"DayRequired\":[],\"IngredientName\":\"16 Oz. Fountain Drink\",\"IngredientID\":69,\"PercentageBased\":-1.0,\"Price\":0.0}],\"unselectedIngredients\":[],\"totalPrice\":2.59}]";
    
    NSString *customerTotalTest = @"6.44";
    
    NSString *payPalPaymentDetailsTest = @"{\"response\":{\"state\":\"approved\",\"id\":\"PAY-8MC476045B393683KKPVLFMQ\",\"create_time\":\"2014-08-13T00:34:58Z\",\"intent\":\"sale\"},\"client\":{\"platform\":\"Android\",\"paypal_sdk_version\":\"2.2.2\",\"product_name\":\"PayPal-Android-SDK\",\"environment\":\"sandbox\"},\"response_type\":\"payment\"}";
    
    NSString *typeOfDeliveryTest = @"DINE IN";
    
/*******************************************************************************************************************
****************/
    
    
    
    // value of parameters strings
    NSString *myParamString1 = jsonCustomerInfoTest;
    NSString *myParamString2 = jsonCartItemsTest;
    NSString *myParamString3 = customerTotalTest;
    NSString *myParamString4 = payPalPaymentDetailsTest;
    NSString *myParamString5 = typeOfDeliveryTest;
   
    // concatenated string of parameters and values
    NSString *reqStringFUll=[NSString stringWithFormat:@"%@=%@&%@=%@&%@=%@&%@=%@&%@=%@",myRequestString1,myParamString1,myRequestString2,myParamString2,myRequestString3,myParamString3,myRequestString4,myParamString4,myRequestString5,myParamString5];
    
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
    //nameLabel.text = finalResponse;
}

/********************************/

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
