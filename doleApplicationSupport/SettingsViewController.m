//
//  SettingsViewController.m
//  doleApplicationSupport
//
//  Created by Rahul kumar on 12/4/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController
@synthesize syncButton;

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
//    UIImage* image3 = [UIImage imageNamed:@"home_blue.png"];
//    CGRect frameimg = CGRectMake(0, 0, 40, 40);
//    UIButton *someButton = [[UIButton alloc] initWithFrame:frameimg];
//    [someButton setBackgroundImage:image3 forState:UIControlStateNormal];
//    [someButton addTarget:self action:@selector(backAction)
//         forControlEvents:UIControlEventTouchUpInside];
//    [someButton setShowsTouchWhenHighlighted:YES];
    self.navigationItem.title = @"Settings";
    //[syncButton useAlertStyle];
//    UIBarButtonItem *mailbutton =[[UIBarButtonItem alloc] initWithCustomView:someButton];
//    self.navigationItem.leftBarButtonItem=mailbutton;
    [self.navigationController setNavigationBarHidden:NO];
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
    // Do any additional setup after loading the view from its nib.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [dataTable dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
       // cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        
//        UILabel *nameLbl= [[UILabel alloc]init];
//        nameLbl.frame = CGRectMake(0, 44, 320, 01);
//        nameLbl.font = [UIFont boldSystemFontOfSize:12];
//        nameLbl.tag = 30;
//        nameLbl.backgroundColor = [UIColor lightGrayColor];
//        [cell.contentView addSubview:nameLbl];
        
        UILabel *dptLbl= [[UILabel alloc]init];
        dptLbl.frame = CGRectMake(05, 05, 100, 30);
        dptLbl.backgroundColor = [UIColor clearColor];
        dptLbl.font = [UIFont boldSystemFontOfSize:15];
        dptLbl.tag = 40;
        dptLbl.highlightedTextColor = [UIColor whiteColor];
        [cell.contentView addSubview:dptLbl];
        
        syncButton = [[GradientButton alloc]init];//[UIButton buttonWithType:UIButtonTypeRoundedRect];
        syncButton.frame = CGRectMake(216.3, 04, 80, 35);
        syncButton.tag = 30;
        //[];
        [syncButton addTarget:self action:@selector(sync:) forControlEvents:UIControlEventTouchUpInside];
        [syncButton useAlertStyle];
        [syncButton setTitle:@"Sync" forState:UIControlStateNormal];
        [cell.contentView addSubview:syncButton];
        
        //        UILabel *cntLbl= [[UILabel alloc]init];
        //        cntLbl.frame = CGRectMake(280, 27, 20, 20);
        //        cntLbl.font = [UIFont boldSystemFontOfSize:12];
        //        cntLbl.backgroundColor = [UIColor grayColor];
        //        cntLbl.textColor = [UIColor whiteColor];
        //        cntLbl.textAlignment = UITextAlignmentCenter;
        //        cntLbl.shadowColor = [UIColor blackColor];
        //        cntLbl.layer.cornerRadius = 8;
        //        cntLbl.tag = 50;
        //        [cell.contentView addSubview:cntLbl];
        
        
        
    }
    UILabel *dptLbl = (UILabel *)[cell.contentView viewWithTag:40];
     dptLbl.text = @"Sync Data";
    return cell;
    
}


-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)sync:(id)sender{
    appDelegate = (DoleAppDelegate *)[[UIApplication sharedApplication]delegate];
    [appDelegate cabReportWebCall];
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
