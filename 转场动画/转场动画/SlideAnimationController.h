//
//  SlideAnimationController.h
//  转场动画
//
//  Created by 童万华 on 2017/6/20.
//  Copyright © 2017年 童万华. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger,TYTransitionType){
    NavigationTransitionPush,
    NavigationTransitionPop,
    NavigationTransitionNone,
    TabTransitionLeft,
    TabTransitionRight,
    ModalTransitionPresentation,
    ModalTransitionDismissal,
};
//typedef enum {
//    Push,
//    Pop,
//    None
//} NavgationTransitionOption;
//typedef enum {
//    Left,
//    Right
//} TabOperationDirection;
//typedef enum {
//    Presentation,
//    Dismissal
//} ModalOperation;

@interface SlideAnimationController : NSObject<UIViewControllerAnimatedTransitioning>
-(void)setTransitionType:(TYTransitionType)transitionType;

@end
