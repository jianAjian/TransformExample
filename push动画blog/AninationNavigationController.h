//
//  AninationNavigationController.h
//  push动画blog
//
//  Created by hlj on 15/7/14.
//  Copyright (c) 2015年 HLJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationDelegate.h"

@interface AninationNavigationController : UINavigationController

-(void)pushViewController:(UIViewController *)viewController WithType:(TransformType )type Context:(id)context;


-(UIViewController *)popViewControllerWithType:(TransformType)type Context:(id)context;


@end
