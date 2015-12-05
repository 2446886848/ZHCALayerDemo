//
//  GradientLayerController.m
//  ZHCALayerDemo
//
//  Created by 吴志和 on 15/12/5.
//  Copyright © 2015年 wuzhihe. All rights reserved.
//

#import "GradientLayerController.h"

@implementation GradientLayerController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupSubviews];
}

#pragma mark - viewSetup

- (void)setupSubviews
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.frame = CGRectMake(100, 100, 200, 400);
    layer.colors = @[(__bridge id)[UIColor redColor].CGColor, (__bridge id)[UIColor yellowColor].CGColor, (__bridge id)[UIColor blackColor].CGColor];
    
    layer.startPoint = CGPointMake(0.5, 0);
    layer.endPoint = CGPointMake(0.5, 1);
    [self.view.layer addSublayer:layer];
}

#pragma mark - view getter and setter
#pragma mark - model getter and setter
#pragma mark - delegate
#pragma mark - notification and event

@end
