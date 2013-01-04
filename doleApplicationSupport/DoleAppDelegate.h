//
//  DoleAppDelegate.h
//  doleApplicationSupport
//
//  Created by Rahul kumar on 12/4/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
//#import "SplashViewController.h"
#import <sqlite3.h>
@class DoleViewController;
//@class SplashViewController;
@interface DoleAppDelegate : UIResponder <UIApplicationDelegate,MBProgressHUDDelegate>
{
    MBProgressHUD *HUD;
    NSMutableArray *resultArray;
    BOOL cabbool;
    BOOL shiftbool;
    BOOL supportbool;
    BOOL appbool;
    int returncode;
	sqlite3 *pdb;
	char *sqlstatement;
	char *errormsg;
    
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) DoleViewController *viewController;
//@property (strong, nonatomic) SplashViewController *viewController1;
-(void)loadView;
-(void)cabReportWebCall;
-(void)shiftRosterWebCall;
-(void)supportTeamWebCall;
-(void)appsWebCall;
@end
