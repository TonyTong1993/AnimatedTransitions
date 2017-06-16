//
//  TestViewController.m
//  转场动画
//
//  Created by 童万华 on 2017/6/16.
//  Copyright © 2017年 童万华. All rights reserved.
//

#import "TestViewController.h"
#import "TYAnimatedTranstion.h"
@interface TestViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.transitioningDelegate = self;
    // Do any additional setup after loading the view.
    UIButton * presentButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    presentButton.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    [self.view addSubview:presentButton];
    presentButton.backgroundColor = [UIColor blackColor];
    [presentButton setTitle:@"back" forState:UIControlStateNormal];
    [presentButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [presentButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
}
- (void)back {
    [self dismissViewControllerAnimated:true completion:^{
        
    }];
}
// present动画
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return [[TYAnimatedTranstion alloc] init];
}
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
     return [[TYAnimatedTranstion alloc] init];
}
@end
