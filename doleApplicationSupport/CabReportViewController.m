//
//  CabReportViewController.m
//  doleApplicationSupport
//
//  Created by Rahul kumar on 12/4/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import "CabReportViewController.h"
#import "CustomCell.h"
#import "AsyncImageView.h"
#import "Connection.h"
#import "Design.h"
#import "CabReportdetailViewController.h"
#import "Orientation.h"


@interface CabReportViewController ()
//https://mail.google.com/mail/ca/?logout&hl=en&hlor
@end

@implementation CabReportViewController

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
    self.navigationItem.title = @"CAB Report";
//    UIBarButtonItem *mailbutton =[[UIBarButtonItem alloc] initWithCustomView:someButton];
//    self.navigationItem.leftBarButtonItem=mailbutton;
//    
//    CGRect frameimg2 = CGRectMake(100, 0, 40, 40);
//    UIButton *someButton2 = [[UIButton alloc] initWithFrame:frameimg2];
//    [someButton setBackgroundImage:image3 forState:UIControlStateNormal];
//    [someButton addTarget:self action:@selector(deleteFromDataBase)
//         forControlEvents:UIControlEventTouchUpInside];
//    [someButton2 setShowsTouchWhenHighlighted:YES];
   
//    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(deleteFromDataBase)];
//    self.navigationItem.rightBarButtonItem = backButton;
    //UIBarButtonItem *mailbutton2 =[[UIBarButtonItem alloc] initWithCustomView:someButton2];
    //self.navigationItem.rightBarButtonItem=mailbutton2;
    [self.navigationController setNavigationBarHidden:NO];
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
    //[Design createActivityIndicatorStart:self];
//    NSString *url = @"http://mobiappsupport.apphb.com/Cabreport";
//    Connection *connection = [[Connection alloc] init];
//	[connection setDelegate:self];
//	[connection getMethod:url ];
    
//    NSString *docsDir;
//	NSArray *dirPaths;
//	
//	// Get the documents directory
//	dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//	
//	docsDir = [dirPaths objectAtIndex:0];
//	array=[[NSMutableArray alloc]initWithObjects:nil];
//	// Build the path to the database file
//	databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"cabreport.db"]];
//	NSLog(@"%@",databasePath);
//	NSFileManager *fn=[NSFileManager defaultManager];
//	NSError *error;
//	BOOL success=[fn fileExistsAtPath:databasePath];
//	
//	if(!success) {
// 		NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"cabreport.db"];
//		success = [fn copyItemAtPath:defaultDBPath toPath:databasePath error:&error];
//	}
//  	const char *dbpath = [databasePath UTF8String];
// 	sqlite3_stmt    *statement;
// 	if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK)
//	{
//		NSString *querySQL = [NSString stringWithFormat: @"select * from cabtable"];
// 		const char *query_stmt = [querySQL UTF8String];
// 		if (sqlite3_prepare_v2(contactDB, query_stmt, -1, &statement, NULL) == SQLITE_OK)
//		{
//			while(sqlite3_step(statement) == SQLITE_ROW)
//			{
// 				NSString *email_idField = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement,2)];
//				//NSString *email_idFiel = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement,0)];
// 				[array addObject:email_idField];
//				//[array addObject:email_idFiel];
//			}
//  			NSLog( @"Match found");
// 			//[email_idField release];
//			//[passwordField release];
//			//[zipcodeField release];
//			
//		} else {
//			NSLog(@"match not found");
//		}
//		sqlite3_finalize(statement);
//	}
//	sqlite3_close(contactDB);
      // Do any additional setup after loading the view from its nib.
}

