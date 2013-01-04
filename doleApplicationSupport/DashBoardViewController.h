//
//  DashBoardViewController.h
//  doleApplicationSupport
//
//  Created by Rahul kumar on 12/4/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DoleAppDelegate.h"

@interface DashBoardViewController : UIViewController{
    IBOutlet UIScrollView *scoll;
     DoleAppDelegate *appDelegate;
}
-(IBAction)logout:(id)sender;
-(IBAction)cabreport:(id)sender;
-(IBAction)shiftroster:(id)sender;
-(IBAction)supportteam:(id)sender;
-(IBAction)apps:(id)sender;
-(IBAction)settings:(id)sender;
-(IBAction)emergency:(id)sender;
-(IBAction)about:(id)sender;
-(IBAction)weeklystatus:(id)sender;
 


@end
