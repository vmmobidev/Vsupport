//
//  SettingsViewController.h
//  doleApplicationSupport
//
//  Created by Rahul kumar on 12/4/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DoleAppDelegate.h"
#import "GradientButton.h"

@interface SettingsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    IBOutlet UITableView *dataTable;
    DoleAppDelegate *appDelegate;
    IBOutlet GradientButton    *syncButton;
}
@property (nonatomic, retain) IBOutlet  GradientButton *syncButton;

-(IBAction)sync:(id)sender;

@end
