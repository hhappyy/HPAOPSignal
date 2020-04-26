//
//  HPTestView.m
//  HPAOPSignal_Example
//
//  Created by hapy on 2020/4/25.
//  Copyright © 2020 surnamex@163.com. All rights reserved.
//

#import "HPTestView.h"

@implementation HPTestView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor greenColor];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.bounds = frame;
        [btn setTitle:@"btn" forState:UIControlStateNormal];
        btn.layer.borderColor = UIColor.redColor.CGColor;
        [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
    return self;
}

- (void)click {
    NSLog(@"click");
}



@end
