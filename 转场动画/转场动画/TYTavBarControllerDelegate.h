//
//  TYTavBarControllerDelegate.h
//  转场动画
//
//  Created by 童万华 on 2017/6/20.
//  Copyright © 2017年 童万华. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface TYTavBarControllerDelegate : NSObject<UITabBarControllerDelegate>
@property (nonatomic,assign) BOOL interactive;
@property (nonatomic,retain) UIPercentDrivenInteractiveTransition *interactionController;
@end
