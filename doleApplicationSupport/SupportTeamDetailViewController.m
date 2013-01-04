//
//  SupportTeamDetailViewController.m
//  doleApplicationSupportNew
//
//  Created by Rahul kumar on 12/13/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import "SupportTeamDetailViewController.h"
#import "AsyncImageView.h"

@interface SupportTeamDetailViewController ()

@end

@implementation SupportTeamDetailViewController
@synthesize imageStr,nameStr,phoneStr,reprtMngrStr,emailStr,degigStr,smsStr,bioStr,ctyStr,ophnStr;

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
    [self.navigationController setNavigationBarHidden:NO];
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
    // Do any additional setup after loading the view from its nib.
    
    
    AsyncImageView *iconImgView=[[AsyncImageView alloc]init];
    [iconImgView setFrame:CGRectMake(05, 0, 70, 70)];
    [iconImgView setBackgroundColor:[UIColor clearColor]];
    [iconImgView setWidth:80];
    [iconImgView loadImageFromURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://mobiappsupport.apphb.com/employee/picture/%@",imageStr]]];
    [scroll addSubview:iconImgView];
    nameLbl.text = nameStr;
    degigLbl.text = degigStr;
    cityLbl.text = ctyStr;
    emailLbl.text = emailStr;
    smsLbl.text = smsStr;
    reptrMngrLbl.text = reprtMngrStr;
    NSLog(@"%@",phoneStr);
    phoneLbl.text = phoneStr;
    ophoneLbl.text = ophnStr;
    CGSize constraintSize;
    constraintSize.width = 305.0f;
    constraintSize.height = MAXFLOAT;
    CGSize stringSize =[bioStr sizeWithFont: [UIFont systemFontOfSize: 13] constrainedToSize: constraintSize lineBreakMode: UILineBreakModeWordWrap];
    
 
    bioLbl.frame = CGRectMake(11, 372, stringSize.width, stringSize.height);
    bioLbl.lineBreakMode = UILineBreakModeCharacterWrap;
    bioLbl.text = bioStr;
    bioLbl.numberOfLines = 8;
    lineLbl.frame = CGRectMake(0, 385+stringSize.height, 320, 01);
    backgrndLbl.frame = CGRectMake(0,0, 320, 385+stringSize.height);
    scroll.contentSize = CGSizeMake(320, 385+stringSize.height);
}


-(IBAction)Sendemail:(id)sender{
    mailbool = TRUE;
    offphnbool = FALSE;
    cellphbool = FALSE;
    smsbool = FALSE;
    UIActionSheet *act = [[UIActionSheet alloc]initWithTitle:@"Do You Want to send Mail?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Send", nil ];
    [act showInView:self.view];
    
//    UIAlertView * infoAlert = [[UIAlertView alloc] initWithTitle:@"" message:@"Do You Want to send Mail?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
//    [infoAlert show];
}
-(IBAction)callOfficePhone:(id)sender{
    mailbool = FALSE;
    offphnbool = TRUE;
    cellphbool = FALSE;
    smsbool = FALSE;
    UIActionSheet *act = [[UIActionSheet alloc]initWithTitle:@"Do You Want to Call Office Phone?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Call", nil ];
    [act showInView:self.view];
//    UIAlertView * infoAlert = [[UIAlertView alloc] initWithTitle:@"" message:@"Do You Want to Call Office Phone?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
//    [infoAlert show];
    
}
-(IBAction)callCellPhone:(id)sender{
    mailbool = FALSE;
    offphnbool = FALSE;
    cellphbool = TRUE;
    smsbool = FALSE;
    UIActionSheet *act = [[UIActionSheet alloc]initWithTitle:@"Do You Want to Call Mobile Phone?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Call", nil ];
    [act showInView:self.view];
//    UIAlertView * infoAlert = [[UIAlertView alloc] initWithTitle:@"" message:@"Do You Want to Call?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
//    [infoAlert show];
    
}
-(IBAction)sendsms:(id)sender{
    mailbool = FALSE;
    offphnbool = FALSE;
    cellphbool = FALSE;
    smsbool = TRUE;
    UIActionSheet *act = [[UIActionSheet alloc]initWithTitle:@"Do You Want to send SMS?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Send SMS", nil ];
    [act showInView:self.view];
//    UIAlertView * infoAlert = [[UIAlertView alloc] initWithTitle:@"" message:@"Do You Want to send SMS?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
//    [infoAlert show];
    
}


