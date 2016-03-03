//
//  HJChartCollectionViewCell.m
//  MusicLove
//
//  Created by niuxinghua on 16/1/25.
//  Copyright © 2016年 Hjojo. All rights reserved.
//

#import "HJChartCollectionViewCell.h"
#import "PNPlot.h"
#import "Masonry.h"
@implementation HJChartCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        NSArray* plottingDataValues1 =@[@4, @2, @3, @1,@5];
        NSArray*  xvalues=@[@"11-11",@"11-12",@"11-13",@"11-14",@"11-15"];
        self.chart=[[PNLineChartView alloc]initWithFrame:CGRectMake(0, 0, 200, 100)];
        self.chart.max = 5;
        self.chart.min = 0;
        self.chart.backgroundColor=[UIColor whiteColor];
        self.chart.interval=1.0;
        
        NSMutableArray* yAxisValues = [@[] mutableCopy];
        for (int i=0; i<6; i++) {
            int d=[[NSNumber numberWithFloat:(self.chart.min+self.chart.interval*i)] intValue];
            NSString* str = [NSString stringWithFormat:@"%d",d];
            [yAxisValues addObject:str];
        }
        
        self.chart.xAxisValues=xvalues;
        self.chart.yAxisValues = yAxisValues;
        self.chart.axisLeftLineWidth = 39;
        
        
        PNPlot *plot1 = [[PNPlot alloc] init];
        plot1.plottingValues = plottingDataValues1;
        
        plot1.lineColor = UIColorFromRGB(0xfe9200);
        plot1.lineWidth = 0.5;
        
        [self.chart addPlot:plot1];
        [self.contentView addSubview:self.chart];
        // Do any additional setup after loading the view from its nib.
        
        _titleLable=[UILabel new];
        _grayView=[UIView new];
        _needLable=[UILabel new];
        _lianxiTitle=[UILabel new];
        _weekLable=[UILabel new];
        _markview=[[CWStarRateView alloc]initWithFrame:CGRectMake(0, 0, 200, 20) numberOfStars:5];
        _markview.scorePercent = 1;
        _markview.allowIncompleteStar = YES;
        _markview.hasAnimation = YES;
        
        [self.contentView addSubview:_weekLable];
        [self.contentView addSubview:_grayView];
        [self.contentView addSubview:_titleLable];
        [self.contentView addSubview:_needLable];
        [self.contentView addSubview:_lianxiTitle];
        [self.contentView addSubview:_markview];
        _grayView.backgroundColor=[UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1.0];
        _titleLable.textColor=UIColorFromRGB(0x333333);
        _titleLable.font=[UIFont systemFontOfSize:15];
        _needLable.textColor=UIColorFromRGB(0x333333);
        _needLable.font=[UIFont systemFontOfSize:15];
        _needLable.numberOfLines=0;
        _lianxiTitle.textColor=UIColorFromRGB(0x333333);
        _lianxiTitle.font=[UIFont systemFontOfSize:15];
        _weekLable.textColor=UIColorFromRGB(0x333333);
        _weekLable.font=[UIFont systemFontOfSize:15];
        
        
    }
    
    
    
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.layer.cornerRadius=8;
    self.layer.masksToBounds=YES;
    [_grayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.top.equalTo(self.mas_top);
        make.width.equalTo(self.mas_width);
        make.height.equalTo(@110);
    }];
    [_titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(15);
        make.top.equalTo(self.mas_top).offset(45/2);
        make.right.equalTo(self.mas_right).offset(-15);
        make.height.equalTo(@30);
    }];
    [_needLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLable.mas_bottom).offset(25/2.0);
        make.bottom.equalTo(_grayView.mas_bottom).offset(-45/2.0);
        make.left.equalTo(_titleLable.mas_left);
        make.right.equalTo(_titleLable.mas_right);
    }];
    [_chart mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(0);
        //make.top.equalTo(_grayView);
        make.height.greaterThanOrEqualTo(@240);
        make.bottom.equalTo(self.mas_bottom);
        make.right.equalTo(self.mas_right).offset(0);
    }];
    [_lianxiTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_titleLable.mas_left);
        make.top.equalTo(_grayView.mas_bottom).offset(5);
        make.width.equalTo(@100);
        make.height.equalTo(@30);
    }];
    [_weekLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_lianxiTitle.mas_top);
        make.right.equalTo(self.mas_right).offset(-15);
        make.width.equalTo(@60);
        make.height.equalTo(_lianxiTitle.mas_height);
    }];
    [_markview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.right.equalTo(self.mas_right);
        make.height.equalTo(@50);
        make.top.equalTo(_weekLable.mas_bottom).offset(10);
    }];
    _needLable.numberOfLines=0;
    _markview.userInteractionEnabled=NO;
    _weekLable.text=@"第二周";
    _lianxiTitle.text=@"练习情况";
    _titleLable.text=@"作业:车尼尔 op.599  NO56";
    _needLable.text=@"要求:上周谈的不够熟练。本周应该加强练习cccccccccccdhcjsdchbdjshchjsdhcjsdchjbcdshjbcjbchabcsdkbckbkdbcdksbfkabdkasbchjsbebbjrbfhkwrbfhhwfbwefbwie";
}
#pragma mark-setters
-(void)setXdata:(NSArray *)xdata{
    _chart.xAxisValues=xdata;
    [self setNeedsDisplay];
}
@end
