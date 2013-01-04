//
//  ShiftRosterViewController.m
//  doleApplicationSupport
//
//  Created by Rahul kumar on 12/4/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import "ShiftRosterViewController.h"
#import "CustomCell2.h"
#import "AsyncImageView.h"
#import "Connection.h"
#import "Design.h"
#import <QuartzCore/QuartzCore.h>

@interface ShiftRosterViewController ()

@end

@implementation ShiftRosterViewController

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
    pstbool = FALSE;
    istbool = FALSE;
    estbool = TRUE;
 
    self.navigationItem.title = @"Shift Roster";
//    UIBarButtonItem *mailbutton =[[UIBarButtonItem alloc] initWithCustomView:someButton];
//    self.navigationItem.leftBarButtonItem=mailbutton;
    [self.navigationController setNavigationBarHidden:NO];
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
//    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(deleteFromDataBase)];
//    self.navigationItem.rightBarButtonItem = backButton;
//    UIColor *colorOne = [UIColor colorWithRed:0.0 green:0.125 blue:0.18 alpha:1.0];
//    UIColor *colorTwo = [UIColor colorWithRed:0.0 green:0.00 blue:0.05 alpha:1.0];
//    
//    //Create the gradient and add it to our view's root layer
//    CAGradientLayer *gradientLayer = [[CAGradientLayer alloc] init];
//    gradientLayer.frame = CGRectMake(0.0, 0.0, 320.0, 480.0);
//    [gradientLayer setColors:[NSArray arrayWithObjects:(id)colorOne.CGColor, (id)colorTwo.CGColor, nil]];
//    [self.view.layer insertSublayer:gradientLayer atIndex:0];
    // Do any additional setup after loading the view from its nib.
   // [Design createActivityIndicatorStart:self];
//    NSString *url = @"http://mobiappsupport.apphb.com/shiftroster";
//    Connection *connection = [[Connection alloc] init];
//	[connection setDelegate:self];
//	[connection getMethod:url ];
    self.label.glowColor = self.label.textColor;
    self.label.glowOffset = CGSizeMake(0.0, 0.0);
    self.label.glowAmount = 30.0;
    [NSTimer scheduledTimerWithTimeInterval:05 target:self selector:@selector(adjustGlowAmount:) userInfo:nil repeats:NO];
}

- (IBAction)adjustGlowAmount:(id)sender {
    self.label.glowAmount =100; //self.glowSlider.value;
    [self.label setNeedsDisplay];
}
    
 

-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"in will appear");
	array = [NSMutableArray new];
  	sqlite3 *pdb;
	char *sqlstatement;
	NSError *error;
 	static sqlite3_stmt *addStmt=nil;
 	NSFileManager *fileManager=[NSFileManager defaultManager];
 	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES);
	NSString *documentsDir = [paths objectAtIndex:0];
	NSString *dbPath = [documentsDir stringByAppendingPathComponent:@"shiftroster.db"];
 	BOOL success =[fileManager fileExistsAtPath:dbPath];
	if(success)
		NSLog(@"\ndatabase is exist in the path");
	else
	{
		NSLog(@"\ndatabase not able to open");
		NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"shiftroster.db"];
		success = [fileManager copyItemAtPath:defaultDBPath toPath:dbPath error:&error];
		if (!success)
		{
			NSLog(@"\ndatabase not able to create -error");
			NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
 		}
		else
			NSLog(@"\ndatabase is added to doc dir--- database.db");
 	}
  	int returncode = sqlite3_open([dbPath UTF8String],&pdb);
	if(returncode==SQLITE_OK)
	{
		NSLog(@"db open");
	}
    sqlstatement="select Id,CreatedBy,DateCreated,DateModified,ModifiedBy,shift,supportstaff,timeEST,timeIST,timePST from shift";
    addStmt=nil;
    if(sqlite3_prepare_v2(pdb, sqlstatement, -1, &addStmt, NULL) != SQLITE_OK)
    {
        NSLog(@"inside prepare statement ");
        NSAssert1(0, @"Error while creating add statement. '%s'", sqlite3_errmsg(pdb));
    }
    else
    {
        //sqlite3_bind_int(addStmt,1,i);
        while(sqlite3_step(addStmt) == SQLITE_ROW)
        {
            @try {
                dict = [NSMutableDictionary new];
                [dict setObject:[NSString stringWithFormat:@"%d",sqlite3_column_int(addStmt,0)] forKey:@"Id"];
				[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt,1)] forKey:@"CreatedBy"];
				NSLog(@"detailviewdata22");
				[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 2)] forKey:@"DateCreated"];
				NSLog(@"detailviewdata23");
				[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 3)] forKey:@"DateModified"];
				NSLog(@"detailviewdata24");
                 [dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt,4)] forKey:@"ModifiedBy"];
				NSLog(@"detailviewdata22");
				[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 5)] forKey:@"shift"];
				NSLog(@"detailviewdata23");
				[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 6)] forKey:@"supportStaff"];
				NSLog(@"detailviewdata24");
				[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 7)] forKey:@"timeEST"];
                [dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt,8)] forKey:@"timeIST"];
				NSLog(@"detailviewdata22");
				[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 9)] forKey:@"timePST"];
 				//NSLog(@"detailviewdata23");
                
                [array addObject:dict];
            }
            @catch (NSException *exception) {
                NSLog(@"%@",exception);
            }
            @finally {
                NSLog(@"Finally");
            }
        }
    }
 	NSLog(@"RAAAAARRRRAyy....%@",array);
    dataArray = [array copy];
    [dataTable reloadData];

}











