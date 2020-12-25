//
//  ViewController.m
//  ViewCorner
//
//  Created by ma qi on 2020/12/25.
//

#import "ViewController.h"
#import <Masonry.h>
#import "UIView+Corner.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *aView;
@property (nonatomic, strong) UIView *bView;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSInteger width;
@property (nonatomic, assign) BOOL isRoundRect;

@end

static CGFloat ViewHeight = 40;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *aView = [UIView new];
    aView.backgroundColor = UIColor.redColor;
    [self.view addSubview:aView];
    [aView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(ViewHeight);
        make.top.mas_equalTo(100);
        make.left.mas_equalTo(50);
    }];
    self.aView = aView;
    
    UIView *bView = [UIView new];
    bView.backgroundColor = UIColor.redColor;
    [self.view addSubview:bView];
    [bView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(ViewHeight);
        make.top.equalTo(aView.mas_bottom).mas_offset(100);
        make.left.equalTo(aView);
    }];
    self.bView = bView;
    
    UIButton *btn = [UIButton new];
    btn.backgroundColor = UIColor.redColor;
    [btn setTitle:@"RoundedRect" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bView.mas_bottom).mas_offset(100);
        make.width.height.equalTo(@100);
        make.left.equalTo(@50);
    }];
    
    UIButton *btn1 = [UIButton new];
    btn1.backgroundColor = UIColor.redColor;
    [btn1 setTitle:@"AddLine" forState:UIControlStateNormal];
    btn1.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn1 addTarget:self action:@selector(btn1Action) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.width.height.equalTo(btn);
        make.right.equalTo(@-50);
    }];
}

- (void)btnAction {
    self.isRoundRect = YES;
    self.width = 40;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(changeWidth) userInfo:nil repeats:YES];
}

- (void)btn1Action {
    self.isRoundRect = NO;
    self.width = 40;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(changeWidth) userInfo:nil repeats:YES];
}

- (void)changeWidth {
    self.width += 1;
    self.width = MIN(200, self.width);
    if (self.isRoundRect) {
        [self.aView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(self.width);
        }];
        [self.view layoutIfNeeded];
        [self.aView roundedRect:UIRectCornerTopLeft | UIRectCornerBottomRight | UIRectCornerTopRight raduis:ViewHeight / 2.];
    }else {
        [self.bView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(self.width);
        }];
        [self.view layoutIfNeeded];
        CGFloat raduis = ViewHeight / 2.;
        [self.bView setCornerWithTopLeftCorner:raduis topRightCorner:raduis bottomLeftCorner:0 bottomRightCorner:raduis bounds:self.bView.bounds];
    }
}

@end
