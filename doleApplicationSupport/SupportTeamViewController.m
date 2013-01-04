//
//  SupportTeamViewController.m
//  doleApplicationSupport
//
//  Created by Rahul kumar on 12/4/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import "SupportTeamViewController.h"
#import "Connection.h"
#import "Design.h"
#import "AsyncImageView.h"
#import <QuartzCore/QuartzCore.h>
#import "SupportTeamDetailViewController.h"

@interface SupportTeamViewController ()

@end

@implementation SupportTeamViewController

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
   
    
//    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(deleteFromDataBase)];
//    self.navigationItem.rightBarButtonItem = backButton;
//    UIImage* image3 = [UIImage imageNamed:@"home_blue.png"];
//    CGRect frameimg = CGRectMake(0, 0, 40, 40);
//    UIButton *someButton = [[UIButton alloc] initWithFrame:frameimg];
//    [someButton setBackgroundImage:image3 forState:UIControlStateNormal];
//    [someButton addTarget:self action:@selector(backAction)
//         forControlEvents:UIControlEventTouchUpInside];
//    [someButton setShowsTouchWhenHighlighted:YES];
    self.navigationItem.title = @"Support Team";
//    UIBarButtonItem *mailbutton =[[UIBarButtonItem alloc] initWithCustomView:someButton];
//    self.navigationItem.leftBarButtonItem=mailbutton;
    
    [self.navigationController setNavigationBarHidden:NO];
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
   
   
   }

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
	NSLog(@"in will appear");
	array = [NSMutableArray new];
  	sqlite3 *pdb;
	char *sqlstatement;
	NSError *error;
 	static sqlite3_stmt *addStmt=nil;
 	NSFileManager *fileManager=[NSFileManager defaultManager];
 	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES);
	NSString *documentsDir = [paths objectAtIndex:0];
	NSString *dbPath = [documentsDir stringByAppendingPathComponent:@"supportteam.db"];
 	BOOL success =[fileManager fileExistsAtPath:dbPath];
	if(success)
		NSLog(@"\ndatabase is exist in the path");
	else
	{
		NSLog(@"\ndatabase not able to open");
		NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"supportteam.db"];
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
    sqlstatement="select Id,CreatedBy,DateCreated,DateModified,ModifiedBy,cellphone,city,department,email,firstname,isClient,lastName,managerId,officePhone,picture,reportCount,shortBio,supportPhone,title from supporttable";
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
				[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 5)] forKey:@"cellPhone"];
				NSLog(@"detailviewdata23");
				[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 6)] forKey:@"city"];
				NSLog(@"detailviewdata24");
				[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 7)] forKey:@"department"];
                [dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt,8)] forKey:@"email"];
				NSLog(@"detailviewdata22");
				[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 9)] forKey:@"firstName"];
				//NSLog(@"detailviewdata23");
				[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 10)] forKey:@"isClient"];
				//NSLog(@"detailviewdata24");
				[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 11)] forKey:@"lastName"];
                [dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt,12)] forKey:@"managerId"];
				NSLog(@"detailviewdata22");
				[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 13)] forKey:@"officePhone"];
				NSLog(@"detailviewdata23");
				[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 14)] forKey:@"picture"];
				NSLog(@"detailviewdata24");
				[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 15)] forKey:@"reportCount"];
                [dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt,16)] forKey:@"shortBio"];
				NSLog(@"detailviewdata22");
				[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 17)] forKey:@"supportPhone"];
                [dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 18)] forKey:@"title"];
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


