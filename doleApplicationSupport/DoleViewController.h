//
//  DoleViewController.h
//  doleApplicationSupport
//
//  Created by Rahul kumar on 12/4/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoleViewController : UIViewController{
    IBOutlet UIScrollView *scoll;
    IBOutlet UISwitch *autologSwitch;
    IBOutlet UITextField *EmailField;
    IBOutlet UITextField *PasswordField;
    IBOutlet UIButton *signBtn;
}
- (IBAction)switchAction:(id)sender;
-(IBAction)login:(id)sender;

@end
