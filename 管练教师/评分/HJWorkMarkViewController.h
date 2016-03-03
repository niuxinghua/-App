//
//  HJWorkMarkViewController.h
//  管练教师
//
//  Created by niuxinghua on 16/1/28.
//  Copyright © 2016年 com.hjojo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CWStarRateView.h"
typedef void (^ backblock) (CGFloat mark);
@interface HJWorkMarkViewController : UIViewController
@property (nonatomic, strong) UIView *backwhite;
@property (nonatomic, strong) CWStarRateView *practiceView;
@property (nonatomic, strong) CWStarRateView *atitudeView;
@property (nonatomic, copy) backblock block;
@end