-(void)webCall{
    
    NSString *url = @"http://mobiappsupport.apphb.com/employee";
    Connection *connection = [[Connection alloc] init];
	[connection setDelegate:self];
	[connection getMethod:url ];
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
    //CustomCell2 *cell = (CustomCell2 *)[dataTable dequeueReusableCellWithIdentifier:CellIdentifier];
    UITableViewCell *cell = [dataTable dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
             //    UITableViewCell *cell = [dataTable dequeueReusableCellWithIdentifier:CellIdentifier];
        //    if (cell == nil) {
        // cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        //[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
       
        
        AsyncImageView *iconImgView=[[AsyncImageView alloc]init];
		[iconImgView setFrame:CGRectMake(05, -12, 70, 70)];
		[iconImgView setBackgroundColor:[UIColor clearColor]];
		[iconImgView setTag:20];
		[cell.contentView addSubview:iconImgView];
        
        UILabel *nameLbl= [[UILabel alloc]init];
        nameLbl.frame = CGRectMake(80, 9, 200, 30);
        nameLbl.font = [UIFont boldSystemFontOfSize:12];
        nameLbl.tag = 30;
        nameLbl.highlightedTextColor = [UIColor whiteColor];
        [cell.contentView addSubview:nameLbl];
        
        UILabel *dptLbl= [[UILabel alloc]init];
        dptLbl.frame = CGRectMake(80, 34, 200, 30);
        dptLbl.font = [UIFont boldSystemFontOfSize:12];
        dptLbl.tag = 40;
        dptLbl.textColor = [UIColor lightGrayColor];
        dptLbl.highlightedTextColor = [UIColor whiteColor];
        [cell.contentView addSubview:dptLbl];
        
        UILabel *nameLbl1= [[UILabel alloc]init];
        nameLbl1.frame = CGRectMake(0, 70, 320, 01);
        nameLbl1.font = [UIFont boldSystemFontOfSize:12];
        nameLbl1.tag = 30;
        nameLbl1.backgroundColor = [UIColor lightGrayColor];
        [cell.contentView addSubview:nameLbl1];
        
        /*UILabel *cntLbl= [[UILabel alloc]init];
        cntLbl.frame = CGRectMake(280, 27, 20, 20);
        cntLbl.font = [UIFont boldSystemFontOfSize:12];
        cntLbl.backgroundColor = [UIColor grayColor];
        cntLbl.textColor = [UIColor whiteColor];
        cntLbl.textAlignment = UITextAlignmentCenter;
        cntLbl.shadowColor = [UIColor blackColor];
        cntLbl.layer.cornerRadius = 8;
        cntLbl.tag = 50;
        [cell.contentView addSubview:cntLbl];*/
        
        
        
    }
    AsyncImageView *iconImgView=(AsyncImageView*)[cell.contentView viewWithTag:20];
    [iconImgView setWidth:60];
    [iconImgView loadImageFromURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://mobiappsupport.apphb.com/employee/picture/%@",[[dataArray objectAtIndex:indexPath.row] valueForKey:@"picture"]]]];
    UILabel *nameLbl = (UILabel *)[cell.contentView viewWithTag:30];
    nameLbl.text = [NSString stringWithFormat:@"%@ %@",[[dataArray objectAtIndex:indexPath.row] objectForKey:@"firstName"],[[dataArray objectAtIndex:indexPath.row] objectForKey:@"lastName"]];
    
    UILabel *dptLbl = (UILabel *)[cell.contentView viewWithTag:40];
    dptLbl.text = [[dataArray objectAtIndex:indexPath.row] objectForKey:@"title"];
    //UILabel *cntLbl = (UILabel *)[cell.contentView viewWithTag:50];
   // int cnt = [[[dataArray objectAtIndex:indexPath.row] objectForKey:@"reportCount"] intValue];
   // cntLbl.text = [NSString stringWithFormat:@"%d",cnt];
    
        
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SupportTeamDetailViewController *suprt = [[SupportTeamDetailViewController alloc]initWithNibName:@"SupportTeamDetailViewController" bundle:nil];
    [suprt setImageStr:[[dataArray objectAtIndex:indexPath.row] valueForKey:@"picture"]];
    [suprt setNameStr:[NSString stringWithFormat:@"%@ %@",[[dataArray objectAtIndex:indexPath.row] objectForKey:@"firstName"],[[dataArray objectAtIndex:indexPath.row] objectForKey:@"lastName"]]];
    [suprt setDegigStr:[[dataArray objectAtIndex:indexPath.row] valueForKey:@"title"]];
    [suprt setCtyStr:[[dataArray objectAtIndex:indexPath.row] valueForKey:@"city"]];
    [suprt setBioStr:[[dataArray objectAtIndex:indexPath.row] valueForKey:@"shortBio"]];
    [suprt setPhoneStr:[[dataArray objectAtIndex:indexPath.row] valueForKey:@"cellPhone"]];
    [suprt setOphnStr:[[dataArray objectAtIndex:indexPath.row] valueForKey:@"officePhone"]];
    [suprt setSmsStr:[[dataArray objectAtIndex:indexPath.row] valueForKey:@"supportPhone"]];
    [suprt setEmailStr:[[dataArray objectAtIndex:indexPath.row] valueForKey:@"email"]];
    [suprt setReprtMngrStr:[[dataArray objectAtIndex:indexPath.row] valueForKey:@"managerId"]];
    [self.navigationController pushViewController:suprt animated:YES];
    
    //[self.navigationController pushViewController:srch animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void) deleteFromDataBase
{
	int returncode;
	sqlite3 *pdb;
	char *sqlstatement;
    //	char *errormsg;
 	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSLog(@"paths %@\n documentsDirectory %@",paths,documentsDirectory);
	
	NSString *dbPath = [[NSString alloc] initWithString: [documentsDirectory stringByAppendingPathComponent:@"supportteam.db"]];
 	returncode=sqlite3_open([dbPath UTF8String],&pdb);
	if(returncode==SQLITE_OK)
	{
        NSLog(@"\ndatabase opened");
		static sqlite3_stmt *deleteStmt=nil;
		if(deleteStmt == nil) {
			sqlstatement = "delete from supporttable";
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



//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
//{
//    return (interfaceOrientation == UIInterfaceOrientationPortrait);
//}

@end
