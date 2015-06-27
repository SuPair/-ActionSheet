//
//  SPActionSheet.m
//  SPActionSheet
//
//  Created by BiliSu on 15/6/27.
//  Copyright (c) 2015年 BiliSu. All rights reserved.
//

#import "SPActionSheet.h"

@interface SPActionSheet ()

@end

@implementation SPActionSheet

- (instancetype)init{

    self = [super init];
    if (self) {
        self.spWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        self.spWindow.windowLevel = UIWindowLevelAlert;
        self.spNavigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
        self.item = [[UINavigationItem alloc] initWithTitle:nil];
        [self.spWindow addSubview:self];
        self.spActionSheetHeight = 0;
    }
    return self;
}

- (void)setIsNeedFuzzy:(BOOL)isNeedFuzzy{
    
    if (_isNeedFuzzy != isNeedFuzzy) {
        _isNeedFuzzy = isNeedFuzzy;
        if (_isNeedFuzzy) {
            self.spWindow.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5];
        }
    }
}

- (void)setSpActionSheetStyle:(SPActionSheetStyle)spActionSheetStyle{
    
    if (_spActionSheetStyle != spActionSheetStyle) {
        _spActionSheetStyle = spActionSheetStyle;
    }
    switch (self.spActionSheetStyle) {
        case 1:{
            //什么东西都不加
            self.container = [[UIView alloc] initWithFrame:self.bounds];
            self.container.backgroundColor = [UIColor clearColor];
            [self addSubview:self.container];
        }break;
        case 2:{
            if (self.spActionSheetHeight == 0) {
                self.frame = CGRectMake(0,[UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height / 2.0f);
            }
            self.container = [[UIView alloc] initWithFrame:CGRectMake(0, 44, [UIScreen mainScreen].bounds.size.width, self.bounds.size.height - 44)];
            self.container.backgroundColor = [UIColor clearColor];
            [self addSubview:self.container];
            //添加NavBar
            [self addSubview:self.spNavigationBar];
            _spNavigationBar.barStyle = UIBarStyleDefault;
            [_spNavigationBar pushNavigationItem:_item animated:NO];
            
        }break;
        case 3:{
            //暂定
            
        }break;
        default:
            break;
    }
}

- (void)setSpLeftItem:(UIBarButtonItem *)spLeftItem{

    if (_spLeftItem != spLeftItem) {
        _spLeftItem = spLeftItem;
        
        [_item setLeftBarButtonItem:_spLeftItem];
        [_spNavigationBar pushNavigationItem:_item animated:NO];
    }
}

- (void)setSpRightItem:(UIBarButtonItem *)spRightItem{
    if (_spRightItem != spRightItem) {
        _spRightItem = spRightItem;
        [_item setLeftBarButtonItem:_spRightItem];
        [_spNavigationBar pushNavigationItem:_item animated:NO];
    }
}

- (void)setSpTitle:(NSString *)spTitle{
    if (_spTitle != spTitle) {
        _spTitle = spTitle;
        [_item setTitle:_spTitle];
    }
}

- (void)setSpImplantView:(ImplantView)spImplantView{

    if (_spImplantView != spImplantView) {
        _spImplantView = spImplantView;
        NSAssert(self.container != nil, @"请先设置ActionSheet的样式为 ‘NSSPActionSheetStyleNormal’");
        UIView *implantView = _spImplantView(self.container.bounds.size.height);
        [self.container addSubview:implantView];
    }
}

- (void)setSpActionSheetHeight:(CGFloat)spActionSheetHeight{

    if (_spActionSheetHeight != spActionSheetHeight) {
        _spActionSheetHeight = spActionSheetHeight;
        self.frame = CGRectMake(0,[UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, spActionSheetHeight);
        if (self.container != nil) {
            self.container.frame = CGRectMake(0, 44, [UIScreen mainScreen].bounds.size.width, self.bounds.size.height - 44);
        }
    }
}

- (void)showSheet{
    
    [UIView animateWithDuration:0.3 animations:^{
        self.center = CGPointMake(self.center.x,[UIScreen mainScreen].bounds.size.height - self.bounds.size.height / 2.0f);
    }];
    [self.spWindow makeKeyAndVisible];
}

- (void)dismissSheet{
    [UIView animateWithDuration:0.3 animations:^{
        self.center = CGPointMake(self.center.x,[UIScreen mainScreen].bounds.size.height + self.bounds.size.height / 2.0f);
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            [self.spWindow setHidden:YES];
            [self removeFromSuperview];
        });
    }];
}

@end
