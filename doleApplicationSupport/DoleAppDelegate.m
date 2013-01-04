//
//  DoleAppDelegate.m
//  doleApplicationSupport
//
//  Created by Rahul kumar on 12/4/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import "DoleAppDelegate.h"
#import "Connection.h"
#import "DoleViewController.h"
#import "Design.h"


@implementation DoleAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //[NSThread sleepForTimeInterval:5.0];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    //self.viewController1 = [[SplashViewController alloc] initWithNibName:@"SplashViewController" bundle:nil];
   //UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:self.viewController1];
//    //[self.window addSubview:navigationController.view];
    //self.window.rootViewController = navigationController;
    //self.window.rootViewController = self.viewController;
//    HUD = [[MBProgressHUD alloc] initWithView:self.window];
//	[self.window addSubview:HUD];
//	
//	HUD.delegate = self;
//	HUD.labelText = @"Loading";
//	HUD.detailsLabelText = @"updating data";
//	HUD.square = YES;
    [self.window makeKeyAndVisible];
    NSStringEncoding enc;
    NSError *error;
    NSString *connected = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://www.google.com"] usedEncoding:&enc error:&error];
    if (connected == nil) {
        NSString * infoString = [NSString stringWithFormat:@"Switching to Offline Mode Do Mannual Sync from Settings,once Network connection is Restored."];
        UIAlertView * infoAlert = [[UIAlertView alloc] initWithTitle:@"Network Connection Failed" message:infoString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [infoAlert show];
        [self loadView];
    } else {
        
        [self loadView];
        //[self cabReportWebCall];
    }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
//    NSStringEncoding enc;
//    NSError *error;
//    NSString *connected = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://www.google.com"] usedEncoding:&enc error:&error];
//    if (connected == nil) {
//        NSString * infoString = [NSString stringWithFormat:@"Switching to Offline Mode Do Mannual Sync from Settings,once Network connection is Restored."];
//        UIAlertView * infoAlert = [[UIAlertView alloc] initWithTitle:@"Network Connection Failed" message:infoString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//        [infoAlert show];
//        [self loadView];
//    } else {
//
//    
//    [self cabReportWebCall];
//    }
    
    //[self shiftRosterWebCall];
   // [Design createActivityIndicatorStart:self];
//    NSString *url = @"http://mobiappsupport.apphb.com/Cabreport";
//    Connection *connection = [[Connection alloc] init];
//	[connection setDelegate:self];
//	[connection getMethod:url ];
//    HUD = [[MBProgressHUD alloc] initWithView:self.window];
//	[self.window addSubview:HUD];
//	
//	HUD.delegate = self;
//	HUD.labelText = @"cabreport Updating...";
//	//HUD.detailsLabelText = @"updating data";
//	HUD.square = YES;
//	//HUD = [MBProgressHUD showHUDAddedTo:self.window animated:YES];
// 
//	[HUD showWhileExecuting:@selector(myTask) onTarget:self withObject:nil animated:YES];
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

-(void)cabReportWebCall{
    cabbool = TRUE;
    shiftbool = FALSE;
    supportbool = FALSE;
    appbool = FALSE;
    NSString *url = @"http://mobiappsupport.apphb.com/Cabreport";
    Connection *connection = [[Connection alloc] init];
	[connection setDelegate:self];
	[connection getMethod:url ];
    HUD = [[MBProgressHUD alloc] initWithView:self.window];
	[self.window addSubview:HUD];
	
	HUD.delegate = self;
	HUD.labelText = @"Updating Cab Report...";
	//HUD.detailsLabelText = @"updating data";
	HUD.square = YES;
	//HUD = [MBProgressHUD showHUDAddedTo:self.window animated:YES];
    
	[HUD showWhileExecuting:@selector(myTask) onTarget:self withObject:nil animated:YES];
}





-(void)shiftRosterWebCall{
    cabbool = FALSE;
    shiftbool = TRUE;
    supportbool = FALSE;
    appbool = FALSE;
    NSString *url = @"http://mobiappsupport.apphb.com/shiftroster";
    Connection *connection = [[Connection alloc] init];
	[connection setDelegate:self];
	[connection getMethod:url ];
    HUD = [[MBProgressHUD alloc] initWithView:self.window];
	[self.window addSubview:HUD];
	
	HUD.delegate = self;
	HUD.labelText = @"Updating Shift Roster...";
	//HUD.detailsLabelText = @"updating data";
	HUD.square = YES;
	//HUD = [MBProgressHUD showHUDAddedTo:self.window animated:YES];
    
	[HUD showWhileExecuting:@selector(myTask) onTarget:self withObject:nil animated:YES];
}

-(void)supportTeamWebCall{
    cabbool = FALSE;
    shiftbool = FALSE;
    supportbool = TRUE;
    appbool = FALSE;
    NSString *url = @"http://mobiappsupport.apphb.com/employee";
    Connection *connection = [[Connection alloc] init];
	[connection setDelegate:self];
	[connection getMethod:url ];
    HUD = [[MBProgressHUD alloc] initWithView:self.window];
	[self.window addSubview:HUD];
	
	HUD.delegate = self;
	HUD.labelText = @"Updating Team Info...";
	//HUD.detailsLabelText = @"updating data";
	HUD.square = YES;
	//HUD = [MBProgressHUD showHUDAddedTo:self.window animated:YES];
    
	[HUD showWhileExecuting:@selector(myTask) onTarget:self withObject:nil animated:YES];
}

-(void)appsWebCall{
    cabbool = FALSE;
    shiftbool = FALSE;
    supportbool = FALSE;
    appbool = TRUE;
    NSString *url = @"http://mobiappsupport.apphb.com/Application";
    Connection *connection = [[Connection alloc] init];
	[connection setDelegate:self];
	[connection getMethod:url ];
    HUD = [[MBProgressHUD alloc] initWithView:self.window];
	[self.window addSubview:HUD];
	
	HUD.delegate = self;
	HUD.labelText = @"Updating App Info...";
	//HUD.detailsLabelText = @"updating data";
	HUD.square = YES;
	//HUD = [MBProgressHUD showHUDAddedTo:self.window animated:YES];
    
	[HUD showWhileExecuting:@selector(myTask) onTarget:self withObject:nil animated:YES];
}



-(void)getResult:(id)_result{
    resultArray = [[NSMutableArray alloc]init];
    
    
    
    if (appbool) {
        [HUD hide:YES];
        resultArray = [_result copy];
        NSLog(@"this is Apparray %@",_result);
        [self addToAppDatabese];
        //[self loadView];
    }
    if (supportbool) {
        [HUD hide:YES];
        NSLog(@"this is supportarray %@",_result);
        resultArray = [_result copy];
        [self addTosupportteam];
        [self appsWebCall];
    }
    if (shiftbool) {
        [HUD hide:YES];
        resultArray = [_result copy];
        NSLog(@"this is shiftarray %@",resultArray);
        [self addToShiftroster];
        [self supportTeamWebCall];
    }
    if (cabbool) {
        resultArray = [_result copy];
        //[self loadView];
        [self addToDatabase];
        [HUD hide:YES];
        NSLog(@"this is cabarray %@",_result);
        [self shiftRosterWebCall];
    }
    //[self.viewController1 removeFromParentViewController];
    // [Design createActivityIndicatorFinish:self];
    //    [indicator stopAnimating];
    //    indicator.alpha = 0;
    
}


- (void)myTask {
   
    
	// Do something usefull in here instead of sleeping ...
   sleep(10000);
    // [self secondView];
}
- (void)myTask2 {
	// Do something usefull in here instead of sleeping ...
	sleep(3);
    [self secondView2];
}

- (void)myTask3 {
	// Do something usefull in here instead of sleeping ...
	sleep(4);
}

-(void)secondView{
    HUD = [[MBProgressHUD alloc] initWithView:self.window];
	[self.window addSubview:HUD];
	
	HUD.delegate = self;

	HUD.labelText = @"supportteam Updating...";
	//HUD.detailsLabelText = @"updating data";
	HUD.square = YES;
	
	[HUD showWhileExecuting:@selector(myTask2) onTarget:self withObject:nil animated:YES];
    
}
-(void)secondView2{
    HUD = [[MBProgressHUD alloc] initWithView:self.window];
	[self.window addSubview:HUD];
	
	HUD.delegate = self;
	HUD.labelText = @"apps Updating...";
	//HUD.detailsLabelText = @"updating data";
	HUD.square = YES;
	
	[HUD showWhileExecuting:@selector(myTask3) onTarget:self withObject:nil animated:YES];
    
}


-(void)loadView{
    self.viewController = [[DoleViewController alloc] initWithNibName:@"DoleViewController" bundle:nil];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:self.viewController];
    //[self.window addSubview:navigationController.view];
        
    [UIView beginAnimations:@"fadeIn" context:nil];
    [UIView setAnimationDuration:1.5];
   // self.viewController1.view.alpha = 0;
    [UIView commitAnimations];
    self.window.rootViewController = navigationController;
    //navController.navigationBar.tintColor = [UIColor blackColor];
   // [self.window insertSubview:navigationController.view belowSubview:self.viewController1.view];


}



