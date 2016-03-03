//
//  HJChartCollectionViewCell.h
//  MusicLove
//
//  Created by niuxinghua on 16/1/25.
//  Copyright © 2016年 Hjojo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PNLineChartView.h"
#import "CWStarRateView.h"
@interface HJChartCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) PNLineChartView *chart;
@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) UILabel *needLable;
@property (nonatomic, strong) UIView *grayView;
@property (nonatomic, strong) UILabel *lianxiTitle;
@property (nonatomic, strong) UILabel *weekLable;
@property (nonatomic, strong) NSArray *nodedata;
@property (nonatomic, strong) NSArray *xdata;
@property (nonatomic, strong) NSArray *ydata;
@property (nonatomic, strong) CWStarRateView *markview;
@end
