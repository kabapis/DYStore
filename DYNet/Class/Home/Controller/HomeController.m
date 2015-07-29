//
//  HomeController.m
//  DYNet
//
//  Created by MyMac on 15/7/27.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "HomeController.h"
#import "endorsementView.h"
#import "newEdorsementView.h"
#import "recommendProductsView.h"
#import "FigureShowView.h"

#define BannerHeight 125

@interface HomeController ()<BannerViewDelegate>

@property (nonatomic,strong) UIScrollView *scrollView;  /**<整体scrollView */

@property (nonatomic ,strong) Banner * banner;

@property (nonatomic,strong) endorsementView *endorsementPart;/**<我要代言模块*/

@property (nonatomic,strong) newEdorsementView *newedorsementPart;/**<最新代言人模块*/

@property (nonatomic,strong) UIButton *imageBtn;/**<美业联盟分享平台*/

@property (nonatomic,strong) recommendProductsView *recommendProductsView;/**<推荐商品*/

@property (nonatomic,strong) FigureShowView *figureShowView;/**<我要秀*/

@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addView];
    [self createViews];
}

#pragma mark CreateViews

-(void)createViews
{
    //建的images文件随便请求出来要删掉
    NSMutableArray * imageArray = [[NSMutableArray alloc] initWithObjects:@"bannerImage",@"bannerImage",@"bannerImage", nil];
    //NSMutableArray *imageArray=[[NSMutableArray alloc] initWithObjects:@"http://ww1.sinaimg.cn/large/53e0c4edjw1dy3qf6n17xj.jpg",@"http://www.ynwssn.com/file/upload/201106/30/15-54-54-98-45.jpg.middle.jpg",@"http://www.ynwssn.com/file/upload/201106/30/15-54-54-98-45.jpg.middle.jpg",@"http://www.ynwssn.com/file/upload/201106/30/15-54-54-98-45.jpg.middle.jpg", nil];
    
    _banner = [[Banner alloc] createBannerWithImageArray:nil HeightBanner:BannerHeight ViewX:0 ViewY:0 PageControllerStyle:BannerPageControlleSegmentStyle];
    [_banner setUpWithBannerImageArray:imageArray];
    _banner.delegate  =self;
    [_scrollView addSubview:_banner];
}

#pragma mark - 添加控件
- (void)addView{
    [self.view addSubview:self.scrollView];
    
    [self.scrollView addSubview:self.endorsementPart];
    [self.scrollView addSubview:self.newedorsementPart];
    [self.scrollView addSubview:self.imageBtn];
    [self.scrollView addSubview:self.recommendProductsView];
    [self.scrollView addSubview:self.figureShowView];
}

#pragma mark - 设置控件的尺寸
- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    self.scrollView.x = 0;
    self.scrollView.y = 0;
    self.scrollView.width = mainScreenW;
    self.scrollView.height = mainScreenH - 64;
    
    self.endorsementPart.x = 0;
    self.endorsementPart.y = BannerHeight;
    self.endorsementPart.width = mainScreenW;
    self.endorsementPart.height = 308 / 2;
    
    self.newedorsementPart.x = 0;
    self.newedorsementPart.y = CGRectGetMaxY(self.endorsementPart.frame) + 1;
    self.newedorsementPart.width = mainScreenW;
    self.newedorsementPart.height = 323 + 45;
    
    self.imageBtn.x = 0;
    self.imageBtn.y = CGRectGetMaxY(self.newedorsementPart.frame);
    self.imageBtn.size = self.imageBtn.currentImage.size;
    
    self.recommendProductsView.x = 0;
    self.recommendProductsView.y = CGRectGetMaxY(self.imageBtn.frame) + 10;
    self.recommendProductsView.width = mainScreenW;
    self.recommendProductsView.height = 239 + 45;
    
    self.figureShowView.x = 0;
    self.figureShowView.y = CGRectGetMaxY(self.recommendProductsView.frame) + 1;
    self.figureShowView.width = mainScreenW;;
    self.figureShowView.height = 644 + 45;
    
    
    self.scrollView.contentSize = CGSizeMake(mainScreenW, CGRectGetMaxY(self.figureShowView.frame));
    
}

#pragma mark - getter和setter
//整体scrollView
- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.backgroundColor = RGB(223, 223, 223);
        _scrollView.contentSize = CGSizeMake(mainScreenW, mainScreenH);
        _scrollView.showsVerticalScrollIndicator = NO;
    }
    return _scrollView;
}

//我要代言模块
- (endorsementView *)endorsementPart{
    if (!_endorsementPart) {
        _endorsementPart = [[endorsementView alloc] init];
    }
    return _endorsementPart;
}

//最新代言人模块
- (newEdorsementView *)newedorsementPart{
    if (!_newedorsementPart) {
        _newedorsementPart = [[newEdorsementView alloc] init];
    }
    return _newedorsementPart;
}

//美业联盟分享平台
- (UIButton *)imageBtn{
    if (!_imageBtn) {
        _imageBtn = [[UIButton alloc] init];
        [_imageBtn setImage:[UIImage imageNamed:@"lianmeng"] forState:UIControlStateNormal];
        _imageBtn.adjustsImageWhenHighlighted = NO;
    }
    return _imageBtn;
}

//推荐商品
- (recommendProductsView *)recommendProductsView{
    if (!_recommendProductsView) {
        _recommendProductsView = [[recommendProductsView alloc] init];
    }
    return _recommendProductsView;
}

- (FigureShowView *)figureShowView{
    if (!_figureShowView) {
        _figureShowView = [[FigureShowView alloc] init];
    }
    return _figureShowView;
}



#pragma mark Banner delegate

-(void)clickBannerView:(NSInteger)index
{
    NSLog(@"index: %ld",index);
}


@end
