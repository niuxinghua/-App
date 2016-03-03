//
//  HJWeekContentCollectionViewCell.h
//  管练教师
//
//  Created by niuxinghua on 16/1/27.
//  Copyright © 2016年 com.hjojo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HJWeekContentCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) UILabel *marklable;
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UIImageView *circle;
-(void)setHJSelected:(BOOL)selected;
@end
