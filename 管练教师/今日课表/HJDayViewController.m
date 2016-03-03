//
//  HJDayViewController.m
//  管练教师
//
//  Created by niuxinghua on 16/1/27.
//  Copyright © 2016年 com.hjojo. All rights reserved.
//

#import "HJDayViewController.h"

#import "Masonry.h"
#import "HJWeekTopCollectionViewCell.h"
#import "HJWeekVerticalCollectionViewCell.h"
#import "HJWeekContentCollectionViewCell.h"
#import "HJWorkMarkViewController.h"
@interface HJDayViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation HJDayViewController
#pragma mark-lifecycle
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barTintColor =[UIColor colorWithRed:24/255.0 green:179/255.0 blue:139.0/255.0 alpha:1.0];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"本日课表";
    self.view.backgroundColor=[UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets=YES;
    
    [self setupUI];
    
    [self setUPHeader];
    [self.week registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head"];
}
-(UICollectionReusableView* )setUPHeader{
    UICollectionReusableView* view=[[UICollectionReusableView alloc]initWithFrame:CGRectMake(0, 0, 320, 99)];
    //view.backgroundColor=[UIColor blackColor];
    UILabel* lable=[[UILabel alloc]initWithFrame:CGRectMake(15, 5, 100, 30)];
    lable.font=[UIFont systemFontOfSize:16];
    lable.text=@"高邮湖路琴吧";
    UIView* view1=[[UIView alloc]initWithFrame:CGRectMake(15, 64, myscreenwith-30, 0.3)];
    view1.backgroundColor=UIColorFromRGB(0xe3e3e3);
    [view addSubview:view1];
    [view addSubview:lable];
    
    return view;
}
-(void)setupUI{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize             = CGSizeMake(myscreenwith/8.0, 64);
    layout.footerReferenceSize  = CGSizeMake(0, 0);
    
    layout.sectionInset            = UIEdgeInsetsMake(0, 0, 0, 0);
    layout.minimumInteritemSpacing = 0.0;
    layout.minimumLineSpacing      = 0.0;
    _week=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 320, 568) collectionViewLayout:layout];
    _week.backgroundColor=[UIColor whiteColor];
    _week.dataSource=self;
    _week.delegate=self;
    _week.showsVerticalScrollIndicator=NO;
    [_week registerClass:[HJWeekTopCollectionViewCell class] forCellWithReuseIdentifier:@"top"];
    [_week registerClass:[HJWeekVerticalCollectionViewCell class] forCellWithReuseIdentifier:@"vertical"];
    [_week registerClass:[HJWeekContentCollectionViewCell class] forCellWithReuseIdentifier:@"content"];
    [self.view addSubview:_week];
    [_week mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view.mas_top);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
}
#pragma mark -- UICollectionViewDataSource
//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 100;
}
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    HJWeekTopCollectionViewCell* top=[collectionView dequeueReusableCellWithReuseIdentifier:@"top" forIndexPath:indexPath];
    HJWeekVerticalCollectionViewCell* verticallcell;
    HJWeekContentCollectionViewCell* contentcell;
    if (!top) {
        top=[[HJWeekTopCollectionViewCell alloc]initWithFrame:CGRectZero];
    }
    if ([indexPath row]==0) {
        top.weektime.hidden=YES;
        top.datetime.hidden=YES;
        top.circle.hidden=YES;
        return top;
    }
    if ([indexPath row]<=8) {
        top.datetime.text=[NSString stringWithFormat:@"%zd",[indexPath row]];
        top.weektime.text=@"琴房";
        return top;
    }
    if ([indexPath row]%9==0) {
        verticallcell=[collectionView dequeueReusableCellWithReuseIdentifier:@"vertical" forIndexPath:indexPath];
        return verticallcell;
    }else{
        contentcell=[collectionView dequeueReusableCellWithReuseIdentifier:@"content" forIndexPath:indexPath];
        if ([indexPath row]%5==0) {
            [contentcell setHJSelected:YES];
        }
        
        return contentcell;
    }
    return top;
}
- (CGFloat)minimumInteritemSpacing {
    return 0;
}
#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个UICollectionView的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath row]<=8) {
        return CGSizeMake(myscreenwith/9.0,62);
    }
    if([indexPath row]%9==0){
        return CGSizeMake(72/2,86/2);
        
    }else{
        return CGSizeMake((myscreenwith-72/2)/8.0,86/2);
    }
    //return CGSizeMake(myscreenwith/8.0,62);
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath

{
    UICollectionReusableView * header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head" forIndexPath:indexPath];
    
    //有缓存了
    [header addSubview:[self setUPHeader]];
    return header;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    
    return CGSizeMake(320, 99);
    
}
//定义每个UICollectionView的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0,0,0,0);
}
#pragma mark --UICollectionViewDelegate
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (([indexPath row]<=8)||[indexPath row]%9==0) {
        return;
    }
    HJWorkMarkViewController* mark=[HJWorkMarkViewController new];
    [self.navigationController pushViewController:mark animated:NO];
}
//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
@end
