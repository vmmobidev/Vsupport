//
//  AppsDetail2ViewController.h
//  doleApplicationSupportNew
//
//  Created by Rahul kumar on 12/14/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppsDetail2ViewController : UIViewController{
    NSString *nameStr;
    NSString *discrStr;
    NSString *deptStr;
    NSString *infoOwnrStr;
    NSString *businsAnlystStr;
    IBOutlet UIScrollView *scroll;
    IBOutlet UILabel *namelbl;
    IBOutlet UILabel *discrlbl;
    IBOutlet UILabel *deptlbl;
    IBOutlet UILabel *infoOwnrlbl;
    IBOutlet UILabel *businsAnlystlbl;
    IBOutlet UILabel *titl1lbl;
    IBOutlet UILabel *titl2lbl;
    IBOutlet UILabel *titl3lbl;
    IBOutlet UILabel *titl4lbl;
    IBOutlet UILabel *titl5lbl;
    IBOutlet UILabel *line1lbl;
    IBOutlet UILabel *line2lbl;
    IBOutlet UILabel *line3lbl;
    IBOutlet UILabel *line4lbl;
    IBOutlet UILabel *line5lbl;
    IBOutlet UILabel *backlbl;
    
    
}
@property(nonatomic,retain)NSString *nameStr;
@property(nonatomic,retain)NSString *discrStr;
@property(nonatomic,retain)NSString *deptStr;
@property(nonatomic,retain)NSString *infoOwnrStr;
@property(nonatomic,retain)NSString *businsAnlystStr;
 
@end
