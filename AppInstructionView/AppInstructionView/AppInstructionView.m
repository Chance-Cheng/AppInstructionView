//
//  AppInstructionView.m
//  AppInstructionView
//
//  Created by cheng on 2016/12/27.
//  Copyright © 2016年 cheng. All rights reserved.
//

#import "AppInstructionView.h"


@implementation AppInstructionView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _pageSize = frame.size;
        //声明滚动视图
        _scrollView = [[UIScrollView alloc]initWithFrame:frame];
        [self addSubview:_scrollView];
        _scrollView.bounces = NO;
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        
        [self addSubview:self.pageControl];
        //添加移除操作
        UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(removeSelf)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

-(void)removeSelf{
    if (_pageControl.currentPage == _guideImages.count - 1) {
        [self removeFromSuperview];
    }
}

/**
 *  图片数组的Setting函数
 *
 *  @param guideImages 图片数组
 */
-(void)setGuideImages:(NSArray *)guideImages{
    _guideImages = guideImages;
    if (guideImages.count > 0) {
        _scrollView.contentSize = CGSizeMake(guideImages.count * _pageSize.width, _pageSize.height);
        //遍历加载所有图片
        for (int i = 0; i < guideImages.count; i ++) {
            UIImageView* imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i * _pageSize.width, 0, _pageSize.width, _pageSize.height)];
            [imageView setImage:[UIImage imageNamed:guideImages[i]]];
            [_scrollView addSubview:imageView];
        }
    }
}
#pragma mark - 重写pageControl方法
-(void)rewritePageControl{
    
    _pc = [[CHPageControl alloc]initWithFrame:CGRectMake(_pageSize.width * 0.5, _pageSize.height - 50, 0,0) currentColor:COLOR(72.0, 160.0, 220.0, 1) nextColor:COLOR(99.0, 99.0, 99.0, 1) size:8];
    [_pc setBackgroundColor:[UIColor clearColor]];
    _pc.userInteractionEnabled=NO;
    [_pc setCurrentPage:0];
    [_pc setNumberOfPages:_guideImages.count];
    
    [self addSubview:_pc];
}
#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint offset = scrollView.contentOffset;
    _pc.currentPage = round(offset.x / ScreenWidth);
}


@end
