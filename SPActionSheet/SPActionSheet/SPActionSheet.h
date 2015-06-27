//
//  SPActionSheet.h
//  SPActionSheet
//
//  Created by BiliSu on 15/6/27.
//  Copyright (c) 2015年 BiliSu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef UIView* (^ImplantView)(CGFloat ContainerHeight);

typedef NS_ENUM(NSInteger, SPActionSheetStyle){
    NSSPActionSheetStyleNone = 1, //无样式
    NSSPActionSheetStyleNormal,   //加UINavigationBar
    NSSPActionSheetStyleTable     //加table
};

@interface SPActionSheet : UIView

@property (nonatomic, strong) UIWindow *spWindow;
@property (nonatomic, strong) UINavigationBar *spNavigationBar;
@property (nonatomic, strong) ImplantView spImplantView;
@property (nonatomic, strong) UIBarButtonItem *spLeftItem;
@property (nonatomic, strong) UIBarButtonItem *spRightItem;
@property (nonatomic, strong) NSString *spTitle;
@property (nonatomic, assign) BOOL isNeedFuzzy;
@property (nonatomic, assign) CGFloat spActionSheetHeight;
@property (nonatomic, strong) UINavigationItem * item;
@property (nonatomic, strong) UIView * container;
@property (nonatomic, assign) SPActionSheetStyle spActionSheetStyle;
- (void)showSheet;
- (void)dismissSheet;
@end
