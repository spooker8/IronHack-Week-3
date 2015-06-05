//
//  ViewController.m
//  parse-test
//
//  Created by Marin Todorov on 5/22/15.
//  Copyright (c) 2015 Underplot ltd. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@end

@implementation ViewController

- (IBAction)actionLogin:(id)sender {
    [PFUser logInWithUsernameInBackground:self.usernameField.text
                                 password:self.passwordField.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            // Do stuff after successful login.
                                            self.view.backgroundColor = [UIColor redColor];
                                            [self performSegueWithIdentifier:@"logged"
                                                                      sender:nil];
                                        } else {
                                            // The login failed. Check error to see why.
                                            NSString *errorString = [error userInfo][@"error"];
                                            NSLog(@"error: %@", errorString);

                                        }
                                    }];
}

- (IBAction)actionRegister:(id)sender {
    
    PFUser *user = [PFUser user];
    user.username = self.usernameField.text;
    user.password = self.passwordField.text;
    //user.email = @"email@example.com";
    
    // other fields can be set if you want to save more information
    //user[@"phone"] = @"650-555-0000";
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            // Hooray! Let them use the app now.
            self.view.backgroundColor = [UIColor greenColor];
        } else {
            NSString *errorString = [error userInfo][@"error"];
            NSLog(@"error: %@", errorString);
            // Show the errorString somewhere and let the user try again.
        }
    }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

@end
