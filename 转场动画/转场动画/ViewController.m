//
//  ViewController.m
//  转场动画
//
//  Created by 童万华 on 2017/6/15.
//  Copyright © 2017年 童万华. All rights reserved.
//

#import "ViewController.h"
#import "TYAnimatedTranstion.h"
#import "TestViewController.h"
@interface ViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.transitioningDelegate = self;
    UIButton * presentButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    presentButton.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    [self.view addSubview:presentButton];
    presentButton.backgroundColor = [UIColor blackColor];
    [presentButton setTitle:@"present" forState:UIControlStateNormal];
    [presentButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [presentButton addTarget:self action:@selector(presentClick) forControlEvents:UIControlEventTouchUpInside];
    self.view.backgroundColor = [UIColor greenColor];
}
- (void)presentClick{
    TestViewController * secondVC = [[TestViewController alloc] init];
    secondVC.transitioningDelegate = self; // 必须second同样设置delegate才有动画
    [self presentViewController:secondVC animated:YES completion:^{
    }];
}
// present动画
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return [[TYAnimatedTranstion alloc] init];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
