//
//  IndividualItemDetailViewController.h
//  CPDeliVersion1
//
//  Created by John Battaglia on 6/12/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IndividualItems.h"
#import "IndividualItemViewController.h"
#import "IngredientsViewController.h"

@interface IndividualItemDetailViewController : UIViewController

@property (nonatomic, strong) NSString *itemName;
@property (nonatomic, strong) NSString *itemDescription;
@property (nonatomic, strong) NSNumber *itemPrice;

@property (nonatomic, strong) IBOutlet UILabel *itemNameLabel;
@property (nonatomic, strong) IBOutlet UILabel *itemDescriptionLabel;
@property (nonatomic, strong) IBOutlet UILabel *itemPriceLabel;

@property (nonatomic, strong)IndividualItems *incomingObject;

-(IBAction)selectItem:(id)sender;


-(void)getItemObject:(IndividualItems*)theItemObject;
-(void)setLabels;

@end
