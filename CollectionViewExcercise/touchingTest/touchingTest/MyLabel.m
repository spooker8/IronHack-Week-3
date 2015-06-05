//
//  MyLabel.m
//  touchingTest
//
//  Created by Anand Kumar on 5/21/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import "MyLabel.h"

@implementation MyLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event


{

    self.textColor = [UIColor greenColor];
    self.backgroundColor = [UIColor yellowColor];
    
    
    
    
    
}



-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event

{
    
    self.textColor = [UIColor blackColor];
    self.backgroundColor = [UIColor orangeColor];
    self.transform = CGAffineTransformIdentity; //reset it back

    
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event

{
    
    self.textColor = [UIColor whiteColor];
    self.transform = CGAffineTransformMakeScale(2.1, 1.1);
   
    
    
    
    
}


@end
