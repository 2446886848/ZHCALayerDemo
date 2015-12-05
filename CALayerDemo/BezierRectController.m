//
//  BezierRectController.m
//  ZHCALayerDemo
//
//  Created by 吴志和 on 15/12/5.
//  Copyright © 2015年 wuzhihe. All rights reserved.
//

#import "BezierRectController.h"

@implementation BezierRectController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupSubviews];
}

#pragma mark - viewSetup

- (void)setupSubviews
{
    self.view.backgroundColor = [UIColor whiteColor];
    CAShapeLayer *redLayer  = [CAShapeLayer layer];
    redLayer.frame = CGRectMake(100, 100, 200, 200);
    [self.view.layer addSublayer:redLayer];
    
    UIRectCorner rectCorner = UIRectCornerTopLeft | UIRectCornerBottomRight;
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 200, 200) byRoundingCorners:rectCorner cornerRadii:CGSizeMake(40, 40)];
    redLayer.lineWidth = 5.0;
    redLayer.strokeColor = [UIColor yellowColor].CGColor;
    redLayer.fillColor = [UIColor clearColor].CGColor;
    redLayer.lineJoin = kCALineJoinRound;
    redLayer.lineCap = kCALineCapRound;
    redLayer.path = path.CGPath;
}

#pragma mark - view getter and setter
#pragma mark - model getter and setter
#pragma mark - delegate
#pragma mark - notification and event
@end