-(IBAction)addToDatabase
{
 
 	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	//NSLog(@"paths %@\n documentsDirectory %@",paths,documentsDirectory);
 	NSString *dbPath = [[NSString alloc] initWithString: [documentsDirectory stringByAppendingPathComponent:@"cabreport.db"]];
 	returncode=sqlite3_open([dbPath UTF8String],&pdb);
	if(returncode==SQLITE_OK)
	{
 		NSLog(@"\ndatabase opened");
         sqlstatement="CREATE TABLE IF NOT EXISTS cabtable(Id INTEGER PRIMARY KEY,CreatedBy varchar,DateCreated varchar,DateModified varchar,ModifiedBy varchar,audit varchar,department varchar,description varchar,heatTicketId varchar,implementationDate varchar,isFrozen varchar,isNewSubmission varchar,redmineTicketId varchar,responsiblePerson varchar,risk varchar,scheduledDate varchar,status varchar,weekEnding varchar)";
		/// this will open the table if already exists. else it will create the table with the same name and open
		returncode = sqlite3_exec(pdb,sqlstatement,NULL,NULL,&errormsg);
		if(returncode==SQLITE_OK)
		{
            [self deleteCabFromDataBase];
            for (int i=0; i<[resultArray count]; i++) {
                NSLog(@"TABLE EXIST/open");
                
                sqlstatement = "insert into cabtable(Id,CreatedBy,DateCreated,DateModified,ModifiedBy,audit,department,description,heatTicketId,implementationDate,isFrozen,isNewSubmission,redmineTicketId,responsiblePerson,risk,scheduledDate,status,weekEnding)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                static sqlite3_stmt *addStmt=nil;//this is the full statement tat want to execute
                if(sqlite3_prepare_v2(pdb, sqlstatement, -1, &addStmt, NULL) != SQLITE_OK)//this is the prepare statement adding requst to the addStmt
                {
                    NSLog(@"not able to prepare the statement ");
                    NSAssert1(0, @"Error while creating add statement. '%s'", sqlite3_errmsg(pdb));
                    
                }
                else
                {
                    
                    NSLog(@"statement prepared successfully");
                    int idr = [[[resultArray objectAtIndex:i] objectForKey:@"Id"] intValue];
                    sqlite3_bind_int(addStmt, 1, idr);
                    int crtd = [[[resultArray objectAtIndex:i] objectForKey:@"CreatedBy"] intValue];
                    NSString *crtdStr = [NSString stringWithFormat:@"%d",crtd];
                    sqlite3_bind_text(addStmt, 2,[crtdStr UTF8String], -1, SQLITE_TRANSIENT);
                    sqlite3_bind_text(addStmt, 3,[[[resultArray objectAtIndex:i] objectForKey:@"DateCreated"] UTF8String], -1, SQLITE_TRANSIENT);
                    sqlite3_bind_text(addStmt, 4,[[[resultArray objectAtIndex:i] objectForKey:@"DateModified"] UTF8String], -1, SQLITE_TRANSIENT);
                    
                    int crtd2 = [[[resultArray objectAtIndex:i] objectForKey:@"ModifiedBy"] intValue];
                    NSString *crtdStr2 = [NSString stringWithFormat:@"%d",crtd2];
                    sqlite3_bind_text(addStmt, 5,[crtdStr2 UTF8String], -1, SQLITE_TRANSIENT);
                    
                    id displayDate = [[resultArray objectAtIndex:i] objectForKey:@"audit"];
                    NSString *dtrstr = @"";
                    if (displayDate != [NSNull null])
                        dtrstr = (NSString *)displayDate;
                    sqlite3_bind_text(addStmt, 6,[dtrstr UTF8String], -1, SQLITE_TRANSIENT);
                    
                    id displayDate2 = [[resultArray objectAtIndex:i] objectForKey:@"department"];
                    NSString *dtrstr2 = @"";
                    if (displayDate2 != [NSNull null])
                        dtrstr2 = (NSString *)displayDate2;
                    sqlite3_bind_text(addStmt, 7,[dtrstr2 UTF8String], -1, SQLITE_TRANSIENT);
                    sqlite3_bind_text(addStmt, 8,[[[resultArray objectAtIndex:i] objectForKey:@"description"] UTF8String], -1, SQLITE_TRANSIENT);
                   
                    sqlite3_bind_text(addStmt, 9,[[[resultArray objectAtIndex:i] objectForKey:@"heatTicketId"] UTF8String], -1, SQLITE_TRANSIENT);
                    
                    id displayDate3 = [[resultArray objectAtIndex:i] objectForKey:@"implementationDate"];
                    NSString *dtrstr3 = @"";
                    if (displayDate3 != [NSNull null])
                        dtrstr3 = (NSString *)displayDate3;
                    sqlite3_bind_text(addStmt, 10,[dtrstr3 UTF8String], -1, SQLITE_TRANSIENT);
                    //
                    id fr = [[resultArray objectAtIndex:i] objectForKey:@"isFrozen"];
                    NSString *frStr = [NSString stringWithFormat:@"%@",fr];
                    sqlite3_bind_text(addStmt, 11,[frStr UTF8String], -1, SQLITE_TRANSIENT);
                    
                    int fr2 = [[[resultArray objectAtIndex:i] objectForKey:@"isNewSubmission"] intValue];
                    NSString *fr2Str = [NSString stringWithFormat:@"%d",fr2];
                    sqlite3_bind_text(addStmt, 12,[fr2Str UTF8String], -1, SQLITE_TRANSIENT);
                    //
                    id displayDate4 = [[resultArray objectAtIndex:i] objectForKey:@"redmineTicketId"];
                    NSString *dtrstr4 = @"";
                    if (displayDate4 != [NSNull null])
                        dtrstr4 = (NSString *)displayDate4;
                    sqlite3_bind_text(addStmt, 13,[dtrstr4 UTF8String], -1, SQLITE_TRANSIENT);
                    sqlite3_bind_text(addStmt, 14,[[[resultArray objectAtIndex:i] objectForKey:@"responsiblePerson"] UTF8String], -1, SQLITE_TRANSIENT);
                    id fr3 = [[resultArray objectAtIndex:i] objectForKey:@"risk"];
                    NSString *frStr3 = [NSString stringWithFormat:@"%@",fr3];
                    sqlite3_bind_text(addStmt, 15,[frStr3 UTF8String], -1, SQLITE_TRANSIENT);
                    id fr4 = [[resultArray objectAtIndex:i] objectForKey:@"scheduledDate"];
                    NSString *frStr4 = [NSString stringWithFormat:@"%@",fr4];
                    sqlite3_bind_text(addStmt, 16,[frStr4 UTF8String], -1, SQLITE_TRANSIENT);
                    
                    id fr5 = [[resultArray objectAtIndex:i] objectForKey:@"status"];
                    NSString *frStr5 = [NSString stringWithFormat:@"%@",fr5];
                    
                    sqlite3_bind_text(addStmt, 17,[frStr5 UTF8String], -1, SQLITE_TRANSIENT);
                    id fr6 = [[resultArray objectAtIndex:i] objectForKey:@"weekEnding"];
                    NSString *frStr6 = [NSString stringWithFormat:@"%@",fr6];
                    sqlite3_bind_text(addStmt, 18,[frStr6 UTF8String], -1, SQLITE_TRANSIENT);
                    
                    if(SQLITE_DONE != sqlite3_step(addStmt))// THIS IS THE STATEMENT TO EXECUTE THE QUERY
                    {
                        NSLog(@"\nnot able to insert");
                    }
                    else
                    {
                         NSLog(@"insert into table");
                    }
                }
            }
 		}
		else
			NSLog(@"not able to create/open the table");
 	}
	else
 		NSLog(@"\ndatabase not  opened");
    NSLog(@"added successfully");
	
}
  
