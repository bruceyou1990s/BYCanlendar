//
//  canlendarViewController.h
//  canlendarDemo
//
//  Created by fox on 16/5/19.
//  Copyright © 2016年 bruceyou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSCalendar.h"
@interface canlendarViewController : UIViewController<FSCalendarDataSource, FSCalendarDelegate>
@property (weak, nonatomic) FSCalendar *calendar;
@property (strong, nonatomic) NSDictionary *images;
@end
