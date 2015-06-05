//
//  TableViewCell.h
//  AutoLayout
//
//  Created by Anand Kumar on 5/19/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *myText;
@property (weak, nonatomic) IBOutlet UIImageView *image;

@end
