//
//  HomeHeader.m
//  DYNet
//
//  Created by MyMac on 15/7/28.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "HomeHeader.h"
#import "NSString+Extension.h"

@interface HomeHeader ()

@property (nonatomic,strong) UILabel *title;
@property (nonatomic,strong) UILabel *details;
@property (nonatomic,strong) UIImageView *arrowIcon;
@property (nonatomic,strong) UIButton *clickBtn;

@end

@implementation HomeHeader

- (instancetype)initWithTitle:(NSString *)title details:(NSString *)details{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.title];
        [self addSubview:self.details];
        [self addSubview:self.arrowIcon];
        [self addSubview:self.clickBtn];
        
        [self setDataWithTitle:(NSString *)title details:(NSString *)details];
        
    }
    return self;
}

- (void)setDataWithTitle:(NSString *)title details:(NSString *)details{
    self.title.text = title;
    self.details.text = details;
    self.title.height = [title sizeWithFont:[UIFont fontWithSize:20]].height;
    self.details.height = [details sizeWithFont:[UIFont fontWithSize:10]].height;
    self.details.y = CGRectGetMaxY(self.title.frame) + 10;
//    DBLog(@"%f",self.title.frame.size.height);
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.title.x = 10;
    self.title.y = 10;
    self.title.width = mainScreenW / 2;
    
    
    self.details.x = self.title.x;
    self.details.width = self.title.width;
    
    self.arrowIcon.size = self.arrowIcon.image.size;
    self.arrowIcon.x = mainScreenW - self.arrowIcon.image.size.width - 10;
    self.arrowIcon.y = (self.height - self.arrowIcon.image.size.height) * 0.5;
    
    self.clickBtn.x = 0;
    self.clickBtn.y = 0;
    self.clickBtn.width = self.width;
    self.clickBtn.height = self.height;
    
}


#pragma mark - getter and setter
- (UILabel *)title{
    if (!_title) {
        _title = [[UILabel alloc] init];
        _title.font = [UIFont fontWithSize:20];
        _title.textColor = RGB(104, 104, 104);
    }
    return _title;
}

- (UILabel *)details{
    if (!_details) {
        _details = [[UILabel alloc] init];
        _details.font = [UIFont fontWithSize:10];
        _details.textColor = RGB(148, 148, 148);
    }
    return _details;
}

- (UIImageView *)arrowIcon{
    if (!_arrowIcon) {
        _arrowIcon = [[UIImageView alloc] init];
        [_arrowIcon setImage:[UIImage imageNamed:@"arrow"]];
    }
    return _arrowIcon;
}

- (UIButton *)clickBtn{
    if (!_clickBtn) {
        _clickBtn = [[UIButton alloc] init];
        _clickBtn.backgroundColor = [UIColor clearColor];
    }
    return _clickBtn;
}

@end
