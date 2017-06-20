//
//  SlideAnimationController.m
//  转场动画
//
//  Created by 童万华 on 2017/6/20.
//  Copyright © 2017年 童万华. All rights reserved.
//

#import "SlideAnimationController.h"
@interface SlideAnimationController()
@property (nonatomic,assign) TYTransitionType transitionType;
@end
@implementation SlideAnimationController
-(void)setTransitionType:(TYTransitionType)transitionType {
    _transitionType = transitionType;
}
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5f;
}
-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIView *containerView = [transitionContext containerView];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    [containerView addSubview:toView];
    
    //自定义动画
    CGFloat translation = containerView.frame.size.width;
    CGAffineTransform toViewTransform = CGAffineTransformIdentity;
    CGAffineTransform fromViewTransform = CGAffineTransformIdentity;

    translation = (self.transitionType == TabTransitionLeft)?translation:-translation;
    fromViewTransform = CGAffineTransformMakeTranslation(translation, 0);
    toViewTransform = CGAffineTransformMakeTranslation(-translation, 0);
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    toView.transform = toViewTransform;
    [UIView animateWithDuration:duration animations:^{
        fromView.transform = fromViewTransform;
        toView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        fromView.transform = CGAffineTransformIdentity;
        toView.transform = CGAffineTransformIdentity;
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
        
    }];
}

@end
