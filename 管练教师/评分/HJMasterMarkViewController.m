//
//  HJMasterMarkViewController.m
//  管练教师
//
//  Created by niuxinghua on 16/1/31.
//  Copyright © 2016年 com.hjojo. All rights reserved.
//

#import "HJMasterMarkViewController.h"
#import "EBCardCollectionViewLayout.h"
#import "HJChartCollectionViewCell.h"
#import "Masonry.h"
#import "HJWorkMarkViewController.h"
@interface HJMasterMarkViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate>



@end

@implementation HJMasterMarkViewController{
    NSMutableArray* datalist;
    CGPoint startPoint;
    BOOL bMove;
    CGPoint pointtwo;
    BOOL canMove;
    NSInteger currentIndex;
    NSArray* colorArray;
}
#pragma mark=lifecycle
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden=NO;
    
}
#pragma mark-gesture
//滑动开始事件
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint pointone = [touch locationInView:self.view];//获得初始的接触点
    startPoint  = pointone;
}
//滑动移动事件
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    //imgViewTop是滑动后最后接触的View
    pointtwo = [touch locationInView:self.view];  //获得滑动后最后接触屏幕的点
    
    if(fabs(pointtwo.x-startPoint.x)>20)
    {  //判断两点间的距离
        bMove = YES;
        
        
        
    }else{
        bMove=false;
    }
}
//滑动结束处理事件
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    pointtwo = [touch locationInView:self.view];  //获得滑动后最后接触屏幕的点
    if((fabs(pointtwo.x-startPoint.x)>20)&&(bMove))
    {
        //判断点的位置关系 左滑动
        if(pointtwo.x-startPoint.x<-40)
        {   //左滑动业务处理
            
            NSLog(@"左滑、、、、、");
            [UIView animateWithDuration:1.0 animations:^{
                _card.center=CGPointMake(myscreenwith/2.0,_card.frame.size.height/2+155/2.0);
            }];
            canMove=true;
        }
        //判断点的位置关系 右滑动
        else
        {  //右滑动业务处理
            if (_card.contentOffset.y==0&&(_card.center.x<320)) {
                //滑动到原先的位置
                
                [UIView animateWithDuration:1.0 animations:^{
                    _card.center=CGPointMake(myscreenwith+100, _card.frame.size.height/2+155/2.0);
                }];
                
            }
            if (canMove) {
                [UIView animateWithDuration:1.0 animations:^{
                    _card.center=CGPointMake(myscreenwith+100,_card.frame.size.height/2+155/2.0);
                }];
            }
            NSLog(@"右滑、、、、、");
            
            
        }
    }
}



-(void)handleSingleTap:(UITapGestureRecognizer *)sender

