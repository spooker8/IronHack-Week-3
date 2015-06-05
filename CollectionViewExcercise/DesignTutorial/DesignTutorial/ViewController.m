//
//  ViewController.m
//  DesignTutorial
//
//  Created by Anand Kumar on 5/20/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController


-(void) viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    
//*---------Simple animation block---------
    
//    [UIView animateWithDuration:5.0
//                     animations:^{
    
                         //   self.imageView.backgroundColor =
                         //   [UIColor yellowColor];
                         
                    //     self.imageView.center = CGPointMake(200, 300);
                     //    self.imageView.alpha   = 0.25;
                     //    self.imageView.backgroundColor = [UIColor blueColor];
                         
                         
//                         self.imageView.center = CGAffineTransformMakeRotation(34);
//                         self.imageView.alpha   = 0.25;
//                         self.imageView.backgroundColor = [UIColor blueColor];
//  }];
    
    
    
    
    //--------**------Fade out the view.. when it reach the last alpha value it gives a result in nslog------
//    [UIView animateWithDuration:0.5
//                     animations:^{
//                         self.imageView.alpha = 0.2;
//                     } completion:^(BOOL finished) {
//                         [self animateStep2];
//                          [self animateStep3];
//                         
//                         
//                         
//                         
//                     }];
    
    
    
//    [UIView animateWithDuration: 0.5   //duration of the lenght
//                          delay: 0.5    //delay this amount of time before starting the animation
//                         options: UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat  | UIViewAnimationOptionCurveEaseInOut//
//     
//                     animations:^{
//                         
//                         self.imageView.center = CGPointMake(200, 300);
//                         self.imageView.alpha = 0.2;
//
//                         
//                         
//                     } completion:nil];
    
    
    

    [UIView animateWithDuration: 5.0
                          delay:0.2
         usingSpringWithDamping:0.2
          initialSpringVelocity:5.0
                        options:0
                     animations:^{
                         self.imageView.center = CGPointMake(200, 300);
                     } completion:nil];
    
    
    
}


////for animation step 2.
//-(void)animateStep2
//{
//    
//    [UIView animateWithDuration:0.5 animations:^{
//        self.imageView.center = CGPointMake(200, 300);
//    } completion:^(BOOL finished) {
//        NSLog(@"Completed");
//    }];
//}
//
////for animation step 3
//-(void)animateStep3
//{
//    
//    [UIView animateWithDuration:0.5 animations:^{
//        self.imageView.center = CGPointMake(100, 300);
//
//       // self.imageView.transform = CGAffineTransformIdentity;
//       }];
//}
//




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
