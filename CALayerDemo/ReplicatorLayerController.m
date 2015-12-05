//
//  ReplicatorLayerController.m
//  ZHCALayerDemo
//
//  Created by 吴志和 on 15/12/5.
//  Copyright © 2015年 wuzhihe. All rights reserved.
//

#import "ReplicatorLayerController.h"

@implementation ReplicatorLayerController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupSubviews];
}

#pragma mark - viewSetup

- (void)setupSubviews
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat animationDuration = 1.0;
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.backgroundColor = [UIColor redColor].CGColor;
    replicatorLayer.frame = CGRectMake(100, 100, 200, 200);
    replicatorLayer.instanceCount = 15;
    replicatorLayer.instanceDelay = animationDuration / replicatorLayer.instanceCount;
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DRotate(transform, M_PI * 2 / replicatorLayer.instanceCount, 0, 0, 1);
    replicatorLayer.instanceTransform = transform;
    [self.view.layer addSublayer:replicatorLayer];
    
    CAShapeLayer *dotLayer = [CAShapeLayer layer];
    dotLayer.bounds = CGRectMake(0, 0, 20, 20);
    dotLayer.position = CGPointMake(replicatorLayer.bounds.size.width / 2, 30);
    dotLayer.backgroundColor = [UIColor whiteColor].CGColor;
    dotLayer.cornerRadius = dotLayer.bounds.size.width / 2;
    [replicatorLayer addSublayer:dotLayer];
    
    dotLayer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.duration = animationDuration;
    animation.fromValue = @(1);
    animation.toValue = @(0.1);
    animation.repeatCount = MAXFLOAT;
    
    [dotLayer addAnimation:animation forKey:@"transform.scale"];
}

#pragma mark - view getter and setter
#pragma mark - model getter and setter
#pragma mark - delegate
#pragma mark - notification and event
@end
