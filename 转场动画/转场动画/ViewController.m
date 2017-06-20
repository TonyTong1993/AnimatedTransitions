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
#import "TYTavBarControllerDelegate.h"
@interface ViewController ()<UIViewControllerTransitioningDelegate>{
    NSUInteger subViewControllerCount;
}
@property (nonatomic,retain) UIPanGestureRecognizer *panGesture;
@property (nonatomic,strong) TYTavBarControllerDelegate *tabBarVCDelegate;

@end
@implementation ViewController
-(UIPanGestureRecognizer *)panGesture {
    if (!_panGesture) {
        _panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    }
    return _panGesture;
}
-(TYTavBarControllerDelegate *)tabBarVCDelegate {
    if (!_tabBarVCDelegate) {
        _tabBarVCDelegate = [[TYTavBarControllerDelegate alloc] init];
    }
    return _tabBarVCDelegate;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    subViewControllerCount = [self viewControllers].count;
    [self.view addGestureRecognizer:self.panGesture];
    self.delegate = self.tabBarVCDelegate;
}
-(void)handlePan:(UIPanGestureRecognizer *)panGesture {
    CGFloat translationX = [panGesture translationInView:self.view].x;
    CGFloat translationXAbs = fabs(translationX);
    CGFloat progress = translationXAbs / self.view.frame.size.width;
    switch (panGesture.state) {
        case UIGestureRecognizerStateBegan:
        {
            
            _tabBarVCDelegate.interactive = true;
            CGFloat velocityX = [panGesture velocityInView:self.view].x;
            if (velocityX < 0) {
                if (self.selectedIndex < subViewControllerCount -1) {
                    self.selectedIndex += 1;
                }
            }else {
                if (self.selectedIndex > 0) {
                    self.selectedIndex -= 1;
                }
            }
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            [self.tabBarVCDelegate.interactionController updateInteractiveTransition:progress];
        }
            break;
        case UIGestureRecognizerStateCancelled:
        {
            if (progress > 0.3) {
                self.tabBarVCDelegate.interactionController.completionSpeed = 0.99;
                [self.tabBarVCDelegate.interactionController finishInteractiveTransition];
            }else {
                self.tabBarVCDelegate.interactionController.completionSpeed = 0.99;
                [self.tabBarVCDelegate.interactionController cancelInteractiveTransition];
            }
            self.tabBarVCDelegate.interactive = false;
        }
            break;
            case UIGestureRecognizerStateEnded:
        {
            
            if (progress > 0.3) {
                self.tabBarVCDelegate.interactionController.completionSpeed = 0.99;
                [self.tabBarVCDelegate.interactionController finishInteractiveTransition];
            }else {
                self.tabBarVCDelegate.interactionController.completionSpeed = 0.99;
                [self.tabBarVCDelegate.interactionController cancelInteractiveTransition];
            }
            self.tabBarVCDelegate.interactive = false;
        }
            break;
        default:
            break;
    }
}
@end
