//
//  AppsDetail2ViewController.m
//  doleApplicationSupportNew
//
//  Created by Rahul kumar on 12/14/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import "AppsDetail2ViewController.h"

@interface AppsDetail2ViewController ()

@end

@implementation AppsDetail2ViewController
@synthesize nameStr,deptStr,discrStr,businsAnlystStr,infoOwnrStr;

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
    self.navigationItem.title = @"Details";
    [self.navigationController setNavigationBarHidden:NO];
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
    //namelbl.text = nameStr;
    NSString *nmeStr = nameStr;
    CGSize constraintSize;
    constraintSize.width = 175.0f;
    constraintSize.height = MAXFLOAT;
    CGSize stringSize =[nmeStr sizeWithFont: [UIFont boldSystemFontOfSize: 12] constrainedToSize: constraintSize lineBreakMode: UILineBreakModeWordWrap];
    CGRect rect = CGRectMake(139, 48, stringSize.width, stringSize.height);
    namelbl.frame = rect;
    namelbl.text = nameStr;
    line1lbl.frame = CGRectMake(0, stringSize.height+50, 320, 01);
    
    NSString *discr = discrStr;
    CGSize stringSize2 =[discr sizeWithFont: [UIFont boldSystemFontOfSize: 12] constrainedToSize: constraintSize lineBreakMode: UILineBreakModeWordWrap];
    CGRect rect2 = CGRectMake(139, stringSize.height+53, stringSize2.width, stringSize2.height);
    titl2lbl.frame = CGRectMake(9, stringSize.height+53, 113, 21);;
    discrlbl.frame = rect2;
    discrlbl.text = discrStr;
    line2lbl.frame = CGRectMake(0, stringSize.height+stringSize2.height+55, 320, 01);
    
    NSString *dept = deptStr;
    CGSize stringSize3 =[dept sizeWithFont: [UIFont boldSystemFontOfSize: 12] constrainedToSize: constraintSize lineBreakMode: UILineBreakModeWordWrap];
    CGRect rect3 = CGRectMake(139, stringSize.height+stringSize2.height+55, stringSize3.width, stringSize3.height);
    titl3lbl.frame = CGRectMake(9, stringSize.height+stringSize2.height+52, 113, 21);;
    deptlbl.frame = rect3;
    deptlbl.text = deptStr;
    line3lbl.frame = CGRectMake(0, stringSize.height+stringSize2.height+stringSize3.height+55, 320, 01);
//
    NSString *info = infoOwnrStr;
    CGSize stringSize4 =[info sizeWithFont: [UIFont boldSystemFontOfSize: 12] constrainedToSize: constraintSize lineBreakMode: UILineBreakModeWordWrap];
    CGRect rect4 = CGRectMake(139, stringSize.height+stringSize2.height+stringSize3.height+55, stringSize4.width, stringSize4.height);
    titl4lbl.frame = CGRectMake(9, stringSize.height+stringSize2.height+stringSize3.height+52, 113, 21);;
    infoOwnrlbl.frame = rect4;
    infoOwnrlbl.text = infoOwnrStr;
    line4lbl.frame = CGRectMake(0, stringSize.height+stringSize2.height+stringSize3.height+stringSize4.height+55, 320, 01);
//
    NSString *busins = businsAnlystStr;
    CGSize stringSize5 =[busins sizeWithFont: [UIFont boldSystemFontOfSize: 12] constrainedToSize: constraintSize lineBreakMode: UILineBreakModeWordWrap];
    CGRect rect5 = CGRectMake(139, stringSize.height+stringSize2.height+stringSize3.height+stringSize4.height+55, stringSize5.width, stringSize5.height);
    titl5lbl.frame = CGRectMake(9, stringSize.height+stringSize2.height+stringSize3.height+stringSize4.height+52, 113, 21);;
    businsAnlystlbl.frame = rect5;
    businsAnlystlbl.text = businsAnlystStr;
    line5lbl.frame = CGRectMake(0, stringSize.height+stringSize2.height+stringSize3.height+stringSize4.height+stringSize5.height+55, 320, 01);
    
    backlbl.frame = CGRectMake(0,44,131, stringSize.height+stringSize2.height+stringSize3.height+stringSize4.height+stringSize5.height+11);
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
