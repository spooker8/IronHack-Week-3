//
//  DetailsViewController.m
//  parse-test
//
//  Created by Marin Todorov on 5/22/15.
//  Copyright (c) 2015 Underplot ltd. All rights reserved.
//

#import "DetailsViewController.h"
#import <Parse/Parse.h>

@interface DetailsViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *photo;

@end

@implementation DetailsViewController

- (IBAction)actionLogout:(id)sender {
    [PFUser logOut];
    
    [self.navigationController
     popViewControllerAnimated: YES];
}

- (IBAction)actionCamera:(id)sender {
    UIImagePickerController* picker =
    [[UIImagePickerController alloc] init];
    
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    
    [self presentViewController:picker
                       animated:YES
                     completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker
    didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage* selectedPhoto =
        info[UIImagePickerControllerOriginalImage];
    
    NSData *imageData = UIImagePNGRepresentation(selectedPhoto);
    PFFile *imageFile = [PFFile fileWithName:@"image.png" data:imageData];
    
    PFObject *userPhoto = [PFObject objectWithClassName:@"UserPhoto"];
    userPhoto[@"imageName"] = @"Profile photo";
    userPhoto[@"imageFile"] = imageFile;
    userPhoto[@"user"] = [PFUser currentUser];
    [userPhoto saveInBackground];
    
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.hidesBackButton = YES;
    
    PFUser *currentUser = [PFUser currentUser];
    self.usernameLabel.text = currentUser.username;
    
    // Find all posts by the current user
    PFQuery *query = [PFQuery queryWithClassName:@"UserPhoto"];
    [query whereKey:@"user" equalTo:currentUser];
    NSArray *userPhotos = [query findObjects];
    
    if (userPhotos.count>0) {
        
        PFObject* firstPhoto = userPhotos.firstObject;
        
        PFFile *userImageFile = firstPhoto[@"imageFile"];
        [userImageFile getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
            if (!error) {
                UIImage *image = [UIImage imageWithData:imageData];
                self.photo.image = image;
            }
        }];
        
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
