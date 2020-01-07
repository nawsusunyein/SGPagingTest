//
//  ViewController.m
//  SGPagingTest
//
//  Created by Naw Su Su Nyein on 1/8/20.
//  Copyright © 2020 Naw Su Su Nyein. All rights reserved.
//

#import "ViewController.h"
#import "SGPagingView.h"
#import "WebViewController.h"

@interface ViewController ()<SGPageTitleViewDelegate, SGPageContentScrollViewDelegate>
 @property (nonatomic, strong) SGPageTitleView *pageTitleView;
 @property (nonatomic, strong) SGPageContentScrollView *pageContentScrollView;
@end

@implementation ViewController

- (void)dealloc {
    NSLog(@"DefaultAnimatedVC - - dealloc");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupPageView];
}

- (void)setupPageView {
    CGFloat pageTitleViewY = 20;
    NSArray *titleArr = @[@"News", @"キャンペーン", @"閲覧履歴", @"ランキング", @"新着", @"TSC", @"White", @"UL"];
    SGPageTitleViewConfigure *configure = [SGPageTitleViewConfigure pageTitleViewConfigure];
    configure.indicatorColor = [UIColor blueColor];
    configure.titleSelectedColor = [UIColor blueColor];
    /// pageTitleView
    self.pageTitleView = [SGPageTitleView pageTitleViewWithFrame:CGRectMake(0, pageTitleViewY, self.view.frame.size.width, 44) delegate:self titleNames:titleArr configure:configure];
    _pageTitleView.selectedIndex = 3;
    [self.view addSubview:_pageTitleView];
    
    
    WebViewController *controller1 = [[WebViewController alloc]init:0 link:@"https://www.google.com"];
    WebViewController *controller2 = [[WebViewController alloc]init:1 link:@"https://www.facebook.com"];
    WebViewController *controller3 = [[WebViewController alloc]init:2 link:@"https://www.tutorialspoint.com"];
    WebViewController *controller4 = [[WebViewController alloc]init:3 link:@"https://www.google.com"];
    WebViewController *controller5 = [[WebViewController alloc]init:4 link:@"https://www.udemy.com"];
    WebViewController *controller6 = [[WebViewController alloc]init:5 link:@"https://www.crunchbase.com"];
    WebViewController *controller7 = [[WebViewController alloc]init:6 link:@"https://www.google.com"];
    WebViewController *controller8 = [[WebViewController alloc]init:7 link:@"https://www.facebook.com"];
    
    NSArray *childArr = @[controller1, controller2, controller3, controller4, controller5, controller6, controller7, controller8];
    /// pageContentScrollView
    CGFloat ContentCollectionViewHeight = self.view.frame.size.height - CGRectGetMaxY(_pageTitleView.frame);
    self.pageContentScrollView = [[SGPageContentScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_pageTitleView.frame), self.view.frame.size.width, ContentCollectionViewHeight) parentVC:self childVCs:childArr];
    _pageContentScrollView.delegatePageContentScrollView = self;
    [self.view addSubview:_pageContentScrollView];
    _pageContentScrollView.isAnimated = YES;
}

- (void)pageTitleView:(SGPageTitleView *)pageTitleView selectedIndex:(NSInteger)selectedIndex {
    [self.pageContentScrollView setPageContentScrollViewCurrentIndex:selectedIndex];
}

- (void)pageContentScrollView:(SGPageContentScrollView *)pageContentScrollView progress:(CGFloat)progress originalIndex:(NSInteger)originalIndex targetIndex:(NSInteger)targetIndex {
    [self.pageTitleView setPageTitleViewWithProgress:progress originalIndex:originalIndex targetIndex:targetIndex];
}

/// 说明：1、这里的处理是为了滚动过程中（手指未离开屏幕）点击标题再滚动造成标题与内容短暂的不一致
/// 说明：2、了解了一下市场上的 app，大致分为二种情况：一种是滚动过程中标题可以点击（网易新闻、今日头条）；另一种是滚动过程中标题不可以点击（贝贝、汽车之家）
/// 说明：3、淘宝->微淘界面（带动画）也会存在这种情况但相对来说比我处理得好；所以我只能让动画与说明：2、的后一种情况相结合来做处理（美其名也：为了用户体验）
- (void)pageContentScrollViewWillBeginDragging {
    _pageTitleView.userInteractionEnabled = NO;
}

- (void)pageContentScrollViewDidEndDecelerating {
    _pageTitleView.userInteractionEnabled = YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
