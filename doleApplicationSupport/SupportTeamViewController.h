//
//  SupportTeamViewController.h
//  doleApplicationSupport
//
//  Created by Rahul kumar on 12/4/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SupportTeamViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray *dataArray;
    IBOutlet UITableView *dataTable;
    NSMutableArray *array;
    NSMutableDictionary *dict;
}

@end
