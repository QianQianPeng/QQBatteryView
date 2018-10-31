//
//  QQBatteryView.m
//  QQBatteryView
//
//  Created by 彭倩倩 on 2018/10/31.
//

#import "QQBatteryView.h"

@implementation QQBatteryView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self creatBatteryView];
    }
    return self;
}

- (void)creatBatteryView {
    // 电池的宽度
    CGFloat w = self.bounds.size.width;
    // 电池的高度
    CGFloat h = self.bounds.size.height;
    // 电池的x的坐标
    CGFloat x = self.bounds.origin.x;
    // 电池的y的坐标
    CGFloat y = self.bounds.origin.y;
    
    // 电池的线宽
    self.lineW = 1;
    // 画电池
    UIBezierPath *path1 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(x, y, w, h) cornerRadius:2];
    CAShapeLayer *batteryLayer = [CAShapeLayer layer];
    batteryLayer.lineWidth = self.lineW;
    batteryLayer.strokeColor = [UIColor whiteColor].CGColor;
    batteryLayer.fillColor = [UIColor clearColor].CGColor;
    batteryLayer.path = [path1 CGPath];
    [self.layer addSublayer:batteryLayer];
    
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    [path2 moveToPoint:CGPointMake(x+w+1, y+h/3)];
    [path2 addLineToPoint:CGPointMake(x+w+1, y+h*2/3)];
    CAShapeLayer *layer2 = [CAShapeLayer layer];
    layer2.lineWidth = 2;
    layer2.strokeColor = [UIColor whiteColor].CGColor;
    layer2.fillColor = [UIColor clearColor].CGColor;
    layer2.path = [path2 CGPath];
    [self.layer addSublayer:layer2];
    
    // 绘制进度
    self.batteryView = [[UIView alloc] initWithFrame:CGRectMake(x + 1, y + self.lineW, 0, h - self.lineW * 2)];
    self.batteryView.layer.cornerRadius = 2;
    self.batteryView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.batteryView];
}

@end
