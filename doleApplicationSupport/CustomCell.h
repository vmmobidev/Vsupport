//
//  CustomCell.h
//  doleApplicationSupport
//
//  Created by Rahul kumar on 12/5/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell{
    IBOutlet UILabel *tktLble;
    IBOutlet UILabel *dateLble;
    IBOutlet UILabel *subLble;
    IBOutlet UILabel *detailLble;
    IBOutlet UILabel *colrLble;
    IBOutlet UIImageView *iconImage;
    
}
@property(nonatomic,retain) IBOutlet UILabel *tktLble;
@property(nonatomic,retain)IBOutlet UILabel *dateLble;
@property(nonatomic,retain)IBOutlet UILabel *subLble;
@property(nonatomic,retain)IBOutlet UILabel *detailLble;
@property(nonatomic,retain)IBOutlet UILabel *colrLble;
@property(nonatomic,retain)IBOutlet UIImageView *iconImage;

@end
