//
//  PageControl.m
//  AppInstructionView
//
//  Created by cheng on 2016/12/27.
//  Copyright © 2016年 cheng. All rights reserved.
//

#import "CHPageControl.h"

@implementation CHPageControl


- (id)initWithFrame:(CGRect)frame currentColor:(UIColor*)currentColor nextColor:(UIColor*)nextColor size:(CGFloat)size{
    self=[super initWithFrame:frame];
    if (self) {
        _currentColor=currentColor;
        _nextColor=nextColor;
        _Size=size;
    }
    return self;
}
- (void)setCurrentPage:(NSInteger)page{
    [super setCurrentPage:page];
    if (_Size) {
        for (NSUInteger subviewIndex = 0; subviewIndex < [self.subviews count]; subviewIndex++) {
            UIView* subview = [self.subviews objectAtIndex:subviewIndex];
            CGSize size;
            size.height = _Size;
            size.width = _Size;
            [subview setFrame:CGRectMake(subview.frame.origin.x, subview.frame.origin.y, size.width, size.height)];
            if (subviewIndex == page){
                [subview setBackgroundColor:_currentColor];
            }else{
                [subview setBackgroundColor:_nextColor];
            }
        }
    }
}
@end