-(void)addToShiftroster{
 
 	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	//NSLog(@"paths %@\n documentsDirectory %@",paths,documentsDirectory);
 	NSString *dbPath = [[NSString alloc] initWithString: [documentsDirectory stringByAppendingPathComponent:@"shiftroster.db"]];
 	returncode=sqlite3_open([dbPath UTF8String],&pdb);
	if(returncode==SQLITE_OK)
	{
 		NSLog(@"\ndatabase opened");
         sqlstatement="CREATE TABLE IF NOT EXISTS shift(Id INTEGER PRIMARY KEY,CreatedBy varchar,DateCreated varchar,DateModified varchar,ModifiedBy varchar,shift varchar,supportstaff varchar,timeEST varchar,timeIST varchar,timePST varchar)";
		/// this will open the table if already exists. else it will create the table with the same name and open
		returncode = sqlite3_exec(pdb,sqlstatement,NULL,NULL,&errormsg);
		if(returncode==SQLITE_OK)
		{
            [self deleteShiftFromDataBase];
            for (int i=0; i<[resultArray count]; i++) {
                NSLog(@"TABLE EXIST/open");
                
                sqlstatement = "insert into shift(Id,CreatedBy,DateCreated,DateModified,ModifiedBy,shift,supportstaff,timeEST,timeIST,timePST)values(?,?,?,?,?,?,?,?,?,?)";
                static sqlite3_stmt *addStmt=nil;//this is the full statement tat want to execute
                if(sqlite3_prepare_v2(pdb, sqlstatement, -1, &addStmt, NULL) != SQLITE_OK)//this is the prepare statement adding requst to the addStmt
                {
                    NSLog(@"not able to prepare the statement ");
                    NSAssert1(0, @"Error while creating add statement. '%s'", sqlite3_errmsg(pdb));
                    
                }
                else
                {
                    
                    NSLog(@"statement prepared successfully");
                    int idr = [[[resultArray objectAtIndex:i] objectForKey:@"Id"] intValue];
                    sqlite3_bind_int(addStmt, 1, idr);
                    int crtd = [[[resultArray objectAtIndex:i] objectForKey:@"CreatedBy"] intValue];
                    NSString *crtdStr = [NSString stringWithFormat:@"%d",crtd];
                    sqlite3_bind_text(addStmt, 2,[crtdStr UTF8String], -1, SQLITE_TRANSIENT);
                    sqlite3_bind_text(addStmt, 3,[[[resultArray objectAtIndex:i] objectForKey:@"DateCreated"] UTF8String], -1, SQLITE_TRANSIENT);
                    sqlite3_bind_text(addStmt, 4,[[[resultArray objectAtIndex:i] objectForKey:@"DateModified"] UTF8String], -1, SQLITE_TRANSIENT);
                    int crtd2 = [[[resultArray objectAtIndex:i] objectForKey:@"ModifiedBy"] intValue];
                    NSString *crtdStr2 = [NSString stringWithFormat:@"%d",crtd2];
                    sqlite3_bind_text(addStmt, 5,[crtdStr2 UTF8String], -1, SQLITE_TRANSIENT);
                    
                    id displayDate = [[resultArray objectAtIndex:i] objectForKey:@"shift"];
                    NSString *dtrstr = @"";
                    if (displayDate != [NSNull null])
                        dtrstr = (NSString *)displayDate;
                    sqlite3_bind_text(addStmt, 6,[dtrstr UTF8String], -1, SQLITE_TRANSIENT);
                    
                    id displayDate2 = [[resultArray objectAtIndex:i] objectForKey:@"supportStaff"];
                    NSString *dtrstr2 = @"";
                    if (displayDate2 != [NSNull null])
                        dtrstr2 = (NSString *)displayDate2;
                    sqlite3_bind_text(addStmt, 7,[dtrstr2 UTF8String], -1, SQLITE_TRANSIENT);
                    sqlite3_bind_text(addStmt, 8,[[[resultArray objectAtIndex:i] objectForKey:@"timeEST"] UTF8String], -1, SQLITE_TRANSIENT);
                    sqlite3_bind_text(addStmt, 9,[[[resultArray objectAtIndex:i] objectForKey:@"timeIST"] UTF8String], -1, SQLITE_TRANSIENT);
                    
                    id displayDate3 = [[resultArray objectAtIndex:i] objectForKey:@"timePST"];
                    NSString *dtrstr3 = @"";
                    if (displayDate3 != [NSNull null])
                        dtrstr3 = (NSString *)displayDate3;
                    sqlite3_bind_text(addStmt, 10,[dtrstr3 UTF8String], -1, SQLITE_TRANSIENT);
                     if(SQLITE_DONE != sqlite3_step(addStmt))// THIS IS THE STATEMENT TO EXECUTE THE QUERY
                    {
                        NSLog(@"\nnot able to insert");
                    }
                    else
                    {
                         NSLog(@"shiftrostr inserted into table");
                    }
                }
            }
 		}
		else
			NSLog(@"not able to create/open the table");
 	}
	else
 		NSLog(@"\ndatabase not  opened");
    NSLog(@"added successfully");
    
}

