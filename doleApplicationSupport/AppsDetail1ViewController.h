//
//  AppsDetail1ViewController.h
//  doleApplicationSupportNew
//
//  Created by Rahul kumar on 12/6/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface AppsDetail1ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    NSString *queryStr;
    NSMutableArray *dataArray;
    IBOutlet UITableView *dataTable;
    NSMutableArray *array;
    NSMutableDictionary *dict;
}
@property(nonatomic,retain)NSString *queryStr;

@end