//- (id) init
//{
//    self = [super init];
//    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(orientationChanged:)
//                                                 name:UIDeviceOrientationDidChangeNotification
//                                               object:nil];
//    return self;
//}
- (void) orientationChanged: (id) notification
{
    UIDeviceOrientation newIO = [[UIDevice currentDevice] orientation];
    NSLog(@"UIDevice notification, new orientation: %i [%@]", newIO, NSStringFromUIDeviceOrientation(newIO));
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
	NSString *dbPath = [documentsDir stringByAppendingPathComponent:@"cabreport.db"];
 	BOOL success =[fileManager fileExistsAtPath:dbPath];
	if(success)
		NSLog(@"\ndatabase is exist in the path");
	else
	{
		NSLog(@"\ndatabase not able to open");
		NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"cabreport.db"];
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
     sqlstatement="select Id,CreatedBy,DateCreated,DateModified,ModifiedBy,audit,department,description,heatTicketId,implementationDate,isFrozen,isNewSubmission,redmineTicketId,responsiblePerson,risk,scheduledDate,status,weekEnding from cabtable";
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
				//[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 3)] forKey:@"Id"];
//                
                 [dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt,4)] forKey:@"ModifiedBy"];
				NSLog(@"detailviewdata22");
				[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 5)] forKey:@"audit"];
				NSLog(@"detailviewdata23");
				[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 6)] forKey:@"department"];
				NSLog(@"detailviewdata24");
				[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 7)] forKey:@"description"];
               [dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt,8)] forKey:@"heatTicketId"];
				NSLog(@"detailviewdata22");
				[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 9)] forKey:@"implementationDate"];
				//NSLog(@"detailviewdata23");
				[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 10)] forKey:@"isFrozen"];
				//NSLog(@"detailviewdata24");
				[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 11)] forKey:@"isNewSubmission"];
                [dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt,12)] forKey:@"redmineTicketId"];
				NSLog(@"detailviewdata22");
				[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 13)] forKey:@"responsiblePerson"];
				NSLog(@"detailviewdata23");
				[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 14)] forKey:@"risk"];
				NSLog(@"detailviewdata24");
				[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 15)] forKey:@"scheduledDate"];
                [dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt,16)] forKey:@"status"];
				NSLog(@"detailviewdata22");
				[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 17)] forKey:@"weekEnding"];
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
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(orientationChanged:)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil];

 }



