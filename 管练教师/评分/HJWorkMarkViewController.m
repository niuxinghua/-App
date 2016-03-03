//
//  HJWorkMarkViewController.m
//  管练教师
//
//  Created by niuxinghua on 16/1/28.
//  Copyright © 2016年 com.hjojo. All rights reserved.
//

#import "HJWorkMarkViewController.h"
#import "Masonry.h"
@interface HJWorkMarkViewController ()

@end

@implementation HJWorkMarkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor=[UIColor whiteColor];
    // Do any additional setup after loading the view.
    self.title=@"作业评分";
    self.view.backgroundColor=UIColorFromRGB(0xe3e3e3);
    [self setUPUI];
}
-(void)setUPUI{
    _atitudeView=[[CWStarRateView alloc]initWithFrame:CGRectMake(0, 0, 200, 20) numberOfStars:5];
    _practiceView = [[CWStarRateView alloc] initWithFrame:CGRectMake(10, 100, 200, 20) numberOfStars:5];
    _atitudeView.scorePercent = 0;
    _practiceView.scorePercent = 0;
    _practiceView.allowIncompleteStar = NO;
    _practiceView.hasAnimation = YES;
    
    
    _backwhite=[UIView new];
    [self.view addSubview:_backwhite];
    [_backwhite addSubview:_atitudeView];
    [self.view addSubview:_practiceView];
    
    _backwhite.backgroundColor=[UIColor whiteColor];
    [_backwhite mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuide).offset(10);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo(@((248+69)/2.0));
    }];
    UILabel* practice=[UILabel new];
    practice.text=@"练习评分";
    practice.font=[UIFont systemFontOfSize:15];
    practice.textColor=[UIColor blackColor];
    [self.view addSubview:practice];
    [practice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(15);
        make.top.equalTo(_backwhite.mas_top).offset(10);
        make.height.equalTo(@40);
        make.width.equalTo(@100);
    }];
    [_practiceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(practice.mas_right);
        // make.centerY.equalTo(practice.mas_centerY);
        make.top.equalTo(practice.mas_top).offset(10);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo(practice.mas_height);
    }];
    [_atitudeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(practice.mas_right);
        // make.centerY.equalTo(practice.mas_centerY);
        make.top.equalTo(_practiceView.mas_bottom).offset(15);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo(practice.mas_height);
    }];
    UILabel* lat=[UILabel new];
    lat.text=@"态度评分";
    lat.font=[UIFont systemFontOfSize:15];
    lat.textColor=[UIColor blackColor];
    [self.view addSubview:lat];
    [lat mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(15);
        make.top.equalTo(practice.mas_bottom).offset(10);
        make.height.equalTo(@40);
        make.width.equalTo(@100);
    }];
    UIView* grayview=[UIView new];
    grayview.backgroundColor=UIColorFromRGB(0xe3e3e3);
    [self.view addSubview:grayview];
    [grayview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.height.height.equalTo(@0.3);
        make.top.equalTo(_atitudeView.mas_bottom);
    }];
    UILabel* info=[UILabel new];
    info.text=@"评分后取平均值为最后评分";
    info.font=[UIFont systemFontOfSize:12];
    info.textColor=UIColorFromRGB(0x666666);
    [self.view addSubview:info];
    [info mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(grayview.mas_bottom).offset(5);
        make.left.equalTo(self.view.mas_left).offset(15);
        make.width.equalTo(@200);
        make.height.equalTo(@(69/2));
    }];
    UIButton* save=[UIButton new];
    save.backgroundColor=[UIColor colorWithRed:24/255.0 green:179/255.0 blue:137/255.0 alpha:1.0];
    [save setTitle:@"提交" forState:UIControlStateNormal];
    [save setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:save];
    [save addTarget:self action:@selector(save) forControlEvents:UIControlEventTouchUpInside];
    save.layer.cornerRadius=5;
    
    [save mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(15);
        make.right.equalTo(self.view.mas_right).offset(-15);
        make.height.equalTo(@44);
        make.top.equalTo(_backwhite.mas_bottom).offset(20);
    }];
}
-(void)save{
    if (self.block) {
        self.block((_practiceView.scorePercent+_atitudeView.scorePercent)/2);
        
        [self.navigationController popViewControllerAnimated:NO];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
