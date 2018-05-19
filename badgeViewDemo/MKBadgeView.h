//
//  XSBadgeNumberView.h
//  XSJiNengXiaEDU
//
//  Created by elephant on 2018/4/4.
//  Copyright © 2018年 elephant. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MKBadgeView : UIView

/** 数量 */
@property (nonatomic, assign) NSInteger count;
/** 字体大小 */
@property (nonatomic, assign) CGFloat font;
/** 文本颜色 */
@property (nonatomic, strong) UIColor *textColor;

/** 返回修改后的尺寸 */
- (CGSize)labelCount:(NSInteger)count;

/** 点击事件 */
- (void)didClickBlock:(void (^)(NSInteger))block;

@end
