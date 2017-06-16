//
//  TYAnimatedTranstion.h
//  转场动画
//
//  Created by 童万华 on 2017/6/15.
//  Copyright © 2017年 童万华. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger,AnimationType) {
    AnimationTypePush,
    AnimationTypePop
};
@interface TYAnimatedTranstion : NSObject<UIViewControllerAnimatedTransitioning>
@property (nonatomic,assign) AnimationType animationType;
-(instancetype)initWithAnimationType:(AnimationType)type;
@end
