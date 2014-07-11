//
//  IndividualItemDetailViewController.m
//  CPDeliVersion1
//
//  Created by John Battaglia on 6/12/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import "IndividualItemDetailViewController.h"

@interface IndividualItemDetailViewController ()

@end

@implementation IndividualItemDetailViewController

@synthesize incomingObject, itemNameLabel, itemPriceLabel, itemDescriptionLabel;

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
    
    [self setLabels];
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

-(void)getItemObject:(IndividualItems*)theItemObject
{
    incomingObject = theItemObject;
}

-(void)setLabels
{
    itemNameLabel.text = incomingObject.itemName;
    itemDescriptionLabel.text = incomingObject.itemDescription;
    NSString *conversionString = [incomingObject.price stringValue];
    itemPriceLabel.text = conversionString;
}



@end
