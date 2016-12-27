//
//  PageControl.h
//  AppInstructionView
//
//  Created by cheng on 2016/12/27.
//  Copyright © 2016年 cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHPageControl : UIPageControl

@property(nonatomic,strong)UIColor *currentColor;
@property(nonatomic,strong)UIColor *nextColor;
@property(nonatomic,assign)float Size;

- (id)initWithFrame:(CGRect)frame currentColor:(UIColor*)currentColor nextColor:(UIColor*)nextColor size:(CGFloat)size;
-(void)setCurrentPage:(NSInteger)page;

@end
