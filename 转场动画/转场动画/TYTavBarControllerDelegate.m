//
//  TYTavBarControllerDelegate.m
//  转场动画
//
//  Created by 童万华 on 2017/6/20.
//  Copyright © 2017年 童万华. All rights reserved.
//

#import "TYTavBarControllerDelegate.h"
#import "SlideAnimationController.h"
@interface TYTavBarControllerDelegate()
@end
@implementation TYTavBarControllerDelegate
-(instancetype)init {
    self = [super init];
    if (self) {
        _interactionController = [[UIPercentDrivenInteractiveTransition alloc] init];
    }
    return self;
}
-(id<UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController animationControllerForTransitionFromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    NSUInteger fromIndex = [[tabBarController viewControllers] indexOfObject:fromVC];
    NSUInteger toIndex = [[tabBarController viewControllers] indexOfObject:toVC];
    TYTransitionType translationType = toIndex < fromIndex ? TabTransitionLeft:TabTransitionRight;
    SlideAnimationController *animationController = [[SlideAnimationController alloc] init];
    [animationController setTransitionType:translationType];
    return animationController;
}
-(id<UIViewControllerInteractiveTransitioning>)tabBarController:(UITabBarController *)tabBarController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController{
    return self.interactive?_interactionController:nil;
}
@end