-(void)getResult:(id)_result{
    //    [indicator stopAnimating];
    //    indicator.alpha = 0;
    [Design createActivityIndicatorFinish:self];
    dataArray = [[NSMutableArray alloc] init];
    NSLog(@"this is array %@",_result);
    dataArray = [_result copy];
    
    [dataTable reloadData];
}

-(IBAction)segmentBtnAction:(id)sender{
    switch (self.segmentedControl.selectedSegmentIndex) {
            
        case 0:
            pstbool = FALSE;
            istbool = FALSE;
            estbool = TRUE;
            istLbl.text = @"EST";
            [dataTable reloadData];
           // [self simplSrch:sender];
            break;
            
        case 1:
            pstbool = TRUE;
            istbool = FALSE;
            estbool = FALSE;
            [dataTable reloadData];
            istLbl.text = @"PST";
            //[self advanceSrch:sender];
            break;
        case 2:
            pstbool = FALSE;
            istbool = TRUE;
            estbool = FALSE;
            istLbl.text = @"IST";
            [dataTable reloadData];
           // [self locationSrch:sender];
            break;
        default:
            
            break;
    }
    
}


-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [dataArray count];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    // dataTable.backgroundColor = [UIColor clearColor];
    CustomCell2 *cell = (CustomCell2 *)[dataTable dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        NSArray* nib = [[NSBundle mainBundle] loadNibNamed:@"CustomCell2" owner:self options:nil];
        cell =(CustomCell2 *)[nib objectAtIndex:0];
       
        //    UITableViewCell *cell = [dataTable dequeueReusableCellWithIdentifier:CellIdentifier];
        //    if (cell == nil) {
        // cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        //[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        AsyncImageView *iconImgView=[[AsyncImageView alloc]init];
		[iconImgView setFrame:CGRectMake(05, 0, 50, 50)];
		[iconImgView setBackgroundColor:[UIColor clearColor]];
		[iconImgView setTag:20];
		[cell.contentView addSubview:iconImgView];
        cell.shiftLbl.highlightedTextColor = [UIColor whiteColor];
        cell.supportLbl.highlightedTextColor = [UIColor whiteColor];
        cell.IStLbl.highlightedTextColor = [UIColor whiteColor];
        
         
    }
    AsyncImageView *iconImgView=(AsyncImageView*)[cell.contentView viewWithTag:20];
    [iconImgView setWidth:50];
    cell.shiftLbl.text = [[dataArray objectAtIndex:indexPath.row] objectForKey:@"shift"];
    cell.supportLbl.text = [[dataArray objectAtIndex:indexPath.row] objectForKey:@"supportStaff"];
    [cell glowAction];
    if (istbool) {
     cell.IStLbl.text = [[dataArray objectAtIndex:indexPath.row] objectForKey:@"timeIST"];
        
        
        [UIView beginAnimations:@"fadeIn" context:nil];
        [UIView setAnimationDuration:2.5];
        cell.IStLbl.alpha = 1;
        
       // self.viewController1.view.alpha = 0;
        [UIView commitAnimations];
    }
    if (pstbool) {
        cell.IStLbl.text = [[dataArray objectAtIndex:indexPath.row] objectForKey:@"timePST"];
//        cell.IStLbl.glowColor = [UIColor redColor];//self.IStLbl.textColor;
//        cell.IStLbl.glowOffset = CGSizeMake(0.0, 0.0);
//        cell.IStLbl.glowAmount = 30.0;
    }
    if (estbool) {
        cell.IStLbl.text = [[dataArray objectAtIndex:indexPath.row] objectForKey:@"timeEST"];
    }
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    //[self.navigationController pushViewController:srch animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 46;
}

-(void) deleteFromDataBase
{
    int returncode;
	sqlite3 *pdb;
	char *sqlstatement;
 	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSLog(@"paths %@\n documentsDirectory %@",paths,documentsDirectory);
	
	NSString *dbPath = [[NSString alloc] initWithString: [documentsDirectory stringByAppendingPathComponent:@"shiftroster.db"]];
 	returncode=sqlite3_open([dbPath UTF8String],&pdb);
	if(returncode==SQLITE_OK)
	{
        NSLog(@"\ndatabase opened");
		static sqlite3_stmt *deleteStmt=nil;
		if(deleteStmt == nil) {
			sqlstatement = "delete from shift";
			if(sqlite3_prepare_v2(pdb, sqlstatement, -1, &deleteStmt, NULL) != SQLITE_OK)
				NSAssert1(0, @"Error while creating delete statement. '%s'", sqlite3_errmsg(pdb));
		}
		
		//When binding parameters, index starts from 1 and not zero.
		//sqlite3_bind_int(deleteStmt, 1);
		
		if (SQLITE_DONE != sqlite3_step(deleteStmt))
			NSAssert1(0, @"Error while deleting. '%s'", sqlite3_errmsg(pdb));
		else
			NSLog(@"deleted");
 		sqlite3_reset(deleteStmt);
    }
	else
		NSLog(@"dataBase not opened");
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