//

-(void)addTosupportteam{
  	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	//NSLog(@"paths %@\n documentsDirectory %@",paths,documentsDirectory);
 	NSString *dbPath = [[NSString alloc] initWithString: [documentsDirectory stringByAppendingPathComponent:@"supportteam.db"]];
 	returncode=sqlite3_open([dbPath UTF8String],&pdb);
	if(returncode==SQLITE_OK)
	{
 		NSLog(@"\ndatabase opened");
         sqlstatement="CREATE TABLE IF NOT EXISTS supporttable(Id INTEGER PRIMARY KEY,CreatedBy varchar,DateCreated varchar,DateModified varchar,ModifiedBy varchar,cellphone varchar,city varchar,department varchar,email varchar,firstname varchar,isClient varchar,lastName varchar,managerId varchar,officePhone varchar,picture varchar,reportCount varchar,shortBio varchar,supportPhone varchar,title varchar)";
		/// this will open the table if already exists. else it will create the table with the same name and open
		returncode = sqlite3_exec(pdb,sqlstatement,NULL,NULL,&errormsg);
		if(returncode==SQLITE_OK)
		{
            [self deleteFromDataBase];
            for (int i=0; i<[resultArray count]; i++) {
                NSLog(@"TABLE EXIST/open");
                
                sqlstatement = "insert into supporttable(Id,CreatedBy,DateCreated,DateModified,ModifiedBy,cellphone,city,department,email,firstname,isClient,lastName,managerId,officePhone,picture,reportCount,shortBio,supportPhone,title)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                static sqlite3_stmt *addStmt=nil;//this is the full statement tat want to execute
                if(sqlite3_prepare_v2(pdb, sqlstatement, -1, &addStmt, NULL) != SQLITE_OK)//this is the prepare statement adding requst to the addStmt
                {
                    NSLog(@"not able to prepare the statement ");
                    NSAssert1(0, @"Error while creating add statement. '%s'", sqlite3_errmsg(pdb));
                    
                }
                else
                {
                    
                    NSLog(@"statement prepared successfully");
                    int idr = [[[resultArray objectAtIndex:i] objectForKey:@"Id"] intValue];
                    sqlite3_bind_int(addStmt, 1, idr);
                    int crtd = [[[resultArray objectAtIndex:i] objectForKey:@"CreatedBy"] intValue];
                    NSString *crtdStr = [NSString stringWithFormat:@"%d",crtd];
                    sqlite3_bind_text(addStmt, 2,[crtdStr UTF8String], -1, SQLITE_TRANSIENT);
                    sqlite3_bind_text(addStmt, 3,[[[resultArray objectAtIndex:i] objectForKey:@"DateCreated"] UTF8String], -1, SQLITE_TRANSIENT);
                    sqlite3_bind_text(addStmt, 4,[[[resultArray objectAtIndex:i] objectForKey:@"DateModified"] UTF8String], -1, SQLITE_TRANSIENT);
                    
                    int crtd2 = [[[resultArray objectAtIndex:i] objectForKey:@"ModifiedBy"] intValue];
                    NSString *crtdStr2 = [NSString stringWithFormat:@"%d",crtd2];
                    sqlite3_bind_text(addStmt, 5,[crtdStr2 UTF8String], -1, SQLITE_TRANSIENT);
                    
                    int displayDate = [[[resultArray objectAtIndex:i] objectForKey:@"cellPhone"] intValue];
                    NSString *dtrstr =[NSString stringWithFormat:@"%d",displayDate];
                    sqlite3_bind_text(addStmt, 6,[dtrstr UTF8String], -1, SQLITE_TRANSIENT);
                    
                    id displayDate2 = [[resultArray objectAtIndex:i] objectForKey:@"city"];
                    NSString *dtrstr2 = @"";
                    if (displayDate2 != [NSNull null])
                        dtrstr2 = (NSString *)displayDate2;
                    sqlite3_bind_text(addStmt, 7,[dtrstr2 UTF8String], -1, SQLITE_TRANSIENT);
                    sqlite3_bind_text(addStmt, 8,[[[resultArray objectAtIndex:i] objectForKey:@"department"] UTF8String], -1, SQLITE_TRANSIENT);
                    
                    sqlite3_bind_text(addStmt, 9,[[[resultArray objectAtIndex:i] objectForKey:@"email"] UTF8String], -1, SQLITE_TRANSIENT);
                    sqlite3_bind_text(addStmt, 10,[[[resultArray objectAtIndex:i] objectForKey:@"firstName"] UTF8String], -1, SQLITE_TRANSIENT);
                    //
                    id fr = [[resultArray objectAtIndex:i] objectForKey:@"isClient"];
                    NSString *frStr = [NSString stringWithFormat:@"%@",fr];
                    sqlite3_bind_text(addStmt, 11,[frStr UTF8String], -1, SQLITE_TRANSIENT);
                    
//                    int fr2 = [[[resultArray objectAtIndex:i] objectForKey:@"lastName"] intValue];
//                    NSString *fr2Str = [NSString stringWithFormat:@"%d",fr2];
                    sqlite3_bind_text(addStmt, 12,[[[resultArray objectAtIndex:i] objectForKey:@"lastName"] UTF8String], -1, SQLITE_TRANSIENT);
                    //
                    id displayDate4 = [[resultArray objectAtIndex:i] objectForKey:@"managerId"];
                    NSString *dtrstr4 = @"";
                    if (displayDate4 != [NSNull null])
                        dtrstr4 = (NSString *)displayDate4;
                    sqlite3_bind_text(addStmt, 13,[dtrstr4 UTF8String], -1, SQLITE_TRANSIENT);
                    id fr3 = [[resultArray objectAtIndex:i] objectForKey:@"officePhone"];
                    NSString *frStr3 = [NSString stringWithFormat:@"%@",fr3];
                    sqlite3_bind_text(addStmt, 14,[frStr3 UTF8String], -1, SQLITE_TRANSIENT);
                    sqlite3_bind_text(addStmt, 15,[[[resultArray objectAtIndex:i] objectForKey:@"picture"] UTF8String], -1, SQLITE_TRANSIENT);
                    
                    id fr4 = [[resultArray objectAtIndex:i] objectForKey:@"reportCount"];
                    NSString *frStr4 = [NSString stringWithFormat:@"%@",fr4];
                    sqlite3_bind_text(addStmt, 16,[frStr4 UTF8String], -1, SQLITE_TRANSIENT);
                    
                    id fr5 = [[resultArray objectAtIndex:i] objectForKey:@"shortBio"];
                    NSString *frStr5 = [NSString stringWithFormat:@"%@",fr5];
                    sqlite3_bind_text(addStmt, 17,[frStr5 UTF8String], -1, SQLITE_TRANSIENT);
                    
                    id fr6 = [[resultArray objectAtIndex:i] objectForKey:@"supportPhone"];
                    NSString *frStr6 = [NSString stringWithFormat:@"%@",fr6];
                    sqlite3_bind_text(addStmt, 18,[frStr6 UTF8String], -1, SQLITE_TRANSIENT);
                    sqlite3_bind_text(addStmt, 19,[[[resultArray objectAtIndex:i] objectForKey:@"title"] UTF8String], -1, SQLITE_TRANSIENT);
                    
                    if(SQLITE_DONE != sqlite3_step(addStmt))// THIS IS THE STATEMENT TO EXECUTE THE QUERY
                    {
                        NSLog(@"\nnot able to insert");
                    }
                    else
                    {
                        NSLog(@"inserted support into table");
                    }
                }
            }
 		}
		else
			NSLog(@"not able to create/open the table");
 	}
	else
 		NSLog(@"\ndatabase not  opened");
    NSLog(@"added successfully");

}

