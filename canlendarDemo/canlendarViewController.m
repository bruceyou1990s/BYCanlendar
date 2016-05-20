//
//  canlendarViewController.m
//  canlendarDemo
//
//  Created by fox on 16/5/19.
//  Copyright © 2016年 bruceyou. All rights reserved.
//

#import "canlendarViewController.h"

@interface canlendarViewController ()

@end

@implementation canlendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.navigationItem.title=@"Canlendar日历";
    self.navigationController.navigationBar.barTintColor=[UIColor blueColor];
    
    //左边的菜单
    UIButton *leftbtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 5, self.view.bounds.size.width/10, 30)];
    [leftbtn setBackgroundColor: [UIColor greenColor]];
    [self.navigationController.navigationBar addSubview:leftbtn];
    
    //显示今天
    UILabel *canlanderTitle=[[UILabel alloc]initWithFrame:CGRectMake(60, 5, 120, 30)];
    canlanderTitle.text=@"2016年/05月";
    canlanderTitle.textColor=[UIColor whiteColor];
    [self.navigationController.navigationBar addSubview:canlanderTitle];
    
    
    //右边三个年月日切换按钮
    UIButton *monthBtn=[[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width/10*7, 5, self.view.bounds.size.width/10, 30)];
    UIButton *weekBtn=[[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width/10*8, 5, self.view.bounds.size.width/10, 30)];
    UIButton *dayrBtn=[[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width/10*9, 5, self.view.bounds.size.width/10, 30)];
    

     [monthBtn setTitle: @"月" forState: UIControlStateNormal];
     [weekBtn   setTitle: @"周" forState: UIControlStateNormal];
     [dayrBtn     setTitle: @"日" forState: UIControlStateNormal];
    
     [self.navigationController.navigationBar addSubview:monthBtn];
     [self.navigationController.navigationBar addSubview:weekBtn];
     [self.navigationController.navigationBar addSubview:dayrBtn];
    
    
    [monthBtn addTarget:self action:@selector(modeChange2Month:) forControlEvents:UIControlEventTouchUpInside];
    [weekBtn addTarget:self action:@selector(modeChange2Week:) forControlEvents:UIControlEventTouchUpInside];
    [dayrBtn addTarget:self action:@selector(modeChange2Day:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    UIButton *todayBtn=[[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width/12*4, self.view.bounds.size.height-self.view.bounds.size.width/12, self.view.bounds.size.width/12, self.view.bounds.size.width/12)];
    //todayBtn.backgroundColor=[UIColor yellowColor];
    [todayBtn setBackgroundColor: [UIColor grayColor]];
   
     [todayBtn setTitle: @"今" forState: UIControlStateNormal];
    [todayBtn addTarget:self action:@selector(todayItemClicked:) forControlEvents:UIControlEventTouchUpInside];
    
      UIButton *addBtn=[[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width/12*7, self.view.bounds.size.height-self.view.bounds.size.width/12, self.view.bounds.size.width/12, self.view.bounds.size.width/12)];
    addBtn.backgroundColor=[UIColor grayColor];
    [addBtn setTitle: @"+" forState: UIControlStateNormal];
    [self.view addSubview:todayBtn];
    [self.view addSubview:addBtn];
    //[self.calendar selectDate:[self.calendar dateFromString:@"2016/05/18" format:@"yyyy/MM/dd"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}
#pragma mark - Life cycle
//程序先跑初始化方法
- (instancetype)init
{
    self = [super init];
    if (self) {
        //self.title = @"FSCalendar";
        //代办事件标记
        self.images = @{@"2016/05/19":[UIImage imageNamed:@"icon_footprint"]
            };
//        self.images = @{@"2016/05/19":[UIImage imageNamed:@"icon_footprint"],
//                        @"2016/05/28":[UIImage imageNamed:@"icon_footprint"],
//                        @"2016/05/29":[UIImage imageNamed:@"icon_footprint"],
//                        @"2016/05/10":[UIImage imageNamed:@"icon_footprint"]};
    }
    return self;
}

- (void)loadView
{
    
    
    UIView *view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.view = view;
    
    // 450 for iPad and 300 for iPhone
    CGFloat height = [[UIDevice currentDevice].model hasPrefix:@"iPad"] ? 450 : 300;
    FSCalendar *calendar = [[FSCalendar alloc] initWithFrame:CGRectMake(0, 64, view.frame.size.width, height)];
    calendar.dataSource = self;
    calendar.delegate = self;
    //设置滑动方向
    calendar.scrollDirection = FSCalendarScrollDirectionVertical;
    calendar.backgroundColor = [UIColor whiteColor];
    [view addSubview:calendar];
    self.calendar = calendar;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    // Adjusts orientation
    CGFloat height = [[UIDevice currentDevice].model hasPrefix:@"iPad"] ? 450 : 300;
    self.calendar.frame = CGRectMake(0, 64, self.view.frame.size.width, height);
}


- (void)dealloc
{
    NSLog(@"%s", __FUNCTION__);
}

#pragma mark - <FSCalendarDelegate>

- (BOOL)calendar:(FSCalendar *)calendar shouldSelectDate:(NSDate *)date
{
    NSLog(@"should select date %@",[calendar stringFromDate:date format:@"yyyy/MM/dd"]);
    return YES;
}

//选择的日期
- (void)calendar:(FSCalendar *)calendar didSelectDate:(NSDate *)date
{
  //  NSLog(@"您刚选中%@年%@月%@日",[calendar stringFromDate:date format:@"yyyy"],[calendar stringFromDate:date format:@"MM"],[calendar stringFromDate:date format:@"dd"]);
    
               NSLog(@"您刚选中%@",[calendar stringFromDate:date format:@"yyyy年MM月dd日"]);
               NSLog(@"昨天是%@",[calendar yesterdayOfDate:[NSDate date]]);
               NSLog(@"今天是%@",[calendar yesterdayOlny: [NSDate date]]);
               NSLog(@"明天是%@",[calendar tomorrowOfDate:[NSDate date]]);
    
}



//页面需要跳转 返回的数值只有年月
- (void)calendarCurrentPageDidChange:(FSCalendar *)calendar
{
    NSLog(@"月份跳转 %@",[calendar stringFromDate:calendar.currentPage format:@"YYYY年MMMM"]);
}

- (void)calendar:(FSCalendar *)calendar boundingRectWillChange:(CGRect)bounds animated:(BOOL)animated
{
    calendar.frame = (CGRect){calendar.frame.origin,bounds.size};
}

#pragma mark -  显示今天
- (void)todayItemClicked:(id)sender
{
    [_calendar setCurrentPage:[NSDate date] animated:NO];
}
#pragma mark -  切换到Month
- (void)modeChange2Month:(id)sender
{
    NSLog(@"切换到月显示模式");
     [_calendar setScope:FSCalendarScopeMonth animated:NO];
}
#pragma mark -  切换到week
- (void)modeChange2Week:(id)sender
{
        NSLog(@"切换到周显示模式");
    [_calendar setScope:FSCalendarScopeWeek animated:YES];
}
#pragma mark -  切换到week
- (void)modeChange2Day:(id)sender
{
    NSLog(@"切换到天显示模式  oo 切换到周显示模式  ");
    
    [_calendar setScope:FSCalendarScopeWeek animated:NO];
}



#pragma mark - <FSCalendarDataSource>

/*
 - (NSDate *)minimumDateForCalendar:(FSCalendar *)calendar
 {
 return [calendar tomorrowOfDate:[NSDate date]];
 }
 */

/*
 - (NSDate *)maximumDateForCalendar:(FSCalendar *)calendar
 {
 return [_calendar dateWithYear:2026 month:12 day:31];
 }
 */

- (UIImage *)calendar:(FSCalendar *)calendar imageForDate:(NSDate *)date
{
    return self.images[[calendar stringFromDate:date format:@"yyyy/MM/dd"]];
}

@end