//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
//    if (buttonIndex==1) {
//        if (smsbool) {
//          [self sendSMS:@"" recipientList:[NSArray arrayWithObjects:smsStr, nil]];
//        }
//    }
//}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
	[self dismissModalViewControllerAnimated:YES];
    
    if (result == MessageComposeResultCancelled)
        NSLog(@"Message cancelled");
    else if (result == MessageComposeResultSent)
        NSLog(@"Message sent");
    else
        NSLog(@"Message failed");
}
- (void)sendSMS:(NSString *)bodyOfMessage recipientList:(NSArray *)recipients
{
    MFMessageComposeViewController *controller = [[MFMessageComposeViewController alloc] init];
    if([MFMessageComposeViewController canSendText])
    {
        controller.body = bodyOfMessage;
        controller.recipients = recipients;
        controller.messageComposeDelegate = self;
        [self presentModalViewController:controller animated:YES];
    }    
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==0) {
        if (smsbool) {
            [self sendSMS:@"" recipientList:[NSArray arrayWithObjects:smsStr, nil]];
        }
        if (mailbool) {
            [self mailsent];
        }
        if (cellphbool) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",phoneStr]]];
        }
        if (offphnbool) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",ophnStr]]];
        }
    }
}

-(void)mailsent{
    Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
	if (mailClass != nil)
	{
		// We must always check whether the current device is configured for sending emails
		if ([mailClass canSendMail])
		{
			[self displayComposerSheet];
		}
		else
		{
			[self launchMailAppOnDevice];
		}
	}
	else
	{
		[self launchMailAppOnDevice];
	}
}

// Displays an email composition interface inside the application. Populates all the Mail fields.
-(void)displayComposerSheet
{
	MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
	picker.mailComposeDelegate = self;
	
	[picker setSubject:@"Mail"];
	
    
	// Set up recipients
	NSArray *toRecipients = [NSArray arrayWithObject:emailStr];
    //	NSArray *ccRecipients = [NSArray arrayWithObjects:@"second@example.com", @"third@example.com", nil];
    //	NSArray *bccRecipients = [NSArray arrayWithObject:@"fourth@example.com"];
	
	[picker setToRecipients:toRecipients];
    //	[picker setCcRecipients:ccRecipients];
    //	[picker setBccRecipients:bccRecipients];
	
	// Attach an image to the email
	//NSString *path = [[NSBundle mainBundle] pathForResource:@"rainy" ofType:@"png"];
    // NSData *myData = [NSData dataWithContentsOfFile:path];
	//[picker addAttachmentData:myData mimeType:@"image/png" fileName:@"rainy"];
	
	// Fill out the email body text
	NSString *emailBody = @"";
	[picker setMessageBody:emailBody isHTML:NO];
	
	[self presentModalViewController:picker animated:YES];
}
// Dismisses the email composition interface when users tap Cancel or Send. Proceeds to update the message field with the result of the operation.
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
	//message.hidden = NO;
	// Notifies users about errors associated with the interface
	switch (result)
	{
		case MFMailComposeResultCancelled:
            NSLog(@"CAncelled");
			//message.text = @"Result: canceled";
			break;
		case MFMailComposeResultSaved:
            NSLog(@"Saved");
			//message.text = @"Result: saved";
			break;
		case MFMailComposeResultSent:
            NSLog(@"SEEEENNt");
			//message.text = @"Result: sent";
			break;
		case MFMailComposeResultFailed:
            NSLog(@"FAiled");
			//message.text = @"Result: failed";
			break;
		default:
            NSLog(@"Not SENT");
			//message.text = @"Result: not sent";
			break;
	}
	[self dismissModalViewControllerAnimated:YES];
}
-(void)launchMailAppOnDevice
{
	NSString *recipients =emailStr;
	NSString *body = @"";
	
	NSString *email = [NSString stringWithFormat:@"%@%@", recipients, body];
	email = [email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]];
    
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
