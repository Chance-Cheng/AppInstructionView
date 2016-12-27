//
//  AppInstructionView.h
//  AppInstructionView
//
//  Created by cheng on 2016/12/27.
//  Copyright © 2016年 cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHPageControl.h"

@interface AppInstructionView : UIView<UIScrollViewDelegate>

@property(nonatomic,strong)CHPageControl * pc;

@property(nonatomic,strong)UIScrollView* scrollView;

@property(nonatomic,strong)UIPageControl* pageControl;

@property(nonatomic,strong)NSArray* guideImages;

@property CGSize pageSize;

-(void)rewritePageControl;

@end
