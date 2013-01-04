//
//  CabReportdetailViewController.h
//  doleApplicationSupportNew
//
//  Created by Rahul kumar on 12/6/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CabReportdetailViewController : UIViewController{
    NSString *dtlStr;
    NSString *tktStr;
    NSString *redmineStr;
    NSString *riskStr;
    NSString *dteStr;
    NSString *responStr;
    NSString *statusStr;
    IBOutlet UIScrollView *scroll;
    IBOutlet UILabel *tktlbl;
    IBOutlet UILabel *redminelbl;
    IBOutlet UILabel *discrlbl;
    IBOutlet UILabel *rsklbl;
    IBOutlet UILabel *dtelbl;
    IBOutlet UILabel *responlbl;
    IBOutlet UILabel *statuslbl;
    IBOutlet UILabel *titl1lbl;
    IBOutlet UILabel *titl2lbl;
    IBOutlet UILabel *titl3lbl;
    IBOutlet UILabel *titl4lbl;
    IBOutlet UILabel *titl5lbl;
    IBOutlet UILabel *titl6lbl;
    IBOutlet UILabel *titl7lbl;
    IBOutlet UILabel *line1lbl;
    IBOutlet UILabel *line2lbl;
    IBOutlet UILabel *line3lbl;
    IBOutlet UILabel *line4lbl;
    IBOutlet UILabel *line5lbl;
    IBOutlet UILabel *line6lbl;
    IBOutlet UILabel *line7lbl;
     IBOutlet UILabel *backlbl;
    
    
}
@property(nonatomic,retain)NSString *dtlStr;
@property(nonatomic,retain)NSString *tktStr;
@property(nonatomic,retain)NSString *redmineStr;
@property(nonatomic,retain)NSString *riskStr;
@property(nonatomic,retain)NSString *dteStr;
@property(nonatomic,retain)NSString *responStr;
@property(nonatomic,retain)NSString *statusStr; 

@end
