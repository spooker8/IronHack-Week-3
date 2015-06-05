//
//  ViewController.m
//  data-play
//
//  Created by Anand Kumar on 5/18/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //converting numbers.
    NSNumber* myNumber = @100.55;
    double myDouble = myNumber.doubleValue;
    //conversion of number process
    
    
    int myInt = myNumber.intValue;
    NSInteger myNSInteger = myNumber.integerValue;
    //converting number to primitive
    
    
    float myFloat = myNumber.floatValue;
    
    NSLog(@"%i", myInt);
    
    //how to take out the string value from here.
    //to convert an integer to a string value,,,
    NSString *myNumberStringValue = myNumber.stringValue;
    
    
    
    //converting strings
    NSString *fmt = [NSString stringWithFormat:@"Marin is #%i", 1];
    NSString *fmt1 = [NSString stringWithFormat:@"Price is: %.f", myFloat];
    NSString *fmt2 = [NSString stringWithFormat:@"Price is: %.1f", myFloat]; //floating points
    NSString *fmt3 = [NSString stringWithFormat:@"Price is: %.2f", myFloat]; //floating points


    NSLog(@"image :  %2f" , self.view.frame.size.width);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
