//
//  ViewController.m
//  BeerNSCopyingNSZone
//
//  Created by Anand Kumar on 5/25/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import "ViewController.h"
#import "beer.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *theLabel;

@property (weak, nonatomic) IBOutlet UILabel *theLabel2;





@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    Beer *beer = [[Beer alloc] init];
    beer.brand = @"Estrella";
    
    Beer *beer2 = [beer copy];
    beer2.brand = @"Heineiken";
    
    
    self.theLabel.text = beer.brand;
    self.theLabel2.text = beer2.brand;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
