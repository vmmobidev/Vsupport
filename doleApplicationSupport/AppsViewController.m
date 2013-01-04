//
//  AppsViewController.m
//  doleApplicationSupport
//
//  Created by Rahul kumar on 12/4/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import "AppsViewController.h"
#import "Connection.h"
#import "Design.h"
#import "AsyncImageView.h"
#import <QuartzCore/QuartzCore.h>
#import "AppsDetail1ViewController.h"

@interface AppsViewController ()

@end

@implementation AppsViewController

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
     self.navigationItem.title = @"Department";
//    UIBarButtonItem *mailbutton =[[UIBarButtonItem alloc] initWithCustomView:someButton];
//    self.navigationItem.leftBarButtonItem=mailbutton;
    [self.navigationController setNavigationBarHidden:NO];
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
    // Do any additional setup after loading the view from its nib.
    
}

-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)viewWillAppear:(BOOL)animated{
//    [Design createActivityIndicatorStart:self];
//    [self webCall];
    array = [NSMutableArray new];
  	sqlite3 *pdb;
	char *sqlstatement;
	NSError *error;
 	static sqlite3_stmt *addStmt=nil;
 	NSFileManager *fileManager=[NSFileManager defaultManager];
 	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES);
	NSString *documentsDir = [paths objectAtIndex:0];
	NSString *dbPath = [documentsDir stringByAppendingPathComponent:@"application.db"];
 	BOOL success =[fileManager fileExistsAtPath:dbPath];
	if(success)
		NSLog(@"\ndatabase is exist in the path");
	else
	{
		NSLog(@"\ndatabase not able to open");
		NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"application.db"];
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
    sqlstatement="select department from apptable";
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
                //[dict setObject:[NSString stringWithFormat:@"%d",sqlite3_column_int(addStmt,0)] forKey:@"Id"];
				[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt,0)] forKey:@"department"];
				NSLog(@"detailviewdata22");
//				[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 2)] forKey:@"DateCreated"];
//				NSLog(@"detailviewdata23");
//				[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 3)] forKey:@"DateModified"];
//				NSLog(@"detailviewdata24");
//                [dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt,4)] forKey:@"ModifiedBy"];
//				NSLog(@"detailviewdata22");
//				[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 5)] forKey:@"shift"];
//				NSLog(@"detailviewdata23");
//				[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 6)] forKey:@"supportStaff"];
//				NSLog(@"detailviewdata24");
//				[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 7)] forKey:@"timeEST"];
//                [dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt,8)] forKey:@"timeIST"];
//				NSLog(@"detailviewdata22");
//				[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 9)] forKey:@"timePST"];
 				//NSLog(@"detailviewdata23");
                
                [array addObject:dict];
            }
            @catch (NSException *exception) {
                NSLog(@"Exception%@",exception);
            }
            @finally {
                NSLog(@"Finally");
            }
        }
    }
    NSSet *uniqueItems = [NSSet setWithArray:array];
    NSArray *newArray  = [NSArray arrayWithArray:[uniqueItems allObjects]];

 	NSLog(@"RAAAAARRRRAyy....%@",newArray);
    dataArray = [newArray copy];
    [dataTable reloadData];

}

-(void)webCall{
    
    NSString *url = @"http://mobiappsupport.apphb.com/Application/Department";
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

 
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [dataArray count];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [dataTable dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
 
        UILabel *nameLbl= [[UILabel alloc]init];
        nameLbl.frame = CGRectMake(0, 44, 320, 01);
        nameLbl.font = [UIFont boldSystemFontOfSize:12];
        nameLbl.tag = 30;
        nameLbl.backgroundColor = [UIColor lightGrayColor];
        [cell.contentView addSubview:nameLbl];
        
        UILabel *dptLbl= [[UILabel alloc]init];
        dptLbl.frame = CGRectMake(05, 05, 250, 30);
        dptLbl.font = [UIFont boldSystemFontOfSize:15];
        dptLbl.tag = 40;
        dptLbl.highlightedTextColor = [UIColor whiteColor];
        [cell.contentView addSubview:dptLbl];
        
       
        
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
    dptLbl.text = [[dataArray objectAtIndex:indexPath.row] objectForKey:@"department"];
 
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AppsDetail1ViewController *dtl = [[AppsDetail1ViewController alloc] initWithNibName:@"AppsDetail1ViewController" bundle:nil];
    [dtl setQueryStr:[[dataArray objectAtIndex:indexPath.row] objectForKey:@"department"]];
    [self.navigationController pushViewController:dtl animated:YES];
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 40;
//}



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
