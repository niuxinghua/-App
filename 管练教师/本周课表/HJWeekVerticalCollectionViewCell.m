//
//  HJWeekVerticalCollectionViewCell.m
//  管练教师
//
//  Created by niuxinghua on 16/1/27.
//  Copyright © 2016年 com.hjojo. All rights reserved.
//

#import "HJWeekVerticalCollectionViewCell.h"
#import "Masonry.h"
@implementation HJWeekVerticalCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        _datetime=[UILabel new];
        
        _datetime.textAlignment=NSTextAlignmentCenter;
        _datetime.text=@"08:30";
        _datetime.font=[UIFont systemFontOfSize:11];
        self.backgroundColor=UIColorFromRGB(0xf9f9f9);
        [self.contentView addSubview:_datetime];
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.top.equalTo(self.mas_top);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.mas_bottom);
    }];
    [_datetime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(0);
        make.width.equalTo(self.mas_width);
        make.height.equalTo(@30);
        make.left.equalTo(self.mas_left);
    }];
    UIView* view=[UIView new];
    [self.contentView addSubview:view];
    // view.backgroundColor=UIColorFromRGB(0xe3e3e3);
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@0.3);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.mas_bottom);
    }];
    
    
}

@end
