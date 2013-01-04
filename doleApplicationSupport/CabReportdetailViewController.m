//
//  CabReportdetailViewController.m
//  doleApplicationSupportNew
//
//  Created by Rahul kumar on 12/6/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import "CabReportdetailViewController.h"

@interface CabReportdetailViewController ()

@end

@implementation CabReportdetailViewController
@synthesize dtlStr,tktStr,redmineStr,responStr,riskStr,statusStr,dteStr;

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
    scroll.contentSize = CGSizeMake(320, 520);
    NSLog(@"tkt...%@",tktStr);
    NSLog(@"dtl...%@",dtlStr);
    NSLog(@"status...%@",statusStr);
    NSLog(@"respnsibl...%@",responStr);
    NSLog(@"risk...%@",riskStr);
    tktlbl.text = tktStr;
    redminelbl.text = redmineStr;
    NSString *tktstr1 = dtlStr;
    CGSize constraintSize;
    constraintSize.width = 175.0f;
    constraintSize.height = MAXFLOAT;
    CGSize stringSize =[tktstr1 sizeWithFont: [UIFont boldSystemFontOfSize: 12] constrainedToSize: constraintSize lineBreakMode: UILineBreakModeWordWrap];
    CGRect rect = CGRectMake(139, 103, stringSize.width, stringSize.height);
    discrlbl.frame = rect;
    discrlbl.text = tktstr1;
    
    CGRect rect2 = CGRectMake(139, stringSize.height+110, 80, 21);
    titl4lbl.frame = CGRectMake(9, stringSize.height+110, 113, 21);;
    rsklbl.frame = rect2;
    rsklbl.text = riskStr;
    line3lbl.frame = CGRectMake(0, stringSize.height+105, 320, 01);
    
    id displayDate = dteStr;
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
    //    if ([[dateFormat stringFromDate:date] isEqual:@"01-Jan-1970"]) {
    //        cell.dateLble.text = @"";
    //    }
    //    else{
   // dtelbl.text = [dateFormat stringFromDate:date];
    //}

    CGRect rect3 = CGRectMake(139, stringSize.height+140, 80, 21);
    titl5lbl.frame = CGRectMake(9, stringSize.height+140, 113, 21);
    dtelbl.frame = rect3;
    dtelbl.text = [dateFormat stringFromDate:date];
    line4lbl.frame = CGRectMake(0, stringSize.height+135, 320, 01);
    
    NSString *respstr = responStr;
    CGSize stringSize2 =[respstr sizeWithFont: [UIFont boldSystemFontOfSize: 12] constrainedToSize: constraintSize lineBreakMode: UILineBreakModeWordWrap];
    CGRect rect4 = CGRectMake(139, stringSize.height+165, stringSize2.width, stringSize2.height);
    titl6lbl.frame = CGRectMake(9, stringSize.height+162, 113, 21);
    responlbl.frame = rect4;
    responlbl.text = respstr;
    line5lbl.frame = CGRectMake(0, stringSize.height+165, 320, 01);
    
    NSString *stsStr = statusStr;
    CGSize stringSize3 =[stsStr sizeWithFont: [UIFont boldSystemFontOfSize: 12] constrainedToSize: constraintSize lineBreakMode: UILineBreakModeWordWrap];
    CGRect rect5 = CGRectMake(139, stringSize2.height+stringSize.height+167, stringSize3.width, stringSize3.height);
    titl7lbl.frame = CGRectMake(9, stringSize2.height+stringSize.height+165, 113, 21);
    statuslbl.frame = rect5;
    statuslbl.text = stsStr;
    line6lbl.frame = CGRectMake(0, stringSize2.height+stringSize.height+165, 320, 01);
    line7lbl.frame = CGRectMake(0, stringSize3.height+stringSize2.height+stringSize.height+170, 320, 01);
    backlbl.frame = CGRectMake(0, 43, 131,stringSize3.height+stringSize2.height+stringSize.height+127);
    
    
    






}

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
