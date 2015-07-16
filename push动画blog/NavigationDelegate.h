//
//  NavigationDelegate.h
//  push动画blog
//
//  Created by hlj on 15/7/14.
//  Copyright (c) 2015年 HLJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TransformType)
{
    TransformType_cyclo= 1,
    TransformType_common=2,
};


@interface NavigationDelegate : NSObject<UINavigationControllerDelegate>


@property (nonatomic,strong) id  context ;

@property (nonatomic,assign) TransformType  transformType ;


@end
