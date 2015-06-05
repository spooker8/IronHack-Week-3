//
//  ViewController.m
//  PenguinAnimation
//
//  Created by Anand Kumar on 5/21/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *penguinView;

@property (strong, nonatomic) NSArray *frames;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     UIImage *image1 = [UIImage imageNamed:@"penguin_walk01"];
     UIImage *image2 = [UIImage imageNamed:@"penguin_walk02"];
     UIImage *image3 = [UIImage imageNamed:@"penguin_walk03"];
     UIImage *image4 = [UIImage imageNamed:@"penguin_walk04"];
    
    
    self.frames = @[image1, image2, image3, image4];
    //creating an array
    
    
    self.penguinView.animationDuration = 0.33;  //duration of the animation
    self.penguinView.animationRepeatCount = 1;  //how many times to repeat
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
 //   [super viewWillAppear: animated];
    
    //jump up tap
    UITapGestureRecognizer *tap =
    [[UITapGestureRecognizer  alloc] initWithTarget:self
                                             action:@selector(didTap:)];
                                        //didTap is a method name
    
    
    [self.penguinView addGestureRecognizer:tap];
    
    
    
    //swipe left
    UISwipeGestureRecognizer *swipeLeft =
    [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                              action:@selector(didSwipeLeft:)];
    
        swipeLeft.direction = UISwipeGestureRecognizerDirectionRight;
       [self.view addGestureRecognizer:swipeLeft];
    
    
    
    
    //swipe right

    UISwipeGestureRecognizer *swipeRight =
    [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                              action:@selector(didSwipeRight:)];
    
     swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeRight];

    
    
}


- (IBAction)walkLeft:(id)sender {
    
    
    if (self.penguinView.center.x < 0.0)
    {
        self.penguinView.center = CGPointMake(self.view.frame.size.width, self.penguinView.center.y);
    }
    
    
    self.penguinView.transform = CGAffineTransformMakeScale(-1.0, 1.0);
    
    self.penguinView.animationImages = self.frames;
    [self.penguinView startAnimating];  //method
    
    [UIView animateWithDuration:0.33
                     animations:^{
                         self.penguinView.center =
                         CGPointMake(self.penguinView.center.x - 30, self.penguinView.center.y);
                     }];
    
    
}


- (IBAction)walkRight:(id)sender {
    
    
    if (self.penguinView.center.x > self.view.frame.size.width)
    {
        self.penguinView.center =
        CGPointMake(0, self.penguinView.center.y);
    }

    self.penguinView.transform = CGAffineTransformIdentity;
    
    self.penguinView.transform = CGAffineTransformMakeScale(+1.0, 1.0);

    self.penguinView.animationImages = self.frames;
    [self.penguinView startAnimating];  //method

    
    [UIView animateWithDuration:0.33
                     animations:^{
                         self.penguinView.center =
                         CGPointMake(self.penguinView.center.x + 30,
                                     self.penguinView.center.y);
                     }];

    
    
}



-(void)didSwipeRight: (UISwipeGestureRecognizer *) recognizer
{
    
    
    if (self.penguinView.center.x > self.view.frame.size.width)
    {
        self.penguinView.center =
        CGPointMake(0, self.penguinView.center.y);
    }
    
    self.penguinView.transform = CGAffineTransformIdentity;

    
//    self.penguinView.transform = CGAffineTransformMakeScale(+1.0, 1.0);
    
    self.penguinView.animationImages = self.frames;
    [self.penguinView startAnimating];  //method
    
    
    [UIView animateWithDuration:0.33
                     animations:^{
                         self.penguinView.center =
                         CGPointMake(self.penguinView.center.x + 30,
                                     self.penguinView.center.y);
                     }];
    
 

    
}




-(void)didSwipeLeft: (UISwipeGestureRecognizer *) recognizer

{
    
    if (self.penguinView.center.x < 0.0)
    {
        self.penguinView.center = CGPointMake(self.view.frame.size.width, self.penguinView.center.y);
    }
    
    
    self.penguinView.transform = CGAffineTransformMakeScale(-1.0, 1.0);
    
    self.penguinView.animationImages = self.frames;
    [self.penguinView startAnimating];  //method
    
    [UIView animateWithDuration:0.33
                     animations:^{
                         self.penguinView.center =
                         CGPointMake(self.penguinView.center.x - 30,
                                     self.penguinView.center.y);
                     }];

    
    
}






//jump up tapp
-(void)didTap: (UITapGestureRecognizer *) recognizer

{
    
    
    
    self.penguinView.transform = CGAffineTransformIdentity;
    
    
    self.penguinView.animationImages = self.frames;
    [self.penguinView startAnimating];  //method
    
    self.penguinView.transform = CGAffineTransformMakeTranslation(0, -50);

    
    
    [UIView animateWithDuration:0.33
                     animations:^{
                         self.penguinView.center =
                         CGPointMake(self.penguinView.center.x ,
                                     self.penguinView.center.y);
                        [self jumpback];
                     }];

}


-(void)jumpback
{
    
    
    self.penguinView.animationImages = self.frames;
    [self.penguinView startAnimating];  //method
  
    self.penguinView.transform = CGAffineTransformMakeTranslation(0, 50);
    self.penguinView.transform = CGAffineTransformIdentity;

    
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
