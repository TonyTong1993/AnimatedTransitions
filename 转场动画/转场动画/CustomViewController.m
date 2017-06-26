//
//  CustomViewController.m
//  转场动画
//
//  Created by 童万华 on 2017/6/23.
//  Copyright © 2017年 童万华. All rights reserved.
//

#import "CustomViewController.h"
#import "CustomPresentationController.h"
#import "TYAnimatedTranstion.h"
@interface CustomViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation CustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [button addTarget:self action:@selector(handleClicked) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"next VC" forState:UIControlStateNormal];
    button.center = self.view.center;
    button.backgroundColor = [UIColor blackColor];
    self.view.backgroundColor = [UIColor grayColor];
    self.transitioningDelegate = self;
    self.modalPresentationStyle = UIModalPresentationCustom;
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
  
}
-(UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source {
    CustomPresentationController *presentation = [[CustomPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
     CGSize screenSize = [UIScreen mainScreen].bounds.size;
    UIView *dimmingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenSize.width, screenSize.height)];
    dimmingView.backgroundColor  = [UIColor redColor];
    presentation.dimmingView = dimmingView;
    return presentation;
}
-(void)handleClicked {
    CustomViewController *VC = [[CustomViewController alloc] init];
    VC.modalPresentationStyle = UIModalPresentationCustom;
    VC.transitioningDelegate = self;
    [self presentViewController:VC animated:true completion:^{
        
    }];
}
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    TYAnimatedTranstion *animation = [[TYAnimatedTranstion alloc] initWithAnimationType:AnimationTypePop];
    return animation;
}
//
//- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
//    return nil;
//}

@end