-(void)addToAppDatabese{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	//NSLog(@"paths %@\n documentsDirectory %@",paths,documentsDirectory);
 	NSString *dbPath = [[NSString alloc] initWithString: [documentsDirectory stringByAppendingPathComponent:@"application.db"]];
 	returncode=sqlite3_open([dbPath UTF8String],&pdb);
	if(returncode==SQLITE_OK)
	{
 		NSLog(@"\ndatabase opened");
         sqlstatement="CREATE TABLE IF NOT EXISTS apptable(Id INTEGER PRIMARY KEY,CreatedBy varchar,DateCreated varchar,DateModified varchar,ModifiedBy varchar,businessAnalyst varchar,department varchar,description varchar,businessSystemsManager varchar,informationOwner varchar,name varchar)";
		/// this will open the table if already exists. else it will create the table with the same name and open
		returncode = sqlite3_exec(pdb,sqlstatement,NULL,NULL,&errormsg);
		if(returncode==SQLITE_OK)
		{
            [self deleteFromAppDataBase];
            for (int i=0; i<[resultArray count]; i++) {
                NSLog(@"TABLE EXIST/open");
                
                sqlstatement = "insert into apptable(Id,CreatedBy,DateCreated,DateModified,ModifiedBy,businessAnalyst,department,description,businessSystemsManager,informationOwner,name)values(?,?,?,?,?,?,?,?,?,?,?)";
                static sqlite3_stmt *addStmt=nil;//this is the full statement tat want to execute
                if(sqlite3_prepare_v2(pdb, sqlstatement, -1, &addStmt, NULL) != SQLITE_OK)//this is the prepare statement adding requst to the addStmt
                {
                    NSLog(@"not able to prepare the statement ");
                    NSAssert1(0, @"Error while creating add statement. '%s'", sqlite3_errmsg(pdb));
                    
                }
                else
                {
                    
                    NSLog(@"statement prepared successfully");
                    int idr = [[[resultArray objectAtIndex:i] objectForKey:@"Id"] intValue];
                    sqlite3_bind_int(addStmt, 1, idr);
                    int crtd = [[[resultArray objectAtIndex:i] objectForKey:@"CreatedBy"] intValue];
                    NSString *crtdStr = [NSString stringWithFormat:@"%d",crtd];
                    sqlite3_bind_text(addStmt, 2,[crtdStr UTF8String], -1, SQLITE_TRANSIENT);
                    sqlite3_bind_text(addStmt, 3,[[[resultArray objectAtIndex:i] objectForKey:@"DateCreated"] UTF8String], -1, SQLITE_TRANSIENT);
                    sqlite3_bind_text(addStmt, 4,[[[resultArray objectAtIndex:i] objectForKey:@"DateModified"] UTF8String], -1, SQLITE_TRANSIENT);
                    
                    //                    int idr = [[[resultArray objectAtIndex:i] objectForKey:@"Id"] intValue];
                    //                    NSString *idStr = [NSString stringWithFormat:@"%d",idr];
                    //                    sqlite3_bind_text(addStmt, 4,[idStr UTF8String], -1, SQLITE_TRANSIENT);
                    
                    int crtd2 = [[[resultArray objectAtIndex:i] objectForKey:@"ModifiedBy"] intValue];
                    NSString *crtdStr2 = [NSString stringWithFormat:@"%d",crtd2];
                    sqlite3_bind_text(addStmt, 5,[crtdStr2 UTF8String], -1, SQLITE_TRANSIENT);
                    
//                    id displayDate = [[resultArray objectAtIndex:i] objectForKey:@"businessAnalyst"];
//                    NSString *dtrstr = @"";
//                    if (displayDate != [NSNull null])
//                        dtrstr = (NSString *)displayDate;
                    sqlite3_bind_text(addStmt, 6,[[[resultArray objectAtIndex:i] objectForKey:@"businessAnalyst"] UTF8String], -1, SQLITE_TRANSIENT);
                    
//                    id displayDate2 = [[resultArray objectAtIndex:i] objectForKey:@"department"];
//                    NSString *dtrstr2 = @"";
//                    if (displayDate2 != [NSNull null])
//                        dtrstr2 = (NSString *)displayDate2;
                    sqlite3_bind_text(addStmt, 7,[[[resultArray objectAtIndex:i] objectForKey:@"department"] UTF8String], -1, SQLITE_TRANSIENT);
                    sqlite3_bind_text(addStmt, 8,[[[resultArray objectAtIndex:i] objectForKey:@"description"] UTF8String], -1, SQLITE_TRANSIENT);
                    
                    //int idr2 = [[[resultArray objectAtIndex:i] objectForKey:@"heatTicketId"] intValue];
                    //NSString *idStr2 = [NSString stringWithFormat:@"%d",idr2];
                    sqlite3_bind_text(addStmt, 9,[[[resultArray objectAtIndex:i] objectForKey:@"businessSystemsManager"] UTF8String], -1, SQLITE_TRANSIENT);
                    sqlite3_bind_text(addStmt, 10,[[[resultArray objectAtIndex:i] objectForKey:@"informationOwner"] UTF8String], -1, SQLITE_TRANSIENT);
                    
//                    id displayDate3 = [[resultArray objectAtIndex:i] objectForKey:@"name"];
//                    NSString *dtrstr3 = @"";
//                    if (displayDate3 != [NSNull null])
//                        dtrstr3 = (NSString *)displayDate3;
                    sqlite3_bind_text(addStmt, 11,[[[resultArray objectAtIndex:i] objectForKey:@"name"] UTF8String], -1, SQLITE_TRANSIENT);
                    if(SQLITE_DONE != sqlite3_step(addStmt))// THIS IS THE STATEMENT TO EXECUTE THE QUERY
                    {
                        NSLog(@"\nnot able to insert");
                    }
                    else
                    {
                         NSLog(@"app inserted into table");
                    }
                }
            }
 		}
		else
			NSLog(@"not able to create/open the table");
 	}
	else
 		NSLog(@"\ndatabase not  opened");
    NSLog(@"added successfully");
}


-(void) deleteFromDataBase
{
 
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

-(void) deleteCabFromDataBase
{
//	int returncode;
//	sqlite3 *pdb;
//	char *sqlstatement;
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

-(void) deleteShiftFromDataBase
{
//    int returncode;
//	sqlite3 *pdb;
//	char *sqlstatement;
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

-(void) deleteFromAppDataBase
{
    //    int returncode;
    //	sqlite3 *pdb;
    //	char *sqlstatement;
 	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSLog(@"paths %@\n documentsDirectory %@",paths,documentsDirectory);
	
	NSString *dbPath = [[NSString alloc] initWithString: [documentsDirectory stringByAppendingPathComponent:@"application.db"]];
 	returncode=sqlite3_open([dbPath UTF8String],&pdb);
	if(returncode==SQLITE_OK)
	{
        NSLog(@"\ndatabase opened");
		static sqlite3_stmt *deleteStmt=nil;
		if(deleteStmt == nil) {
			sqlstatement = "delete from apptable";
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







- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
