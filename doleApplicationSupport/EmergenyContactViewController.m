//
//  EmergenyContactViewController.m
//  doleApplicationSupport
//
//  Created by Rahul kumar on 12/4/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import "EmergenyContactViewController.h"
#import <sqlite3.h>
#import "AsyncImageView.h"

@interface EmergenyContactViewController ()

@end

@implementation EmergenyContactViewController

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
    self.navigationItem.title = @"Emergency";
    //    UIBarButtonItem *mailbutton =[[UIBarButtonItem alloc] initWithCustomView:someButton];
    //    self.navigationItem.leftBarButtonItem=mailbutton;
    [self.navigationController setNavigationBarHidden:NO];
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
	NSLog(@"in will appear");
	array = [NSMutableArray new];
  	sqlite3 *pdb;
	char *sqlstatement;
	NSError *error;
 	static sqlite3_stmt *addStmt=nil;
 	NSFileManager *fileManager=[NSFileManager defaultManager];
 	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES);
	NSString *documentsDir = [paths objectAtIndex:0];
	NSString *dbPath = [documentsDir stringByAppendingPathComponent:@"supportteam.db"];
 	BOOL success =[fileManager fileExistsAtPath:dbPath];
	if(success)
		NSLog(@"\ndatabase is exist in the path");
	else
	{
		NSLog(@"\ndatabase not able to open");
		NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"supportteam.db"];
		success = [fileManager copyItemAtPath:defaultDBPath toPath:dbPath error:&error];
		if (!success)
		{
			NSLog(@"\ndatabase not able to create -error");
			NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
 		}
		else
			NSLog(@"\ndatabase is added to doc dir--- database.db");
 	}
  	int returncode = sqlite3_open([dbPath UTF8String],&pdb);
	if(returncode==SQLITE_OK)
	{
		NSLog(@"db open");
	}
    sqlstatement="select Id,CreatedBy,DateCreated,DateModified,ModifiedBy,cellphone,city,department,email,firstname,isClient,lastName,managerId,officePhone,picture,reportCount,shortBio,supportPhone,title from supporttable";
    addStmt=nil;
    if(sqlite3_prepare_v2(pdb, sqlstatement, -1, &addStmt, NULL) != SQLITE_OK)
    {
        NSLog(@"inside prepare statement ");
        NSAssert1(0, @"Error while creating add statement. '%s'", sqlite3_errmsg(pdb));
    }
    else
    {
        //sqlite3_bind_int(addStmt,1,i);
        while(sqlite3_step(addStmt) == SQLITE_ROW)
        {
            @try {
                dict = [NSMutableDictionary new];
                [dict setObject:[NSString stringWithFormat:@"%d",sqlite3_column_int(addStmt,0)] forKey:@"Id"];
				[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt,1)] forKey:@"CreatedBy"];
				NSLog(@"detailviewdata22");
				[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 2)] forKey:@"DateCreated"];
				NSLog(@"detailviewdata23");
				[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 3)] forKey:@"DateModified"];
				NSLog(@"detailviewdata24");
                [dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt,4)] forKey:@"ModifiedBy"];
				NSLog(@"detailviewdata22");
				[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 5)] forKey:@"cellPhone"];
				NSLog(@"detailviewdata23");
				[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 6)] forKey:@"city"];
				NSLog(@"detailviewdata24");
				[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 7)] forKey:@"department"];
                [dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt,8)] forKey:@"email"];
				NSLog(@"detailviewdata22");
				[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 9)] forKey:@"firstName"];
				//NSLog(@"detailviewdata23");
				[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 10)] forKey:@"isClient"];
				//NSLog(@"detailviewdata24");
				[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 11)] forKey:@"lastName"];
                [dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt,12)] forKey:@"managerId"];
				NSLog(@"detailviewdata22");
				[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 13)] forKey:@"officePhone"];
				NSLog(@"detailviewdata23");
				[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 14)] forKey:@"picture"];
				NSLog(@"detailviewdata24");
				[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 15)] forKey:@"reportCount"];
                [dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt,16)] forKey:@"shortBio"];
				NSLog(@"detailviewdata22");
				[dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 17)] forKey:@"supportPhone"];
                [dict setObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 18)] forKey:@"title"];
				//NSLog(@"detailviewdata23");
                
                [array addObject:dict];
            }
            @catch (NSException *exception) {
                NSLog(@"%@",exception);
            }
            @finally {
                NSLog(@"Finally");
            }
        }
    }
 	NSLog(@"RAAAAARRRRAyy....%@",array);
//    dataArray = [array copy];
//    [dataTable reloadData];
    
    AsyncImageView *iconImgView=[[AsyncImageView alloc]init];
    [iconImgView setFrame:CGRectMake(05, 0, 70, 70)];
    [iconImgView setBackgroundColor:[UIColor clearColor]];
    [iconImgView setWidth:80];
    [iconImgView loadImageFromURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://mobiappsupport.apphb.com/employee/picture/%@",[[array objectAtIndex:0] objectForKey:@"picture"]]]];
    [scroll addSubview:iconImgView];
    nameLbl.text = [NSString stringWithFormat:@"%@ %@",[[array objectAtIndex:0] objectForKey:@"firstName"],[[array objectAtIndex:0] objectForKey:@"lastName"]];;
    degigLbl.text = [[array objectAtIndex:0] objectForKey:@"title"];
    cityLbl.text = [[array objectAtIndex:0] objectForKey:@"city"];
    emailLbl.text = [[array objectAtIndex:0] objectForKey:@"email"];
    smsLbl.text = [[array objectAtIndex:0] objectForKey:@"supportPhone"];
    reptrMngrLbl.text = reprtMngrStr;
    phoneLbl.text = [[array objectAtIndex:0] objectForKey:@"supportPhone"];
    ophoneLbl.text = [[array objectAtIndex:0] objectForKey:@"officePhone"];

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
            [self sendSMS:@"" recipientList:[NSArray arrayWithObjects:[[array objectAtIndex:0] objectForKey:@"supportPhone"], nil]];
        }
        if (mailbool) {
            [self mailsent];
        }
        if (cellphbool) {
           [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",[[array objectAtIndex:0] objectForKey:@"supportPhone"]]]];
        }
        if (offphnbool) {
           [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",[[array objectAtIndex:0] objectForKey:@"officePhone"]]]];
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
	NSArray *toRecipients = [NSArray arrayWithObject:[[array objectAtIndex:0] objectForKey:@"email"]];
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
	message.hidden = NO;
	// Notifies users about errors associated with the interface
	switch (result)
	{
		case MFMailComposeResultCancelled:
            NSLog(@"CAncelled");
			message.text = @"Result: canceled";
			break;
		case MFMailComposeResultSaved:
            NSLog(@"Saved");
			message.text = @"Result: saved";
			break;
		case MFMailComposeResultSent:
            NSLog(@"SEEEENNt");
			message.text = @"Result: sent";
			break;
		case MFMailComposeResultFailed:
            NSLog(@"FAiled");
			message.text = @"Result: failed";
			break;
		default:
            NSLog(@"Not SENT");
			message.text = @"Result: not sent";
			break;
	}
	[self dismissModalViewControllerAnimated:YES];
}
-(void)launchMailAppOnDevice
{
	NSString *recipients = [[array objectAtIndex:0] objectForKey:@"email"];
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
