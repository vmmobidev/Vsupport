//
//  EmergenyContactViewController.h
//  doleApplicationSupport
//
//  Created by Rahul kumar on 12/4/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
@interface EmergenyContactViewController : UIViewController<UIActionSheetDelegate,MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate>{
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
    NSMutableArray *array;
    NSMutableDictionary *dict;
    BOOL mailbool;
    BOOL offphnbool;
    BOOL cellphbool;
    BOOL smsbool;
    IBOutlet UILabel *message;
}


-(IBAction)Sendemail:(id)sender;
-(IBAction)callOfficePhone:(id)sender;
-(IBAction)callCellPhone:(id)sender;
-(IBAction)sendsms:(id)sender;
-(void)displayComposerSheet;
-(void)launchMailAppOnDevice;

@end
