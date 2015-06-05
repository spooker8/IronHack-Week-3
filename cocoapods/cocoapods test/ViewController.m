//
//  ViewController.m
//  cocoapods test
//
//  Created by Anand Kumar on 5/21/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import "ViewController.h"
#import <JSONModel/JSONModelLib.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *realName;
@property (weak, nonatomic) IBOutlet UIImageView *photo;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)shakeMe:(id)sender {
    
    NSString *address = [NSString stringWithFormat:
                         @"http://api.openweathermap.org/data/2.5/weather?q=%@,es",
                         self.textField.text
                         ];
    
    [JSONHTTPClient getJSONFromURLWithString:address
                                  completion:^(id json, JSONModelError *err) {
                                      NSLog(@"data: %@", json);
                                      NSDictionary *response = json;
                                      
                                      
                                      NSDictionary *main = response[@"main"]; //main dictionary
                                      
                                      NSNumber *temp= main[@"temp"];
                                      
                                      double celsius = temp.doubleValue - 273;
                                      
                                      self.realName.text =
                                      [NSString stringWithFormat:@"%.2f°", celsius];
                                      
                                  }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
