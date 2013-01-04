//
//  CabReportViewController.h
//  doleApplicationSupport
//
//  Created by Rahul kumar on 12/4/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface CabReportViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    IBOutlet UITableView *dataTable;
    NSMutableArray *dataArray;
    NSMutableArray *array;
	sqlite3 *contactDB;
	NSString *databasePath;
    NSMutableDictionary *dict;
    
}

@end
