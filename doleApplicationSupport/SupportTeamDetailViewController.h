//
//  SupportTeamDetailViewController.h
//  doleApplicationSupportNew
//
//  Created by Rahul kumar on 12/13/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface SupportTeamDetailViewController : UIViewController<MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate,UIActionSheetDelegate>{
    
    IBOutlet UIScrollView *scroll;
    NSString *imageStr;
    NSString *nameStr;
    NSString *degigStr;
    NSString *reprtMngrStr;
    NSString *phoneStr;
    NSString *smsStr;
    NSString *emailStr;
    NSString *bioStr;
    NSString *ctyStr;
    NSString *ophnStr;
    IBOutlet UILabel *nameLbl;
    IBOutlet UILabel *degigLbl;
    IBOutlet UILabel *reptrMngrLbl;
    IBOutlet UILabel *phoneLbl;
    IBOutlet UILabel *ophoneLbl;
    IBOutlet UILabel *emailLbl;
    IBOutlet UILabel *smsLbl;
    IBOutlet UILabel *cityLbl;
    IBOutlet UILabel *bioLbl;
    IBOutlet UILabel *lineLbl;
    IBOutlet UILabel *backgrndLbl;
    BOOL mailbool;
    BOOL offphnbool;
    BOOL cellphbool;
    BOOL smsbool;
}
@property(nonatomic,retain) NSString *imageStr;
@property(nonatomic,retain)NSString *nameStr;
@property(nonatomic,retain)NSString *degigStr;
@property(nonatomic,retain)NSString *reprtMngrStr;
@property(nonatomic,retain)NSString *phoneStr;
@property(nonatomic,retain)NSString *smsStr;
@property(nonatomic,retain)NSString *emailStr;
@property(nonatomic,retain)NSString *bioStr;
@property(nonatomic,retain)NSString *ctyStr;
@property(nonatomic,retain)NSString *ophnStr;

-(IBAction)Sendemail:(id)sender;
-(IBAction)callOfficePhone:(id)sender;
-(IBAction)callCellPhone:(id)sender;
-(IBAction)sendsms:(id)sender;


@end
