//
//  PhotoViewController.m
//  ParseTest
//
//  Created by Anand Kumar on 5/22/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import "PhotoViewController.h"
#import <parse/parse.h>

@interface PhotoViewController ()

@property (strong, nonatomic) NSMutableArray *photos;

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)refresh:(id)sender {
    
    [self loadPhotos];
    
}



- (IBAction)actionTakePhoto:(id)sender {
    
    
    UIImagePickerController *picker =
    [[UIImagePickerController alloc] init];
    
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    picker.allowsEditing = YES;
    
    
    [self presentViewController:picker
                       animated:YES
                     completion:nil];
    
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    UIImage *selectedPhoto = info[UIImagePickerControllerOriginalImage];
    
    NSData *imageData = UIImagePNGRepresentation(selectedPhoto);
    PFFile  *imageFile = [PFFile fileWithName:@"image.png" data:[imageData];
                          
    PFObject *userPhoto = [PFObject objectWithClassName:@"StreamPhoto"];
                          userPhoto[@"imageName"] = @"Profile Photo";
                          userPhoto[@"imageFile"]= imageFile;
                          userPhoto[@"user"] = [PFUser currentUser];
                          [userPhoto saveInBackground];
                          
                          [self dismissViewControllerAnimated:YES completion:nil];
                          
}



-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear : animated];
    
    [self loadPhotos];
    
    
    
}


-(void)loadPhotos {
    
    
    PFQuery *query = [PFQuery queryWithClassName:@"StreamPhoto"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %lu photos.", objects.count);
            // Do something with the found objects
            for (PFObject *object in objects) {
                NSLog(@"%@", object.objectId);
                PFFile* file = object[@"imageFile"];
                [self.getphoto:file];
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
    
    
}


-(void)getPhoto:(PFFile *)file

{
    
    
    //code which gets the file from the server and turn it on UIIMage
    PFFile *file = firstPhoto[@"imageFile"];
    [userImageFile getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
        if (!error) {
            UIImage *image = [UIImage imageWithData:imageData];
            self.imageView.image = image;
        }
    }];

    
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
