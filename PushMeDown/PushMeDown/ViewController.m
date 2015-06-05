//
//  ViewController.m
//  PushMeDown
//
//  Created by Anand Kumar on 5/19/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *pushMeDown;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topMargin;


@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)pushMeDown:(id)sender {
    
//    self.pushMeDown.center = CGPointMake(self.pushMeDown.center.x, self.pushMeDown.center.y+ 20);
    
    [UIView animateWithDuration:1.0
                     animations:^{
                     
                         self.topMargin.constant -= 20;
                         
      //  self.pushMeDown.center = CGPointMake(self.pushMeDown.center.x, self.pushMeDown.center.y+ 20);
                         
                     //for everything    [self.view layoutIfNeeded];
                       [self.view layoutIfNeeded];       //for button only  
                         
                        }];
    
  
    
    
      
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
