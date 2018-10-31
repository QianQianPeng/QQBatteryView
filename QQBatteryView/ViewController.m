//
//  ViewController.m
//  QQBatteryView
//
//  Created by 彭倩倩 on 2018/10/31.
//

#import "ViewController.h"
#import "QQBatteryView.h"

@interface ViewController ()

@property (nonatomic, strong) QQBatteryView *battery;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.battery = [[QQBatteryView alloc] initWithFrame:CGRectMake(100, 100, 50, 25)];
    [self.view addSubview:self.battery];
    
    // 真机测试时打开下面注释
//    CGFloat battery = [self getBatteryLevel];
//    CGRect frame = self.battery.batteryView.frame;
//    frame.size.width = battery*(self.battery.frame.size.width-self.battery.lineW*2);
//    self.battery.batteryView.frame = frame;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    float progressValue = arc4random()%+100;
    [UIView animateWithDuration:1 animations:^{
        CGRect frame = self.battery.batteryView.frame;
        frame.size.width = (progressValue*(self.battery.frame.size.width-self.battery.lineW*2))/100;
        self.battery.batteryView.frame = frame;
    }];
}

/** 获取电池电量 */
- (CGFloat)getBatteryLevel {
    [UIDevice currentDevice].batteryMonitoringEnabled = YES;
    return [UIDevice currentDevice].batteryLevel;
}


@end
