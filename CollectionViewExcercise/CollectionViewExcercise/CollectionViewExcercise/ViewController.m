//
//  ViewController.m
//  CollectionViewExcercise
//
//  Created by Anand Kumar on 5/20/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import "ViewController.h"
#import "CharacterModel.h"
#import "ShowModel.h"
#import "MyCell.h"



@interface ViewController ()  <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>


@property(nonatomic, strong)NSArray *shows;
@property(nonatomic) int index;
@property(nonatomic, strong) NSArray *simpsonArray;
@property (strong, nonatomic) NSIndexPath* lastIndex;
@property (assign, nonatomic) int lastCharacter;




@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Simpson Characters";
    self.shows = [ShowModel arrayOfShows];
    
  
    

    
    // Do any additional setup after loading the view, typically from a nib.
}




//Collection Data Source here

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    
   return self.shows.count;
    
    
}


-(NSInteger)collectionView:(UICollectionView *)collectionView
    numberOfItemsInSection:(NSInteger)section
{
    ShowModel* show = self.shows[1];
    
    self.simpsonArray = show.showCharacters;
    
    return self.simpsonArray.count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView
                cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ShowModel* show = self.shows[1];
    CharacterModel* character = show.showCharacters[indexPath.row];
    
   
        MyCell* cell =
        
        [collectionView
         dequeueReusableCellWithReuseIdentifier:@"CHARACTERCELL"
         forIndexPath:indexPath];
    
        
        UIImage* photo = [UIImage imageNamed:character.image];
        cell.photoView.image = photo;
        
        return cell;
    
    
}



-(void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    ShowModel *showModelPointer =  self.shows[1];
    
    CharacterModel *characterModelPointer = showModelPointer.showCharacters[indexPath.row];
    
    
    UIImage *photo = [UIImage imageNamed:characterModelPointer.image];
    
    self.characterView.image = photo;
    
    self.characterLabel.text = characterModelPointer.name;
    
    
   //the model to click to show the image from the collection view to the image bottom.
    
    
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
