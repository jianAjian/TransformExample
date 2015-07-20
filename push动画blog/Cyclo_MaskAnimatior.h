//
//  Cyclo_MaskAnimatior.h
//  push动画blog
//
//  Created by hlj on 15/7/15.
//  Copyright (c) 2015年 HLJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Cyclo_MaskAnimatior : UIPercentDrivenInteractiveTransition<UIViewControllerAnimatedTransitioning>


+(Cyclo_MaskAnimatior *)animatiorWithBeginPosition:(CGPoint )beginPosition;

@end
