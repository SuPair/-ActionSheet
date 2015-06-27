//
//  ViewController.m
//  SPActionSheet
//
//  Created by BiliSu on 15/6/27.
//  Copyright (c) 2015年 BiliSu. All rights reserved.
//

#import "ViewController.h"
#import "SPActionSheet.h"

@interface ViewController ()
- (IBAction)buttonPressed:(id)sender;

@end

@implementation ViewController{

    SPActionSheet *sheet;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender {
    
    sheet = [[SPActionSheet alloc] init];
    sheet.spActionSheetStyle = NSSPActionSheetStyleNormal;
    UIButton *left = [UIButton buttonWithType:UIButtonTypeCustom];
    [left setTitle:@"  关闭" forState:UIControlStateNormal];
    left.frame = CGRectMake(0, 0, 50, 30);
    [left setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [left addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    sheet.spLeftItem = [[UIBarButtonItem alloc] initWithCustomView:left];
    sheet.spTitle = @"哇哈哈";
    sheet.isNeedFuzzy = YES;
    sheet.spActionSheetHeight = 500;
    sheet.spImplantView = ^(CGFloat Height){
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, Height)];
        view.backgroundColor = [UIColor whiteColor];
        return view;
    };
    [sheet showSheet];
}

- (void)click{

    [sheet dismissSheet];
}
@end
