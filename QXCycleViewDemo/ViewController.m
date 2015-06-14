//
//  ViewController.m
//  QXCycleViewDemo
//
//  Created by QinXin on 15/6/14.
//  Copyright (c) 2015年 labi3285_Lab. All rights reserved.
//

#import "ViewController.h"
#import "QXCycleView.h"

@interface ViewController ()

@property (nonatomic, weak) QXCycleView *cycleView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    // 基本的创建方法
    QXCycleView *cycleView = [[QXCycleView alloc] init];
    
    cycleView.frame = CGRectMake(50, 50, 200, 200);
    
    [self.view addSubview:cycleView];
    self.cycleView = cycleView;
    
    // 添加数据源
    cycleView.imagePaths = @[
                             [[NSBundle mainBundle] pathForResource:@"00.jpg" ofType:nil],
                             [[NSBundle mainBundle] pathForResource:@"01.jpg" ofType:nil],
                             [[NSBundle mainBundle] pathForResource:@"02.jpg" ofType:nil],
                             [[NSBundle mainBundle] pathForResource:@"03.jpg" ofType:nil],
                             [[NSBundle mainBundle] pathForResource:@"04.jpg" ofType:nil],
                             [[NSBundle mainBundle] pathForResource:@"05.jpg" ofType:nil],
                             [[NSBundle mainBundle] pathForResource:@"06.jpg" ofType:nil],
                             [[NSBundle mainBundle] pathForResource:@"07.jpg" ofType:nil],
                             ];
    // 添加监听
    [cycleView addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventValueChanged];

}

- (IBAction)pre {
    [self.cycleView pre];
}

- (IBAction)next {
    [self.cycleView next];
}

- (void)valueChange:(QXCycleView *)cycleView {
    NSLog(@"index:%lu", cycleView.index);
}


@end
