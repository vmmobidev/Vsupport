//
//  AboutViewController.m
//  doleApplicationSupport
//
//  Created by Rahul kumar on 12/4/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

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
//    UIImage* image3 = [UIImage imageNamed:@"home_blue.png"];
//    CGRect frameimg = CGRectMake(0, 0, 40, 40);
//    UIButton *someButton = [[UIButton alloc] initWithFrame:frameimg];
//    [someButton setBackgroundImage:image3 forState:UIControlStateNormal];
//    [someButton addTarget:self action:@selector(backAction)
//         forControlEvents:UIControlEventTouchUpInside];
//    [someButton setShowsTouchWhenHighlighted:YES];
    self.navigationItem.title = @"About";
//    UIBarButtonItem *mailbutton =[[UIBarButtonItem alloc] initWithCustomView:someButton];
//    self.navigationItem.leftBarButtonItem=mailbutton;
    [self.navigationController setNavigationBarHidden:NO];
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
    // Do any additional setup after loading the view from its nib.
}

-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)webLoad:(id)sender{
    NSStringEncoding enc;
    NSError *error;
    NSString *connected = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://www.google.com"] usedEncoding:&enc error:&error];
    if (connected == nil) {
        NSString * infoString = [NSString stringWithFormat:@"Running in Offline Mode Please Try After Some Time"];
        UIAlertView * infoAlert = [[UIAlertView alloc] initWithTitle:@"Network Connection Failed" message:infoString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [infoAlert show];
        [self loadView];
    } else {
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 40, 320, 480)];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    web=[[UIWebView alloc]initWithFrame:CGRectMake(0, 40, 320,480)];
    NSString *url=@"http://vmokshagroup.com/en/";
    NSURL *nsurl=[NSURL URLWithString:url];
    NSURLRequest *nsrequest=[NSURLRequest requestWithURL:nsurl];
    [web loadRequest:nsrequest];
    web.delegate = self;
     [self.view addSubview:web];
    }
}
-(void) webViewDidStartLoad:(UIWebView *)webView
{
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
	[self.view addSubview:HUD];
 	HUD.delegate = self;
	HUD.labelText = @"Loading...";
    [HUD showWhileExecuting:@selector(myTask) onTarget:self withObject:nil animated:YES];
     
    
}

-(void) webViewDidFinishLoad:(UIWebView *)webView
{
     [HUD hide:YES];
 }

- (void)myTask {
	// Do something usefull in here instead of sleeping ...
	sleep(1000);
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
