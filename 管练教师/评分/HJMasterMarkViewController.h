//
//  HJMasterMarkViewController.h
//  管练教师
//
//  Created by niuxinghua on 16/1/31.
//  Copyright © 2016年 com.hjojo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HJMasterMarkViewController : UIViewController
@property(nonatomic,strong)UICollectionView* card;
@property (nonatomic, strong) UIImageView *avatar;
@property (nonatomic, strong) UILabel *namelable;
@property (nonatomic, strong) UILabel *timelable;
@property (nonatomic, strong) UILabel *lessonlable;
@property (nonatomic, strong) UILabel *marklable;
@property (nonatomic, strong) UIImageView *markimage;
@property (nonatomic, strong) UILabel *scorelable;
@property (nonatomic, strong) UIPageControl *control;

@end
