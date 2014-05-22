//
//  AboutUs.m
//  CPDeliVersion1
//
//  Created by John Battaglia on 5/21/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import "AboutUs.h"

@interface AboutUs ()

@end

@implementation AboutUs

@synthesize aboutUsImage1;

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
