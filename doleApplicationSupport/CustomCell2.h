//
//  CustomCell2.h
//  doleApplicationSupport
//
//  Created by Rahul kumar on 12/5/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RRSGlowLabel.h"

@interface CustomCell2 : UITableViewCell{
    IBOutlet UILabel *shiftLbl;
    IBOutlet UILabel *supportLbl;
    IBOutlet UILabel *IStLbl;
}

@property(nonatomic,retain) IBOutlet UILabel *shiftLbl;
@property(nonatomic,retain)IBOutlet UILabel *supportLbl;
@property(nonatomic,retain)IBOutlet UILabel *IStLbl;

-(void)glowAction;
@end
