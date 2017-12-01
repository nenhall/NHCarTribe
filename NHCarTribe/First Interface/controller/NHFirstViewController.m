//
//  NHFirstViewController.m
//  NHCarTribe
//
//  Created by simope on 16/7/13.
//  Copyright © 2016年 NegHao.W. All rights reserved.
//

#import "NHFirstViewController.h"
#import "NHSearchBar.h"


@interface NHFirstViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, weak) UIButton *navRightBut;
@property (nonatomic, strong) UIView *navTitleView;
@property (nonatomic, weak) NHSearchBar *search;

@end

@implementation NHFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
//    self.tabBarController.tabBar.translucent = NO;
    [self setNavigationBar];
    
    [self addTableView];
}

- (void)addTableView{

    UITableView *table = [[UITableView alloc] init];
    table.frame = CGRectMake(0, 0, kSCREEN_WIDTH, kSCREEN_HEIGHT - 20 - 49);
    table.delegate = self;
    table.dataSource = self;
    
    [self.view addSubview:table];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    [self.navigationController.view endEditing:YES];
    
    NSInteger scrollViewOffsetY = scrollView.contentOffset.y;
    
//    NSLog(@"contentOffset:%f,%@",scrollView.contentOffset.y,NSStringFromCGRect(self.navigationItem.rightBarButtonItem.customView.frame));
    
    if (scrollViewOffsetY > 0) {
        [UIView animateWithDuration:0.1 animations:^{
            
            _navTitleView.frame = CGRectMake(kNHNavTitleViewWidth - 20, 12, 0, kNHNav_H);
            [_navRightBut setBackgroundImage:[UIImage imageNamed:@"nav_more"] forState:UIControlStateNormal];
            
        } completion:^(BOOL finished) {
            _navTitleView.alpha = 0;
            _search.frame = CGRectMake(0, 5, kNHNavTitleViewWidth + 100, 34);
            _search.alpha = 1;
        }];
    }else {
        _navTitleView.frame = CGRectMake(0 , 12, kNHNavTitleViewWidth, kNHNav_H);
        [UIView animateWithDuration:0.1 animations:^{
            _search.frame = CGRectMake(0, 12, kNHNav_H, kNHNav_H);
            _search.alpha = 0;
            [_navRightBut setBackgroundImage:[UIImage imageNamed:@"brand_newCar"] forState:UIControlStateNormal];
        } completion:^(BOOL finished) {
            _navTitleView.alpha = 1;
        }];
    }
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    NSLog(@"touchesBegan");
}

- (void)setNavigationBar{
    
    UIButton *leftBar = [NHQuickCreate addButtonWithFrame:CGRectMake(10, kNHNav_Y, 60, kNHNav_H) titleColor:nil BGColor:nil Tag:1 Target:self Action:@selector(clickNavigationButton:) Title:@"城市名"];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBar];
    
    UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kNHNavRightViewWidth + 100, 44)];
    
    _navTitleView = [[UIView alloc] initWithFrame:CGRectMake(100, 12, kNHNavTitleViewWidth, kNHNav_H)];
    [rightView addSubview:_navTitleView];
    
    NHSearchBar *search = [[NHSearchBar alloc] initWithFrame:CGRectMake(0, 12, kNHNav_H, kNHNav_H)];
    search.alpha = 0;
    [rightView addSubview:search];
    _search = search;
    
    NSArray *imageName = @[@"nav_titleViewSearch.png",@"brand_collect.png",@"brand_history.png",@"brand_hot.png"];
    for (int i = 0; i < imageName.count; i++) {
        UIButton *navButs = [NHQuickCreate addButtonWithFrame:CGRectMake(i * (kNHNav_H + 20) + 100, kNHNav_Y, kNHNav_H, kNHNav_H) titleColor:kNHBlackColor BGColor:nil Tag:i Target:self Action:@selector(clickNavigationButton:) Title:nil];
        [navButs setBackgroundImage:[UIImage imageNamed:imageName[i]] forState:UIControlStateNormal];
        [_navTitleView addSubview:navButs];
    }

    UIButton *navRightBut = [NHQuickCreate addButtonWithFrame:CGRectMake(_navTitleView.right, 12, kNHNav_H, kNHNav_H) titleColor:kNHBlackColor BGColor:nil Tag:2 Target:self Action:@selector(clickNavigationButton:) Title:nil];
    [navRightBut setBackgroundImage:[UIImage imageNamed:@"brand_newCar"] forState:UIControlStateNormal];
    [rightView addSubview:navRightBut];
    _navRightBut = navRightBut;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightView];
}


- (UIBarButtonItem *)WithCustomView:(UIView *)view{
    UIBarButtonItem *barBut = [[UIBarButtonItem alloc] initWithCustomView:view];
    return barBut;
}


- (void)clickNavigationButton:(UIButton *)button{

    NSLog(@"%@",button.currentTitle);
    
}



@end
