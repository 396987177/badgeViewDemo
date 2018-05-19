//
//  ViewController.m
//  badgeViewDemo
//
//  Created by elephant on 2018/5/18.
//  Copyright © 2018年 elephant. All rights reserved.
//

#import "ViewController.h"
#import "MKBadgeView.h"
@interface ViewController ()
@property (nonatomic, strong) MKBadgeView *badgeView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.badgeView  = [[MKBadgeView alloc] initWithFrame:CGRectMake(self.view.center.x, self.view.center.y, 40, 40)];
 
    [self.view addSubview:self.badgeView];
    self.badgeView.count = 10;
    self.badgeView.font = 18;
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
      // self.badgeView.font = arc4random()%50;
      self.badgeView.count = arc4random()%100;
}

@end
