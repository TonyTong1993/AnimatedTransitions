//
//  TYAnimatedTranstion.m
//  转场动画
//
//  Created by 童万华 on 2017/6/15.
//  Copyright © 2017年 童万华. All rights reserved.
//

#import "TYAnimatedTranstion.h"

@implementation TYAnimatedTranstion
-(instancetype)initWithAnimationType:(AnimationType)type {
    self = [super init];
    if (self) {
        _animationType = type;
    }
    return self;
}
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.35f;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
   UIView *container = [transitionContext containerView];
    [container addSubview:toVC.view];
    [container bringSubviewToFront:fromVC.view];
    if (_animationType == AnimationTypePop) {
        [self animation1:container toVC:toVC transitionContext:transitionContext fromVC:fromVC];
    }else {
         [self animation0:container toVC:toVC transitionContext:transitionContext fromVC:fromVC];
    }
    //自定义动画
}
-(void)animation0:(UIView *)container toVC:(UIViewController *)toVC transitionContext:(id<UIViewControllerContextTransitioning>)transitionContext fromVC:(UIViewController *)fromVC {
    // 改变m34
    CATransform3D transfrom = CATransform3DIdentity;
    transfrom.m34 = -0.002;
    container.layer.sublayerTransform = transfrom;
    
    // 设置archPoint和position
    CGRect initalFrame = [transitionContext initialFrameForViewController:fromVC];
    toVC.view.frame = initalFrame;
    fromVC.view.frame = initalFrame;
    fromVC.view.layer.anchorPoint = CGPointMake(0, 0.5);
    fromVC.view.layer.position = CGPointMake(0, initalFrame.size.height / 2.0);
    
    // 添加阴影效果
    CAGradientLayer * shadowLayer = [[CAGradientLayer alloc] init];
    shadowLayer.colors =@[
                          [UIColor colorWithWhite:0 alpha:1],
                          [UIColor colorWithWhite:0 alpha:0.5],
                          [UIColor colorWithWhite:1 alpha:0.5]
                          ];
    shadowLayer.startPoint = CGPointMake(0, 0.5);
    shadowLayer.endPoint = CGPointMake(1, 0.5);
    shadowLayer.frame = initalFrame;
    
    UIView * shadow = [[UIView alloc] initWithFrame:initalFrame];
    shadow.backgroundColor = [UIColor clearColor];
    [shadow.layer addSublayer:shadowLayer];
    [fromVC.view addSubview:shadow];
    shadow.alpha = 0;
    
    // 动画
    [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext] delay:0 options:2 animations:^{
        fromVC.view.layer.transform = CATransform3DMakeTranslation(-[UIScreen mainScreen].bounds.size.width, 0,0);//CATransform3DMakeRotation(-M_PI_2, 0, 1, 0);
        shadow.alpha = 1.0;
    } completion:^(BOOL finished) {
        fromVC.view.layer.anchorPoint = CGPointMake(0.5, 0.5);
        fromVC.view.layer.position = CGPointMake(CGRectGetMidX(initalFrame), CGRectGetMidY(initalFrame));
        fromVC.view.layer.transform = CATransform3DIdentity;
        [shadow removeFromSuperview];
        [transitionContext completeTransition:YES];
    }];
}
-(void)animation1:(UIView *)container toVC:(UIViewController *)toVC transitionContext:(id<UIViewControllerContextTransitioning>)transitionContext fromVC:(UIViewController *)fromVC {
    // 改变m34
    CATransform3D transfrom = CATransform3DIdentity;
    transfrom.m34 = -0.002;
    container.layer.sublayerTransform = transfrom;
    
    // 设置archPoint和position
    CGRect initalFrame = [transitionContext initialFrameForViewController:fromVC];
    toVC.view.frame = initalFrame;
    fromVC.view.frame = initalFrame;
    fromVC.view.layer.anchorPoint = CGPointMake(0, 0.5);
    fromVC.view.layer.position = CGPointMake(0, initalFrame.size.height / 2.0);
    
    // 添加阴影效果
    CAGradientLayer * shadowLayer = [[CAGradientLayer alloc] init];
    shadowLayer.colors =@[
                          [UIColor colorWithWhite:0 alpha:1],
                          [UIColor colorWithWhite:0 alpha:0.5],
                          [UIColor colorWithWhite:1 alpha:0.5]
                          ];
    shadowLayer.startPoint = CGPointMake(0, 0.5);
    shadowLayer.endPoint = CGPointMake(1, 0.5);
    shadowLayer.frame = initalFrame;
    
    UIView * shadow = [[UIView alloc] initWithFrame:initalFrame];
    shadow.backgroundColor = [UIColor clearColor];
    [shadow.layer addSublayer:shadowLayer];
    [fromVC.view addSubview:shadow];
    shadow.alpha = 0;
    
    // 动画
    [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext] delay:0 options:2 animations:^{
        fromVC.view.layer.transform = CATransform3DMakeTranslation([UIScreen mainScreen].bounds.size.width, 0,0);//CATransform3DMakeRotation(-M_PI_2, 0, 1, 0);
        shadow.alpha = 1.0;
    } completion:^(BOOL finished) {
        fromVC.view.layer.anchorPoint = CGPointMake(0.5, 0.5);
        fromVC.view.layer.position = CGPointMake(CGRectGetMidX(initalFrame), CGRectGetMidY(initalFrame));
        fromVC.view.layer.transform = CATransform3DIdentity;
        [shadow removeFromSuperview];
        [transitionContext completeTransition:YES];
    }];
}
@end
