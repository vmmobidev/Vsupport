//
//  AppsDetail1ViewController.m
//  doleApplicationSupportNew
//
//  Created by Rahul kumar on 12/6/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import "AppsDetail1ViewController.h"
#import "Connection.h"
#import "Design.h"
#import "AppsDetail2ViewController.h"

@interface AppsDetail1ViewController ()

@end

@implementation AppsDetail1ViewController
@synthesize queryStr;

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
    self.navigationItem.title = @"Applications";
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
    //sqlstatement="select name from apptable where department = '%@'";
    sqlstatement= (char *) [[NSString stringWithFormat:@"select Id,CreatedBy,DateCreated,DateModified,ModifiedBy,businessAnalyst,department,description,businessSystemsManager,informationOwner,name from apptable where department = '%@'", queryStr] UTF8String];
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
                [dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 5)] forKey:@"businessAnalyst"];
                 NSLog(@"detailviewdata23");
                 [dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 6)] forKey:@"department"];
                 NSLog(@"detailviewdata24");
                 [dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 7)] forKey:@"description"];
                 [dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt,8)] forKey:@"businessSystemsManager"];
                 NSLog(@"detailviewdata22");
                 [dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 9)] forKey:@"informationOwner"];
                [dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 10)] forKey:@"name"];
 				 NSLog(@"detailviewdata23");
                
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
 	NSLog(@"RAAAAARRRRAyy....%@",array);
    dataArray = [array copy];
    [dataTable reloadData];
    
}

-(void)webCall{
    queryStr = [queryStr stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    NSString *url = [NSString stringWithFormat:@"http://mobiappsupport.apphb.com/Application/Department/%@",queryStr];
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
    dptLbl.text = [[dataArray objectAtIndex:indexPath.row] objectForKey:@"name"];
       
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AppsDetail2ViewController *dt = [[AppsDetail2ViewController alloc] initWithNibName:@"AppsDetail2ViewController" bundle:nil];
    [dt setNameStr:[[dataArray objectAtIndex:indexPath.row] objectForKey:@"name"]];
    [dt setDiscrStr:[[dataArray objectAtIndex:indexPath.row] objectForKey:@"description"]];
    [dt setDeptStr:[[dataArray objectAtIndex:indexPath.row] objectForKey:@"department"]];
    [dt setInfoOwnrStr:[[dataArray objectAtIndex:indexPath.row] objectForKey:@"informationOwner"]];
    [dt setBusinsAnlystStr:[[dataArray objectAtIndex:indexPath.row] objectForKey:@"businessAnalyst"]];
    [self.navigationController pushViewController:dt animated:YES];
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
