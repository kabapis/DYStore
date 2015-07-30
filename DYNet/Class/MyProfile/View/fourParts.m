//
//  fourParts.m
//  DYNet
//
//  Created by MyMac on 15/7/30.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "fourParts.h"

@implementation fourParts

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addParts];
    }
    return self;
}

- (void)addParts{
    int loc = 4;
    CGFloat partW = (mainScreenW - loc - 1) / loc;
    CGFloat partH = 55;
    UIView *all = [[UIView alloc] init];
    all.backgroundColor = [UIColor whiteColor];
    all.x = 0;
    all.y = 0;
    all.width = mainScreenW;
    all.height = partH;
    [self addSubview:all];
    
    NSArray *title = @[@"身材秀",@"回复",@"关注",@"被关注"];
    NSArray *imgName = @[@"mineTopIcon1",@"mineTopIcon2",@"mineTopIcon3",@"mineTopIcon4"];
    
    for (int i = 0; i < loc; i++) {
        UIView *part = [[UIView alloc] init];
        part.x = i * (partW + 1);
        part.y = 0;
        part.width = partW;
        part.height = partH;
        
        [all addSubview:part];
        
        //添加图片和文字
        UIButton *btn = [[UIButton alloc] init];
        [btn setImage:[UIImage imageNamed:imgName[i]] forState:UIControlStateNormal];
        btn.x = 0;
        btn.y = 5;
        btn.width = part.width;
        btn.height = partH - 24;
//        btn.backgroundColor = [UIColor redColor];
        [part addSubview:btn];
        
        UILabel *label = [[UILabel alloc] init];
        label.text = title[i];
        label.font = [UIFont fontWithSize:12.0f];
        label.textColor = RGB(104, 104, 104);
        label.textAlignment = NSTextAlignmentCenter;
        label.x = 0;
        label.y = btn.height;
        label.width = part.width;
        label.height = 24;
        [part addSubview:label];
        
        if (i != (loc - 1)) {
            UIView *line = [[UIView alloc] init];
            line.backgroundColor = [UIColor grayColor];
            line.x = (i + 1) * partW + i * SINGLE_LINE_WIDTH;
            line.y = 16;
            line.width = SINGLE_LINE_WIDTH;
            line.height = partH - 2 * line.y;
            
            [all addSubview:line];
        }
        
    }
}


@end
