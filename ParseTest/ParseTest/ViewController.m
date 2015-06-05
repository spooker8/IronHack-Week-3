//
//  ViewController.m
//  ParseTest
//
//  Created by Anand Kumar on 5/22/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameField;
@property (strong, nonatomic) IBOutlet UITextField *passwordField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
   //self.userNameField.placeholder = @"username";
 //   self.passwordField.placeholder = @"password";
    self.passwordField.secureTextEntry = YES;
    
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
    
}


- (void)textFieldDidBeginEditing:(UITextField *)usernameField {
    usernameField.placeholder = nil;
    
      usernameField.delegate = self;
}
//
//- (void)textFieldDidEndEditing:(UITextField *)usernameField {
//    usernameField.placeholder = @"Your Placeholdertext";
//    usernameField.delegate = self;
//
//
//}




- (IBAction)login:(id)sender {
    
    [PFUser logInWithUsernameInBackground: self.userNameField.text
                                 password: self.passwordField.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                           
                                            self.view.backgroundColor = [UIColor blackColor];
                                            [self performSegueWithIdentifier:@"logged"
                                                                      sender:nil];
                                            
                                            //create self logging button.

                                        } else {
                                            
                                            NSString *errorString = [error userInfo][@"error"];
                                            NSLog(@"%@" , errorString);
                                        //try cocoapod shake textfield here.
                                        
                                        }
                                    }];
    
    
    
}


- (IBAction)register:(id)sender {
    
    
    
    PFUser *user = [PFUser user];
    user.username = self.userNameField.text; //@"my name";
    user.password = self.passwordField.text ; //@"my pass";
    
    
  
    
    
    // user.email = @"email@example.com";
    
    // other fields can be set if you want to save more information
    //  user[@"phone"] = @"650-555-0000";
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            self.view.backgroundColor = [UIColor yellowColor];
            // Hooray! Let them use the app now.
        } else {
            
            NSString *errorString = [error userInfo][@"error"];
            // Show the errorString somewhere and let the user try again.
            NSLog(@"%@" , errorString);
        }
    }];
    

    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
