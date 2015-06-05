//
//  DetailsViewController.m
//  ParseTest
//
//  Created by Anand Kumar on 5/22/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import "DetailsViewController.h"
#import "ViewController.h"
#import <Parse/Parse.h>

@interface DetailsViewController ()

@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;


@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation DetailsViewController






- (IBAction)buttonLogout:(id)sender {
    
    [PFUser logOut];
    
    [self.navigationController
     popViewControllerAnimated:YES];
}


- (IBAction)actionCamera:(id)sender {
    
    //all class , make pointer then alloc init, anand rememeber this shit!
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    //requires a delegate method, so u need to set it to delegate yeah. picker point dot delegate
    picker.delegate = self;
    
    
   [self presentViewController:picker
                      animated:YES
                      completion:nil];
}


//upload photo.
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info;
{
    
    UIImage* selectedPhoto =
              info[UIImagePickerControllerOriginalImage];
    
                                               //pointer to the image.
    NSData *imageData = UIImagePNGRepresentation(selectedPhoto);
    PFFile *imageFile = [PFFile fileWithName:@"image.png" data:imageData];
    
    PFObject *userPhoto = [PFObject objectWithClassName:@"UserPhoto"];
    userPhoto[@"imageName"] = @"Profile Photo";
    userPhoto[@"imageFile"] = imageFile;
    userPhoto[@"user"]= [PFUser currentUser];  //association to the user , its a foreign key linking to the image.
    [userPhoto saveInBackground];
    
    [picker dismissViewControllerAnimated:YES
                               completion:nil];
    
}





- (void)viewDidLoad {
    [super viewDidLoad];
   
    PFUser *currentUser = [PFUser currentUser];
    
    self.usernameLabel.text = currentUser.username;
    
    
    self.navigationItem.hidesBackButton = YES;
    // Do any additional setup after loading the view.
    
    
    
    // Find all posts by the current user
    PFQuery *query = [PFQuery queryWithClassName:@"userPhoto"];
    [query whereKey:@"user" equalTo:currentUser];
    NSArray *userPhotos = [query findObjects];
    
    
    if (userPhotos.count>0) {
        
        //object....
        PFObject *firstPhoto = userPhotos.firstObject;
        
        //code which gets the file from the server and turn it on UIIMage
        PFFile *userImageFile = firstPhoto[@"imageFile"];
        [userImageFile getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
            if (!error) {
                UIImage *image = [UIImage imageWithData:imageData];
                self.imageView.image = image;
            }
        }];
        
        
        
        
    }
    
    
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
