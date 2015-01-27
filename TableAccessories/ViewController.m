//
//  ViewController.m
//  TableAccessories
//
//  Created by pradip on 1/27/15.
//  Copyright (c) 2015 pradip. All rights reserved.
//

#import "ViewController.h"

static NSString *MyCellIdentifier = @"SimpleCell";

@interface ViewController () <UITableViewDataSource>
@property (nonatomic, strong) UITableView *myTableView;
@end

@implementation ViewController

- (void)                        tableView:(UITableView *)tableView
 accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    
    /* Do something when the accessory button is tapped */
    NSLog(@"Accessory button is tapped for cell at index path = %@", indexPath);
    
    UITableViewCell *ownerCell = [tableView cellForRowAtIndexPath:indexPath];
    
    NSLog(@"Cell Title = %@", ownerCell.textLabel.text);
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* result = nil;
    
    if ([tableView isEqual:self.myTableView]){
        
        result = [tableView
                  dequeueReusableCellWithIdentifier:MyCellIdentifier
                  forIndexPath:indexPath];
        
        result.textLabel.text =
        [NSString stringWithFormat:@"Section %ld, Cell %ld",
         (long)indexPath.section,
         (long)indexPath.row];
        
        result.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        
    }
    
    return result;
    
}

- (NSInteger) tableView:(UITableView *)tableView
  numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.myTableView = [[UITableView alloc]
                        initWithFrame:self.view.bounds
                        style:UITableViewStylePlain];
    
    [self.myTableView registerClass:[UITableViewCell class]
             forCellReuseIdentifier:MyCellIdentifier];
    
    self.myTableView.dataSource = self;
    
    self.myTableView.autoresizingMask =
    UIViewAutoresizingFlexibleWidth |
    UIViewAutoresizingFlexibleHeight;
    
    [self.view addSubview:self.myTableView];
    
}


@end
