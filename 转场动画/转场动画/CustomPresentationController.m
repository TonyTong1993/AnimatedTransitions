//
//  CustomPresentationController.m
//  转场动画
//
//  Created by 童万华 on 2017/6/23.
//  Copyright © 2017年 童万华. All rights reserved.
//

#import "CustomPresentationController.h"

@implementation CustomPresentationController
-(void)presentationTransitionWillBegin {
    // Add a custom dimming view behind the presented view controller's view
    [[self containerView] addSubview:_dimmingView];
    [_dimmingView addSubview:[[self presentedViewController] view]];
    
    // Use the transition coordinator to set up the animations.
    id <UIViewControllerTransitionCoordinator> transitionCoordinator =
    [[self presentingViewController] transitionCoordinator];
    
    // Fade in the dimming view during the transition.
    [_dimmingView setAlpha:0.0];
    [transitionCoordinator animateAlongsideTransition:
     ^(id<UIViewControllerTransitionCoordinatorContext> context) {
         [_dimmingView setAlpha:1.0];
     } completion:nil];
    
}
-(void)presentationTransitionDidEnd:(BOOL)completed {
    if (!completed) {
        [_dimmingView removeFromSuperview];
    }
}
-(void)dismissalTransitionWillBegin {
    
}
-(void)dismissalTransitionDidEnd:(BOOL)completed {
    
}
@end
