//
//  ShiftRosterViewController.h
//  doleApplicationSupport
//
//  Created by Rahul kumar on 12/4/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
#import "RRSGlowLabel.h"

@interface ShiftRosterViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    IBOutlet UITableView *dataTable;
    NSMutableArray *dataArray;
    IBOutlet UILabel *istLbl;
    IBOutlet UISegmentedControl *segmentedControl;
    BOOL pstbool;
    BOOL istbool;
    BOOL estbool;
    NSMutableArray *array;
    NSMutableDictionary *dict;
    RRSGlowLabel *label;
}
@property (nonatomic, retain) IBOutlet RRSGlowLabel *label;
@property(nonatomic,retain)IBOutlet UISegmentedControl *segmentedControl;
- (IBAction)adjustGlowAmount:(id)sender;
-(IBAction)segmentBtnAction:(id)sender;
@end
