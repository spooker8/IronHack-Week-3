//
//  ViewController.m
//  AutoLayout
//
//  Created by Anand Kumar on 5/19/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"

@interface ViewController ()  <UITableViewDataSource, UITableViewDelegate>

@end

@implementation ViewController





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}



#pragma mark - UITableViewDataSource Protocol required methods implementation


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

     return 3;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CHARACTER"];
    
    
    switch (indexPath.row) {
            
        case 0:
            cell.myText.text = @"text";
            
            
        case 1:
            cell.myText.text = @"text";
            
            
        case 2:
            cell.myText.text = @"text";
            break;
            
        default:
            break;
            
    }

    return cell;

}



//#pragma mark - UITableViewDataSource Protocol required methods implementation
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 3;
//}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
