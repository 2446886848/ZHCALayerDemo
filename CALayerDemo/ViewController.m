//
//  ViewController.m
//  CALayerDemo
//
//  Created by 吴志和 on 15/12/4.
//  Copyright © 2015年 wuzhihe. All rights reserved.
//

#import "ViewController.h"
#import "CellEntity.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *cellEntities;

@end

@implementation ViewController

#pragma mark - lifeCircle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self addEntity];
}

#pragma mark - viewSetup
#pragma mark - view getter and setter
#pragma mark - model getter and setter
- (void)addEntity
{
    self.cellEntities = @[].mutableCopy;
    
    //cube
    CellEntity *cubeCellEntity = [[CellEntity alloc] init];
    cubeCellEntity.title = @"cube";
    cubeCellEntity.destinationVc = @"CubeViewController";
    [self.cellEntities addObject:cubeCellEntity];
    
    //bezier rect
    CellEntity *BezierRectCellEntity = [[CellEntity alloc] init];
    BezierRectCellEntity.title = @"BezierRect";
    BezierRectCellEntity.destinationVc = @"BezierRectController";
    [self.cellEntities addObject:BezierRectCellEntity];
    
    //attribute string
    CellEntity *attributeStringCellEntity = [[CellEntity alloc] init];
    attributeStringCellEntity.title = @"attribute string";
    attributeStringCellEntity.destinationVc = @"AttributeTextController";
    [self.cellEntities addObject:attributeStringCellEntity];
    
    //attribute string
    CellEntity *gradientCellEntity = [[CellEntity alloc] init];
    gradientCellEntity.title = @"gradient layer";
    gradientCellEntity.destinationVc = @"GradientLayerController";
    [self.cellEntities addObject:gradientCellEntity];
    
    //attribute string
    CellEntity *replicatorCellEntity = [[CellEntity alloc] init];
    replicatorCellEntity.title = @"replicator layer";
    replicatorCellEntity.destinationVc = @"ReplicatorLayerController";
    [self.cellEntities addObject:replicatorCellEntity];
    
    [self.tableView reloadData];
}
#pragma mark - tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cellEntities.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"CALayer";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    CellEntity *entity = self.cellEntities[indexPath.row];
    cell.textLabel.text = entity.title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CellEntity *entity = self.cellEntities[indexPath.row];
    UIViewController *destVc = [[NSClassFromString(entity.destinationVc) alloc] init];
    [self.navigationController pushViewController:destVc animated:YES];
}

#pragma mark - notification and event


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
