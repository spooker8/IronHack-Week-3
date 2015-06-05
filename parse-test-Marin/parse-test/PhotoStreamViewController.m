//
//  PhotoStreamViewController.m
//  parse-test
//
//  Created by Marin Todorov on 5/22/15.
//  Copyright (c) 2015 Underplot ltd. All rights reserved.
//

#import "PhotoStreamViewController.h"
#import <Parse/Parse.h>

#import "MyPhotoCell.h"

@interface PhotoStreamViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate, UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) NSMutableArray* photos;

@end

@implementation PhotoStreamViewController

- (IBAction)actionTakePhoto:(id)sender {
    UIImagePickerController* picker =
    [[UIImagePickerController alloc] init];
    
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    picker.allowsEditing = YES;
    
    [self presentViewController:picker
                       animated:YES
                     completion:nil];

}

- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage* selectedPhoto =
    info[UIImagePickerControllerEditedImage];
    
    NSData *imageData = UIImagePNGRepresentation(selectedPhoto);
    PFFile *imageFile = [PFFile fileWithName:@"image.png" data:imageData];
    
    PFObject *userPhoto = [PFObject objectWithClassName:@"StreamPhoto"];
    userPhoto[@"imageName"] = @"Profile photo";
    userPhoto[@"imageFile"] = imageFile;
    userPhoto[@"user"] = [PFUser currentUser];
    [userPhoto saveInBackgroundWithBlock:^(BOOL success, NSError* error){
        [self loadPhotos];
    }];
    
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear: animated];
    
    [self loadPhotos];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadPhotos
{
    self.photos = [NSMutableArray array];
    
    PFQuery *query = [PFQuery queryWithClassName:@"StreamPhoto"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %lu photos.", (unsigned long)objects.count);
            // Do something with the found objects
            for (PFObject *object in objects) {
                NSLog(@"%@", object.objectId);
                PFFile* file = object[@"imageFile"];
                [self getPhoto:file];
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

-(void)getPhoto:(PFFile*)file
{
    [file getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
        if (!error) {
            UIImage *image = [UIImage imageWithData:imageData];
            [self.photos addObject: image];
            [self.collectionView reloadData];
        }
    }];

}

#pragma mark - collection view methods

-(NSInteger)collectionView:(UICollectionView *)collectionView
    numberOfItemsInSection:(NSInteger)section
{
    return self.photos.count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView
                cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyPhotoCell* cell = [collectionView
       dequeueReusableCellWithReuseIdentifier:@"PhotoCell"
                         forIndexPath:indexPath];
    cell.photo.image = self.photos[indexPath.row];
    return cell;
}

- (IBAction)actionRefresh:(id)sender {
    [self loadPhotos];
}

@end
