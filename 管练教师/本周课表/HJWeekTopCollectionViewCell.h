//
//  HJWeekTopCollectionViewCell.h
//  管练教师
//
//  Created by niuxinghua on 16/1/27.
//  Copyright © 2016年 com.hjojo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HJWeekTopCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) UILabel *datetime;
@property (nonatomic, strong) UILabel *weektime;
@property (nonatomic, strong) UIImageView *circle;
-(void)setHJSelected:(BOOL)selected;
@end
