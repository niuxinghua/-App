//
//  HJWeekContentCollectionViewCell.m
//  管练教师
//
//  Created by niuxinghua on 16/1/27.
//  Copyright © 2016年 com.hjojo. All rights reserved.
//

#import "HJWeekContentCollectionViewCell.h"
#import "Masonry.h"
@implementation HJWeekContentCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        _marklable=[UILabel new];
        _circle=[UIImageView new];
        _backView=[UIView new];
        _backView.backgroundColor=UIColorFromRGB(0xf8f8f8);
        _circle.backgroundColor=[UIColor colorWithRed:24/255.0 green:179/255.0 blue:137/255.0 alpha:1.0];
        _marklable.textAlignment=NSTextAlignmentCenter;
        _marklable.text=@"5";
        _marklable.textAlignment=NSTextAlignmentCenter;
        _marklable.font=[UIFont systemFontOfSize:11];
        self.backgroundColor=[UIColor whiteColor];
        [self.contentView addSubview:_backView];
        [self.contentView addSubview:_circle];
        [self.contentView addSubview:_marklable];
        _circle.hidden=YES;
        _backView.hidden=YES;
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
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom);
        make.left.equalTo(self.mas_left).offset(2.5);
        make.right.equalTo(self.mas_right).offset(-2.5);
    }];
    
    [_circle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY);
        make.height.width.equalTo(@25);
    }
     ];
    [_marklable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.mas_width);
        make.height.equalTo(@30);
        make.centerX.equalTo(_circle.mas_centerX);
        make.centerY.equalTo(self.mas_centerY);
    }];
    _circle.layer.cornerRadius=25/2.0;
    _circle.layer.masksToBounds=YES;
    UIView* view=[UIView new];
    [self.contentView addSubview:view];
    view.backgroundColor=UIColorFromRGB(0xe3e3e3);
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@0.3);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.mas_bottom);
    }];
    UIView* whitecircle=[UIView new];
    [_circle addSubview:whitecircle];
    [whitecircle mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(_circle.mas_bottom).offset(-2);
        make.centerX.equalTo(_circle.mas_centerX);
        make.height.width.equalTo(@4);
    }];
    
    whitecircle.backgroundColor=[UIColor whiteColor];
    whitecircle.layer.cornerRadius=2;
    whitecircle.layer.masksToBounds=YES;
}
-(void)setHJSelected:(BOOL)selected{
    _circle.hidden=!selected;
    _backView.hidden=!selected;
    if (selected) {
        _marklable.textColor=[UIColor whiteColor];
        
    }else{
        
        _marklable.textColor=[UIColor blackColor];
    }
    
    
}

@end
