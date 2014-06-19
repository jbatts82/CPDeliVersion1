//
//  AboutUs.m
//  CPDeliVersion1
//
//  Created by John Battaglia on 5/21/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//
//  Adding COmment

#import "AboutUs.h"

#define underConstruction @"http://img2.wikia.nocookie.net/__cb20130401173051/gtawiki/images/1/14/Under_Construction.png"

@interface AboutUs ()

@end

@implementation AboutUs

@synthesize aboutUsImage1;
@synthesize aboutUsImage2;

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
    
    UIImage *img1 = [UIImage imageNamed:@"aboutUs.png"];
    [aboutUsImage1 setImage:img1];
    
    
   // aboutUsImage2.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:underConstruction]]];
    
    
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
