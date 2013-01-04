//
//  DashBoardViewController.m
//  doleApplicationSupport
//
//  Created by Rahul kumar on 12/4/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import "DashBoardViewController.h"
#import "DoleViewController.h"
#import "CabReportViewController.h"
#import "ShiftRosterViewController.h"
#import "SupportTeamViewController.h"
#import "AppsViewController.h"
#import "SettingsViewController.h"
#import "EmergenyContactViewController.h"
#import "AboutViewController.h"
#import "WeeklyStatusViewController.h"

@interface DashBoardViewController ()

@end

@implementation DashBoardViewController

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
    appDelegate = (DoleAppDelegate *)[[UIApplication sharedApplication]delegate];
    [appDelegate cabReportWebCall];
   // scoll.contentSize = CGSizeMake(320, 500);
   
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES];
}

-(IBAction)logout:(id)sender{
    [[NSUserDefaults standardUserDefaults]setObject:@"off" forKey:@"switch"];
    [[NSUserDefaults standardUserDefaults]synchronize];
   // DoleViewController *dol = [[DoleViewController alloc] initWithNibName:@"DoleViewController" bundle:nil];
    [self.navigationController popViewControllerAnimated:YES];
    
}


-(IBAction)cabreport:(id)sender{
    CabReportViewController *dol = [[CabReportViewController alloc] initWithNibName:@"CabReportViewController" bundle:nil];
    [self.navigationController pushViewController:dol animated:YES];
}
 
-(IBAction)shiftroster:(id)sender{
    ShiftRosterViewController *dol = [[ShiftRosterViewController alloc] initWithNibName:@"ShiftRosterViewController" bundle:nil];
    [self.navigationController pushViewController:dol animated:YES];

}
-(IBAction)supportteam:(id)sender{
    SupportTeamViewController *dol = [[SupportTeamViewController alloc] initWithNibName:@"SupportTeamViewController" bundle:nil];
    [self.navigationController pushViewController:dol animated:YES];

}
-(IBAction)apps:(id)sender{
    AppsViewController *dol = [[AppsViewController alloc] initWithNibName:@"AppsViewController" bundle:nil];
    [self.navigationController pushViewController:dol animated:YES];

}
-(IBAction)settings:(id)sender{
    SettingsViewController *dol = [[SettingsViewController alloc] initWithNibName:@"SettingsViewController" bundle:nil];
    [self.navigationController pushViewController:dol animated:YES];

}
-(IBAction)emergency:(id)sender{
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Emergency Icon Clicked" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//    [alert show];
    EmergenyContactViewController *dol = [[EmergenyContactViewController alloc] initWithNibName:@"EmergenyContactViewController" bundle:nil];
    [self.navigationController pushViewController:dol animated:YES];

}
-(IBAction)about:(id)sender{
    AboutViewController *dol = [[AboutViewController alloc] initWithNibName:@"AboutViewController" bundle:nil];
    [self.navigationController pushViewController:dol animated:YES];

}
-(IBAction)weeklystatus:(id)sender{
    WeeklyStatusViewController *dol = [[WeeklyStatusViewController alloc] initWithNibName:@"WeeklyStatusViewController" bundle:nil];
    [self.navigationController pushViewController:dol animated:YES];

}


- (void)viewDidUnload
{
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
//{
//    if (interfaceOrientation == UIInterfaceOrientationPortrait) {
//        [self.navigationController.view setFrame:CGRectMake(0, 0, 320 , 480)];
//    }
//    if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
//       [self.navigationController.view setFrame:CGRectMake(0, 0, 320 , 480)];
//        CGAffineTransform landscapeTransform = CGAffineTransformMakeRotation(0);
//        landscapeTransform = CGAffineTransformTranslate( landscapeTransform, +90.0, +90.0 );
//        [self.view setTransform:landscapeTransform];
//        
////        [scoll setFrame:CGRectMake(0, 0, 480 , 320)];
//    }
//    return YES;
//}
  
-(void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    CGSize size = frame.size;
    
    NSLog(@"%@", [NSString stringWithFormat:@"Rotation: %s [w=%f, h=%f]",
                  UIInterfaceOrientationIsPortrait(self.interfaceOrientation) ? "Portrait" : "Landscape",
                  size.width, size.height]);
}

@end