-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)getResult:(id)_result{
    [Design createActivityIndicatorFinish:self];
    //    [indicator stopAnimating];
    //    indicator.alpha = 0;
    dataArray = [[NSMutableArray alloc] init];
    NSLog(@"this is array %@",_result);
    dataArray = [_result copy];
 
    [dataTable reloadData];
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
    CustomCell *cell = (CustomCell *)[dataTable dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        NSArray* nib = [[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:self options:nil];
        cell =(CustomCell *)[nib objectAtIndex:0];
        //    UITableViewCell *cell = [dataTable dequeueReusableCellWithIdentifier:CellIdentifier];
        //    if (cell == nil) {
        // cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        cell.tktLble.highlightedTextColor = [UIColor whiteColor];
        cell.subLble.highlightedTextColor = [UIColor whiteColor];
        cell.detailLble.highlightedTextColor = [UIColor whiteColor];
        cell.dateLble.highlightedTextColor = [UIColor whiteColor];
        //[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        AsyncImageView *iconImgView=[[AsyncImageView alloc]init];
		[iconImgView setFrame:CGRectMake(05, 0, 50, 50)];
		[iconImgView setBackgroundColor:[UIColor clearColor]];
		[iconImgView setTag:20];
		[cell.contentView addSubview:iconImgView];
        
    }
    AsyncImageView *iconImgView=(AsyncImageView*)[cell.contentView viewWithTag:20];
    [iconImgView setWidth:50];
    NSString *tktstr =[[dataArray objectAtIndex:indexPath.row] objectForKey:@"heatTicketId"];
    cell.tktLble.text = [NSString stringWithFormat:@"Heat Ticket #%@",tktstr];
    cell.subLble.text = [[dataArray objectAtIndex:indexPath.row] objectForKey:@"responsiblePerson"];
    cell.detailLble.text = [[dataArray objectAtIndex:indexPath.row] objectForKey:@"description"];
    
    id displayDate = [[dataArray objectAtIndex:indexPath.row] objectForKey:@"scheduledDate"];
    NSString *dtrstr = @"";
    if (displayDate != [NSNull null])
        dtrstr = (NSString *)displayDate;
    
    NSString *dateAsString = dtrstr;
    dateAsString = [dateAsString stringByReplacingOccurrencesOfString:@"/Date("withString:@""];
    dateAsString = [dateAsString stringByReplacingOccurrencesOfString:@"+0000)/"withString:@""];
    unsigned long long milliseconds = [dateAsString longLongValue];
    NSTimeInterval interval = milliseconds/1000;
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd-MMM-yyyy"];
    if ([[dateFormat stringFromDate:date] isEqual:@"01-Jan-1970"]) {
        cell.dateLble.text = @"";
    }
    else{
    cell.dateLble.text = [dateFormat stringFromDate:date];
    }
    
    id displayNameTypeValue = [[dataArray objectAtIndex:indexPath.row] objectForKey:@"status"];
    NSString *displayNameType = @"";
    if (displayNameTypeValue != [NSNull null])
        displayNameType = (NSString *)displayNameTypeValue;
     
    if ([displayNameType isEqualToString:@"On hold. CAB needs further explanation. "]) {
        //cell.colrLble.backgroundColor = [UIColor redColor];
        cell.iconImage.image = [UIImage imageNamed:@"redFlag.png"];
    }
    else if ([displayNameType isEqualToString:@"On target."]){
        //cell.colrLble.backgroundColor = [UIColor yellowColor];
        cell.iconImage.image = [UIImage imageNamed:@"yellowFlag.png"];
    }
    else{
        //cell.colrLble.backgroundColor = [UIColor greenColor];
        cell.iconImage.image = [UIImage imageNamed:@"greenFlag.png"];
    }
    // cell.backgroundColor = [UIColor clearColor];
    //NSLog(@"Image is %@",[[array objectAtIndex:indexPath.row] objectForKey:@"id"]);
    // [iconImgView loadImageFromURL:[NSURL URLWithString: [[array objectAtIndex:indexPath.row] valueForKey:@"category_image"]]];
         
   // }
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CabReportdetailViewController *dtl = [[CabReportdetailViewController alloc] initWithNibName:@"CabReportdetailViewController" bundle:nil];
    [dtl setDtlStr:[[dataArray objectAtIndex:indexPath.row] objectForKey:@"description"]];
    NSString *tktstr = [[dataArray objectAtIndex:indexPath.row] objectForKey:@"heatTicketId"];
    [dtl setTktStr:tktstr];
    [dtl setRedmineStr:[NSString stringWithFormat:@"%@_VM%d",tktstr,indexPath.row+1]];
    [dtl setResponStr:[[dataArray objectAtIndex:indexPath.row] objectForKey:@"responsiblePerson"]];
    [dtl setRiskStr:[[dataArray objectAtIndex:indexPath.row] objectForKey:@"risk"]];
    id displayNameTypeValue = [[dataArray objectAtIndex:indexPath.row] objectForKey:@"status"];
    NSString *displayNameType = @"";
    if (displayNameTypeValue != [NSNull null])
        displayNameType = (NSString *)displayNameTypeValue;
    //[dtl setDteStr:[[dataArray objectAtIndex:indexPath.row] objectForKey:@"scheduledDate"]];
    [dtl setStatusStr:displayNameType];
    [self.navigationController pushViewController:dtl animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 67;
}

//- (NSDate*) getDateFromJSON:(NSString *)dateString
//{
//    // Expect date in this format "/Date(1268123281843)/"
//    int startPos = [dateString rangeOfString:@"("].location+1;
//    int endPos = [dateString rangeOfString:@")"].location;
//    NSRange range = NSMakeRange(startPos,endPos-startPos);
//    unsigned long long milliseconds = [[dateString substringWithRange:range] longLongValue];
//    NSLog(@"%llu",milliseconds);
//    NSTimeInterval interval = milliseconds/1000;
//    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
//    
//    return [NSDate dateWithTimeIntervalSince1970:interval];
//}

-(void) deleteFromDataBase
{
	int returncode;
	sqlite3 *pdb;
	char *sqlstatement;
    //	char *errormsg;
 	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSLog(@"paths %@\n documentsDirectory %@",paths,documentsDirectory);
	
	NSString *dbPath = [[NSString alloc] initWithString: [documentsDirectory stringByAppendingPathComponent:@"cabreport.db"]];
 	returncode=sqlite3_open([dbPath UTF8String],&pdb);
	if(returncode==SQLITE_OK)
	{
        NSLog(@"\ndatabase opened");
		static sqlite3_stmt *deleteStmt=nil;
		if(deleteStmt == nil) {
			sqlstatement = "delete from cabtable";
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

- (void) willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)orientation duration:(NSTimeInterval)duration {
    //NSLog(@"orientation: %@",orientation);
    NSArray* visibleCells = [dataTable indexPathsForVisibleRows];
    [dataTable reloadRowsAtIndexPaths:visibleCells withRowAnimation:NO];
}

//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
//{
//    if (interfaceOrientation == UIInterfaceOrientationPortrait) {
//        [self.navigationController.view setFrame:CGRectMake(0, 0, 320 , 480)];
//    }
//    if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
//        [self.view setFrame:CGRectMake(0, 0, 320 , 480)];
//        CGAffineTransform landscapeTransform = CGAffineTransformMakeRotation(0);
//        landscapeTransform = CGAffineTransformTranslate( landscapeTransform, +90.0, +90.0 );
//        [self.view setTransform:landscapeTransform];
//        
//        //        [scoll setFrame:CGRectMake(0, 0, 480 , 320)];
//    }
//    return YES;}

@end
