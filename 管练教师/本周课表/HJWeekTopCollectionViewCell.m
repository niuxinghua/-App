//
//  HJWeekTopCollectionViewCell.m
//  管练教师
//
//  Created by niuxinghua on 16/1/27.
//  Copyright © 2016年 com.hjojo. All rights reserved.
//

#import "HJWeekTopCollectionViewCell.h"
#import "Masonry.h"
@implementation HJWeekTopCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        _weektime=[UILabel new];
        _datetime=[UILabel new];
        _circle=[UIImageView new];
        _circle.backgroundColor=[UIColor colorWithRed:24/255.0 green:179/255.0 blue:137/255.0 alpha:1.0];
        _circle.layer.cornerRadius=15;
        _circle.layer.masksToBounds=YES;
        _datetime.font=[UIFont systemFontOfSize:15];
        _datetime.textColor=[UIColor blackColor];
        self.backgroundColor=UIColorFromRGB(0xeeeeee);
        _weektime.font=[UIFont systemFontOfSize:11];
        _weektime.textColor=UIColorFromRGB(0x666666);
        
        [self.contentView addSubview:_circle];
        [self.contentView addSubview:_weektime];
        [self.contentView addSubview:_datetime];
        _weektime.textAlignment=NSTextAlignmentCenter;
        _datetime.textAlignment=NSTextAlignmentCenter;
        _datetime.text=@"20";
        _weektime.text=@"六";
        _circle.hidden=YES;
    }
    return self;
}
-(void)setHJSelected:(BOOL)selected{
    _circle.hidden=!selected;
    _datetime.hidden=NO;
    _weektime.hidden=NO;
    if (selected) {
        _datetime.textColor=[UIColor whiteColor];
        
    }else{
        _datetime.textColor=[UIColor blackColor];
    }
    
    
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
        make.top.equalTo(self.mas_top).offset(10);
        make.width.equalTo(self.mas_width);
        make.height.equalTo(@30);
        make.left.equalTo(self.mas_left);
    }];
    [_circle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_datetime.mas_centerX);
        make.centerY.equalTo(_datetime.mas_centerY);
        make.height.width.equalTo(@30);
        
    }];
    [_weektime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.top.equalTo(_datetime.mas_bottom).offset(0);
        make.bottom.equalTo(self.mas_bottom);
    }];
    UIView* view=[UIView new];
    [self.contentView addSubview:view];
    view.backgroundColor=UIColorFromRGB(0xe3e3e3);
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@0.3);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.mas_bottom);
    }];
    _circle.layer.cornerRadius=15;
    _circle.layer.masksToBounds=YES;
    
}
@end
