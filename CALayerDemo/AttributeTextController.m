//
//  AttributeTextController.m
//  ZHCALayerDemo
//
//  Created by 吴志和 on 15/12/5.
//  Copyright © 2015年 wuzhihe. All rights reserved.
//

#import "AttributeTextController.h"
#import <CoreText/CoreText.h>

@implementation AttributeTextController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupSubviews];
}

#pragma mark - viewSetup

- (void)setupSubviews
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = CGRectMake(100, 100, 200, 200);
    textLayer.wrapped = YES;
    textLayer.contentsScale = [UIScreen mainScreen].scale;
    textLayer.alignmentMode = kCAAlignmentCenter;
    [self.view.layer addSublayer:textLayer];
    
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"The text layer provides simple text layout and rendering of plain or attributed strings. The first line is aligned to the top of the layer."];
    NSDictionary *dict = @{(__bridge id)kCTFontAttributeName : [UIFont systemFontOfSize:15], (__bridge id)kCTForegroundColorAttributeName : (__bridge id)[UIColor redColor].CGColor};
    [string addAttributes:dict range:NSMakeRange(5, 10)];
    textLayer.string = string;
}

#pragma mark - view getter and setter
#pragma mark - model getter and setter
#pragma mark - delegate
#pragma mark - notification and event

@end