{
    
    CGPoint point = [sender locationInView:self.view];
    CGPoint point1 = [sender locationInView:_card];
    CGPoint point2 = [sender locationInView:_control];
    if ([self.view pointInside:point withEvent:nil]&&![_card pointInside:point1 withEvent:nil]&&![_control pointInside:point2 withEvent:nil]) {
        [UIView animateWithDuration:1.0 animations:^{
            _card.center=CGPointMake(myscreenwith+100, _card.frame.size.height/2+155/2.0);
        }];
        
    }
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets=NO;
    colorArray=@[UIColorFromRGB(0x47566d),UIColorFromRGB(0x00b05f),UIColorFromRGB(0xe6ab2e),UIColorFromRGB(0x0091cf),UIColorFromRGB(0x00bdce)];
    [self setUpUI];
    
    self.automaticallyAdjustsScrollViewInsets=YES;
    self.title=@"学习详情";
    self.navigationController.navigationBar.hidden=YES;
    self.view.backgroundColor=UIColorFromRGB(0x47566d);
    UICollectionViewFlowLayout * layout=[UICollectionViewFlowLayout new];
    layout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing=20;
    _card=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, myscreenwith, 413) collectionViewLayout:layout];
    _card.center=CGPointMake(myscreenwith/2, _card.frame.size.height/2+155/2.0);
    [_card registerClass:[HJChartCollectionViewCell class] forCellWithReuseIdentifier:@"GradientCell"];
    _card.backgroundColor=[UIColor clearColor];
    _card.delegate=self;
    _card.dataSource=self;
    // _card.layer.cornerRadius=5;
    _card.pagingEnabled=YES;
    _card.showsHorizontalScrollIndicator=NO;
    _card.showsVerticalScrollIndicator=NO;
    [self.view addSubview:_card];
    
}
-(void)mark{
    HJWorkMarkViewController* mark=[HJWorkMarkViewController new];
    mark.block=^(CGFloat mark){
        NSIndexPath *indexpath=[NSIndexPath indexPathForRow:currentIndex inSection:0];
        HJChartCollectionViewCell* cell=( HJChartCollectionViewCell*)[_card cellForItemAtIndexPath:indexpath];
        if (mark>=0.9) {
            mark=mark-0.05;
        }
        if (mark>=0.6) {
            mark=mark-0.2;
            //mark=(int)((mark+0.05)*100)%100/100.0-0.25;
        }else if (mark>=0.5){
            mark=mark-0.14;
        }
        else if (mark>=0.4){
            mark=mark-0.1;
        }else if(mark>=0.2){
            mark=mark-0.08;
        }
        cell.markview.scorePercent=mark;
        [cell.markview setNeedsDisplay];
    };
    
    [self.navigationController pushViewController:mark animated:NO];
}
#pragma mark-UI
-(void)setUpUI{
    UIButton* back=[[UIButton alloc]initWithFrame:CGRectMake(10, 30, 17, 17)];
    [back setImage:[UIImage imageNamed:@"whitearrow"] forState:UIControlStateNormal];
    [self.view addSubview:back];
    [back addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UILabel* lable=[UILabel new];
    lable.text=@"学习详情";
    lable.textColor=[UIColor whiteColor];
    [self.view addSubview:lable];
    [lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(back.mas_centerY);
        make.height.equalTo(@30);
        make.width.equalTo(@100);
    }];
    UIButton* leftbutton=[UIButton new];
    [self.view addSubview:leftbutton];
    [leftbutton setImage:[UIImage imageNamed:@"editinfo"] forState:UIControlStateNormal];
    [leftbutton setTitle:@"评分" forState:UIControlStateNormal];
    leftbutton.titleLabel.font=[UIFont systemFontOfSize:14.0];
    [leftbutton addTarget:self action:@selector(mark) forControlEvents:UIControlEventTouchUpInside];
    [leftbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@30);
        make.width.equalTo(@60);
        make.right.equalTo(self.view.mas_right).offset(-15);
        make.centerY.equalTo(back.mas_centerY);
    }];
    _avatar=[UIImageView new];
    [self.view addSubview:_avatar];
    [_avatar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(15);
        make.height.equalTo(@(110/2));
        make.width.equalTo(@55);
        make.top.equalTo(self.view.mas_top).offset(275/2);
    }];
    _avatar.layer.cornerRadius=CGRectGetHeight(_avatar.frame);
    _avatar.layer.masksToBounds=YES;
    [_avatar setImage:[UIImage imageNamed:@"boyavatar"]];
    _namelable=[UILabel new];
    _namelable.font=[UIFont systemFontOfSize:17];
    _namelable.textColor=[UIColor whiteColor];
    [self.view addSubview:_namelable];
    _namelable.text=@"王老师";
    [_namelable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_avatar.mas_right).offset(35/2);
        make.centerY.equalTo(_avatar.mas_centerY);
        make.height.equalTo(@40);
        make.width.equalTo(@60);
    }];
    _timelable=[UILabel new];
    _timelable.font=[UIFont systemFontOfSize:15];
    _timelable.textColor=[UIColor whiteColor];
    _timelable.text=@"上课时间：xxxxxxxxxx";
    [self.view addSubview:_timelable];
    [_timelable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_avatar.mas_left);
        make.top.equalTo(_avatar.mas_bottom).offset(10);
        make.width.equalTo(@200);
        make.height.greaterThanOrEqualTo(@40);
    }];
    _lessonlable=[UILabel new];
    _lessonlable.font=[UIFont systemFontOfSize:15];
    _lessonlable.textColor=[UIColor whiteColor];
    _lessonlable.text=@"课程名称：xxxxxxxxxx";
    [self.view addSubview:_lessonlable];
    [_lessonlable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_avatar.mas_left);
        make.top.equalTo(_timelable.mas_bottom).offset(10);
        make.width.equalTo(@200);
        make.height.greaterThanOrEqualTo(@40);
    }];
    UIView* view=[UIView new];
    view.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_avatar.mas_left);
        make.top.equalTo(_lessonlable.mas_bottom).offset(20);
        make.right.equalTo(self.view.mas_right).offset(-45);
        make.height.equalTo(@0.3);
    }];
    UILabel* text=[UILabel new];
    text.textColor=[UIColor whiteColor];
    text.text=@"教师评语：";
    [self.view addSubview:text];
    [text mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_bottom).offset(20);
        make.left.equalTo(_avatar.mas_left);
        make.width.equalTo(@100);
        make.height.equalTo(@30);
    }];
    _marklable=[UILabel new];
    [self.view addSubview:_marklable];
    _marklable.textColor=[UIColor whiteColor];
    _marklable.font=[UIFont systemFontOfSize:14];
    _marklable.numberOfLines=0;
    [_marklable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_avatar.mas_left);
        make.right.equalTo(view.mas_right);
        make.height.greaterThanOrEqualTo(@60);
        make.top.equalTo(text.mas_bottom).offset(10);
    }];
    _marklable.text=@"今天联系的不错，继续努力kdkdkdkkdkdkkdkdkdkkdkdkdkdkkdkdkdk";
    _control=[[UIPageControl alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    [self.view addSubview:_control];
    _control.tintColor=[UIColor grayColor];
    _control.currentPage=0;
    _control.pageIndicatorTintColor=[UIColor grayColor];
    _control.numberOfPages=5;
    [_control mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(17/2));
        make.width.equalTo(@40);
        make.top.equalTo(self.view.mas_bottom).offset(-20);
        make.centerX.equalTo(self.view.mas_centerX);
    }];
    UILabel* info=[UILabel new];
    info.textColor=[UIColor whiteColor];
    info.alpha=0.6;
    info.font=[UIFont systemFontOfSize:12];
    info.text=@"向左滑动显示作业";
    [self.view addSubview:info
     ];
    [info mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.height.equalTo(@30);
        make.width.equalTo(@100);
        make.bottom.equalTo(_control.mas_bottom).offset(-10);
    }];
    _markimage=[UIImageView new];
    [self.view addSubview:_markimage];
    [_markimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(155/2.0);
        make.right.equalTo(self.view.mas_right).offset(-60);
        make.height.width.equalTo(@40);
        
    }];
    _markimage.image=[UIImage imageNamed:@"gold"];
    
}
#pragma mark=methods
-(void)back{
    [self.navigationController popViewControllerAnimated:NO];
}
#pragma mark-scrolview delegate
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    NSLog(@"aaa%f",scrollView.contentOffset.x);
}
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    currentIndex=_card.contentOffset.x/_card.frame.size.width;
    NSLog(@"aaaaa%zd,",currentIndex);
    _control.currentPage=currentIndex;
    //self.view.backgroundColor=colorArray[currentIndex];
}
#pragma mark -- UICollectionViewDataSource
//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"GradientCell";
    HJChartCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    if(!cell){
        cell=[[HJChartCollectionViewCell alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
        cell.layer.cornerRadius=5;
    }
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}
#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(myscreenwith-20, collectionView.frame.size.height);
}
//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    return UIEdgeInsetsMake(0, 10, 0, 10);
}
#pragma mark --UICollectionViewDelegate
//UICollectionView被选中时调用的方法

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
}
//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}/*
  #pragma mark - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  // Get the new view controller using [segue destinationViewController].
  // Pass the selected object to the new view controller.
  }
  */

@end
