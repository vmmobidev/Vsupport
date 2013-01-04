//
//  CustomCell2.m
//  doleApplicationSupport
//
//  Created by Rahul kumar on 12/5/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import "CustomCell2.h"
#import <QuartzCore/QuartzCore.h>

@interface CustomCell2 ()

@end

@implementation CustomCell2
@synthesize shiftLbl,supportLbl,IStLbl;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    //self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
        // Custom initialization
    }
    return self;
}

-(void)glowAction{
//    self.IStLbl.glowColor = [UIColor redColor];//self.IStLbl.textColor;
//    self.IStLbl.glowOffset = CGSizeMake(0.0, 0.0);
//    self.IStLbl.glowAmount = 30.0;
   // IStLbl.alpha = 10;
    IStLbl.textColor = [UIColor blueColor];
    //IStLbl.layer.shadowColor = [UIColor whiteColor].CGColor;
    IStLbl.layer.shadowOffset = CGSizeMake(0.0, 0.0);
    IStLbl.layer.shadowRadius = 10.0;
    IStLbl.layer.shadowOpacity = 0.3;
//    IStLbl.layer.shadowColor = [IStLbl.textColor CGColor];
//    IStLbl.layer.shadowOffset = CGSizeMake(0.0, 0.0);
//    IStLbl.layer.shadowRadius = 0.5f;
//    IStLbl.layer.shadowOpacity = 0.95;
    IStLbl.layer.masksToBounds = NO;
    
    //IStLbl.textColor = [UIColor blueColor];
    [NSTimer scheduledTimerWithTimeInterval:01 target:self selector:@selector(adjustGlowAmount:) userInfo:nil repeats:NO];
}
- (IBAction)adjustGlowAmount:(id)sender {
//    self.IStLbl.glowAmount =100; //self.glowSlider.value;
//    [self.IStLbl setNeedsDisplay];
    IStLbl.layer.shadowRadius = 0.0;
    IStLbl.layer.shadowOpacity = 0.0;
    IStLbl.textColor = [UIColor blackColor];
}
 
@end
