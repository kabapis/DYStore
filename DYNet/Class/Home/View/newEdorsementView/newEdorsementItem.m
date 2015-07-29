//
//  newEdorsementItem.m
//  DYNet
//
//  Created by MyMac on 15/7/28.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "newEdorsementItem.h"

@interface newEdorsementItem ()

@property (nonatomic,strong) UIImageView *imageIcon;/**<人物图片*/
@property (nonatomic,strong) UIView *coverView;/**<遮罩*/
@property (nonatomic,strong) UILabel *name;/**<名字*/
@property (nonatomic,strong) UILabel *votes;/**<票数*/

@end

@implementation newEdorsementItem

- (instancetype)initWithImage:(NSString *)image name:(NSString *)name votes:(NSString *)votes{
    self = [super init];
    if (self) {
        
        [self addSubview:self.imageIcon];
        [self addSubview:self.coverView];
        [self addSubview:self.name];
        [self addSubview:self.votes];
        
        [self setDataWithImge:(NSString *)image name:(NSString *)name votes:(NSString *)votes];
        
    }
    return self;
}

- (void)setDataWithImge:(NSString *)image name:(NSString *)name votes:(NSString *)votes{
    [self.imageIcon setImage:[UIImage imageNamed:image]];
    self.name.text = name;
    self.votes.text = votes;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.imageIcon.x = 0;
    self.imageIcon.y = 0;
    self.imageIcon.width = 294 / 2;
    self.imageIcon.height = 292 / 2;
    
    self.coverView.width = self.imageIcon.width;
    self.coverView.height = 56 / 2;
    self.coverView.x = 0;
    self.coverView.y = self.imageIcon.height - self.coverView.height;
    
    self.name.x = self.coverView.x + 5;
    self.name.y = self.coverView.y;
    self.name.width = self.coverView.width / 2 - 5;
    self.name.height = self.coverView.height;
    
    self.votes.x = self.name.width + 5;
    self.votes.y = self.name.y;
    self.votes.width = self.name.width;
    self.votes.height = self.name.height;
    
}


#pragma mark - getter and setter
//人物图片
- (UIImageView *)imageIcon{
    if (!_imageIcon) {
        _imageIcon = [[UIImageView alloc] init];
        _imageIcon.backgroundColor = [UIColor redColor];
    }
    return _imageIcon;
}

//遮罩
- (UIView *)coverView{
    if (!_coverView) {
        _coverView = [[UIView alloc] init];
        _coverView.backgroundColor = [UIColor blackColor];
        _coverView.alpha = 0.2;
    }
    return _coverView;
}

//名字
- (UILabel *)name{
    if (!_name) {
        _name = [[UILabel alloc] init];
        _name.font = [UIFont fontWithSize:13];
        _name.textColor = [UIColor whiteColor];
    }
    return _name;
}

//票数或被赞数量
- (UILabel *)votes{
    if (!_votes) {
        _votes = [[UILabel alloc] init];
        _votes.font = [UIFont fontWithSize:13];
        _votes.textAlignment = NSTextAlignmentRight;
        _votes.textColor = [UIColor whiteColor];
    }
    return _votes;
}

@end
