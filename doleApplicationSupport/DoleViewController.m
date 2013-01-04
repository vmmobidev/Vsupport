//
//  DoleViewController.m
//  doleApplicationSupport
//
//  Created by Rahul kumar on 12/4/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import "DoleViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "DashBoardViewController.h"
#import <sqlite3.h>

@interface DoleViewController ()

@end

@implementation DoleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    scoll.contentSize = CGSizeMake(320, 500);
    signBtn.layer.cornerRadius = 7; // this value vary as per your desire
    // signBtn.layer.shadowColor
    signBtn.layer.masksToBounds = NO;
    signBtn.layer.borderWidth = 0.0f;
    
    
    signBtn.layer.shadowColor = [UIColor redColor].CGColor;
    signBtn.layer.shadowOpacity = 0.8;
    signBtn.layer.shadowRadius = 12;
    signBtn.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    signBtn.clipsToBounds = YES;
 	// Do any additional setup after loading the view, typically from a nib.
}


-(IBAction)login:(id)sender{
//    if ([EmailField.text isEqualToString:@""]||[PasswordField.text isEqualToString:@""]) {
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Message" message:@"Email Id and Password Required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil,nil ];
//        [alert show];
//    }
//    else{
        [EmailField resignFirstResponder];
        [PasswordField resignFirstResponder];
        //    [self.navigationController pushViewController:view animated:YES];
        //[self presentModalViewController:view animated:YES];
        DashBoardViewController *srch = [[DashBoardViewController alloc]initWithNibName:@"DashBoardViewController" bundle:nil];
        [self.navigationController pushViewController:srch animated:YES];
    //}
}
-(void)viewWillAppear:(BOOL)animated{
     [self.navigationController setNavigationBarHidden:YES];
    if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"switch"]isEqualToString:@"on"]) {
        
        autologSwitch.on=YES;
        DashBoardViewController *srch = [[DashBoardViewController alloc]initWithNibName:@"DashBoardViewController" bundle:nil];
        [self.navigationController pushViewController:srch animated:YES];
    }
    else
    {
        autologSwitch.on=NO;
    }
}
- (IBAction)switchAction:(id)sender
{
    //DEBUGLOG(NSLog(@"switchAction: sender = %d, isOn %d", [sender tag], [sender isOn]));
    
    if(autologSwitch.on)
    {
        
        [[NSUserDefaults standardUserDefaults]setObject:@"on" forKey:@"switch"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
    }
    else
    {
        [[NSUserDefaults standardUserDefaults]setObject:@"off" forKey:@"switch"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    [scoll setContentOffset:CGPointMake(0, 0) animated:YES];
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    CGRect rect=textField.frame;
    [scoll setContentOffset:CGPointMake(0, rect.origin.y-60) animated:YES];
}
- (void)keyboardWillBeHidden:(NSNotification*)aNotification {
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    scoll.contentInset = contentInsets;
    scoll.scrollIndicatorInsets = contentInsets;
}





- (void)viewDidUnload
{
    [super viewDidUnload];
    [self.navigationController setNavigationBarHidden:YES];
   

    // Release any retained subviews of the main view.
}

 

//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
//{
//    if (interfaceOrientation == UIInterfaceOrientationPortrait) {
//        [self.navigationController.view setFrame:CGRectMake(0, 0, 320 , 480)];
//    }
//    if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
//        [self.view setFrame:CGRectMake(0, 0, 480 , 320)];
//    }
//    return YES;
//}

@end
