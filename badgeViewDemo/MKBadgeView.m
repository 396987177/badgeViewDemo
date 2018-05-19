//
//  XSBadgeNumberView.m
//  XSJiNengXiaEDU
//
//  Created by elephant on 2018/4/4.
//  Copyright © 2018年 elephant. All rights reserved.
//

#import "MKBadgeView.h"


@interface MKBadgeView ()
/** 默认的大小 18 字体 12 */
@property (nonatomic, assign) CGFloat labelWH;
@property (nonatomic, strong) UILabel *label;
@end
@implementation MKBadgeView 



- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor redColor];
        [self setDefaultParamter];
        [self setupInit];

        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didClickBlock:)];
        [self addGestureRecognizer:gesture];
    }
    return self;
}

- (void)setDefaultParamter {
    _labelWH     = self.frame.size.width ? : 18;
    _font        = _labelWH - 6;
    _textColor   = [UIColor whiteColor];
}

#pragma mark -
#pragma mark - action 

- (void)didClickBlock:(void (^)(NSInteger))block {
    block (_count);
}

#pragma mark -
#pragma mark -  setter
- (void)setFont:(CGFloat)font {
    _font = font ? : 12;
    _labelWH = _font + 6;
    [self setupInit];
    self.count = _count;
}

- (void)setCount:(NSInteger)count {
    _count = count;
    [self labelCount:count];
}

- (CGSize)labelCount:(NSInteger)count {
    _count = count;
    self.hidden = !count;

    if (count <= 0) {
        return CGSizeZero;
    }
    self.label.frame = CGRectZero;
    self.label.text = [NSString stringWithFormat:@"%zd",count];
    
    if (count >= 100) {
        self.label.text = [NSString stringWithFormat:@"%@",@"99+"];
    }
    if (count <= 0) {
        self.label.text = [NSString stringWithFormat:@"%@",@"0"];
    }
    
    CGSize size = [self.label sizeThatFits:CGSizeZero];
    CGFloat width = size.width < _labelWH ? _labelWH :size.width ;
    // 加宽
    width =  count >= 10 ? width + _font/2 : width;
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, _labelWH);
    self.label.frame = self.bounds;
    return CGSizeMake(width, size.height);
    
}
 
#pragma mark -
#pragma mark -  init

- (void)setupInit {
 
    self.backgroundColor = [UIColor redColor];
    self.layer.cornerRadius = _labelWH/2;
    self.layer.masksToBounds = YES;
    self.label.textColor  = _textColor ;
    self.label.font = [UIFont systemFontOfSize:_font];
   
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] initWithFrame:self.bounds];
        _label.textColor = [UIColor whiteColor];
        _label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_label];
    }
    return _label;
}


 
@end
