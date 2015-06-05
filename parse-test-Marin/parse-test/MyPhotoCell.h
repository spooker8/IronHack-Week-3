//
//  MyPhotoCell.h
//  parse-test
//
//  Created by Marin Todorov on 5/22/15.
//  Copyright (c) 2015 Underplot ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyPhotoCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UILabel *username;

@end
