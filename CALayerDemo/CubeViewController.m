//
//  CubeViewController.m
//  CALayerDemo
//
//  Created by 吴志和 on 15/12/4.
//  Copyright © 2015年 wuzhihe. All rights reserved.
//

#import "CubeViewController.h"

/**
 *  立方体的边长
 */
static CGFloat kCubeEdgeLength = 200.0;

@interface CubeViewController ()

@property (nonatomic, strong) UIView *containerView;

@end

@implementation CubeViewController

#pragma mark - lifeCircle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupSubviews];
}

#pragma mark - viewSetup

- (void)setupSubviews
{
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.containerView];
    //front page
    CATransform3D transform1 = CATransform3DIdentity;
    transform1 = CATransform3DTranslate(transform1, 0, 0, kCubeEdgeLength / 2);
    [self addPageWithNum:1 transform:transform1];
    
    //background page
    CATransform3D transform2 = CATransform3DIdentity;
    transform2 = CATransform3DTranslate(transform2, 0, 0, -kCubeEdgeLength / 2);
    [self addPageWithNum:2 transform:transform2];
    
    //left page
    CATransform3D transform3 = CATransform3DIdentity;
    transform3 = CATransform3DRotate(transform3, M_PI_2, 0, -1, 0);
    transform3 = CATransform3DTranslate(transform3, 0, 0, kCubeEdgeLength / 2);
    [self addPageWithNum:3 transform:transform3];
    
    //right page
    CATransform3D transform4 = CATransform3DIdentity;
    transform4 = CATransform3DRotate(transform4, -M_PI_2, 0, -1, 0);
    transform4 = CATransform3DTranslate(transform4, 0, 0, kCubeEdgeLength / 2);
    [self addPageWithNum:4 transform:transform4];
    
    //top page
    CATransform3D transform5 = CATransform3DIdentity;
    transform5 = CATransform3DRotate(transform5, M_PI_2, 1, 0, 0);
    transform5 = CATransform3DTranslate(transform5, 0, 0, kCubeEdgeLength / 2);
    [self addPageWithNum:5 transform:transform5];
    
    //bottom page
    CATransform3D transform6 = CATransform3DIdentity;
    transform6 = CATransform3DRotate(transform6, -M_PI_2, 1, 0, 0);
    transform6 = CATransform3DTranslate(transform6, 0, 0, kCubeEdgeLength / 2);
    [self addPageWithNum:6 transform:transform6];
}

- (void)addPageWithNum:(NSInteger)page transform:(CATransform3D) transform
{
    UIView *view = [[UIView alloc] initWithFrame:self.containerView.bounds];
    view.layer.transform = transform;
    view.layer.borderWidth = 3.0;
    view.layer.shouldRasterize = YES; //去边界的毛刺
    view.layer.borderColor = [UIColor blackColor].CGColor;
    UILabel *numLabel = [[UILabel alloc] initWithFrame:view.bounds];
    numLabel.text = [NSString stringWithFormat:@"%@", @(page)];
    numLabel.textAlignment = NSTextAlignmentCenter;
    numLabel.font = [UIFont boldSystemFontOfSize:40];
    
    [view addSubview:numLabel];
    [self.containerView addSubview:view];
}

#pragma mark - view getter and setter

- (UIView *)containerView
{
    if (_containerView == nil) {
        _containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        _containerView.center = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2);
        CATransform3D containerTransform = CATransform3DIdentity;
        containerTransform.m34 = -1 / 500.0;
        containerTransform = CATransform3DRotate(containerTransform, -M_PI_4, 1, 0, 0);
        containerTransform = CATransform3DRotate(containerTransform, -M_PI_4, 0, 1, 0);
        _containerView .layer.sublayerTransform = containerTransform;
    }
    return _containerView;
}
#pragma mark - model getter and setter
#pragma mark - delegate
#pragma mark - notification and event

@end
