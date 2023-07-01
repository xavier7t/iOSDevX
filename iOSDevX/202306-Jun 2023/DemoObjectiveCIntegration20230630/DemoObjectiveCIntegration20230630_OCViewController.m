//
//  DemoObjectiveCIntegration20230630_OCViewController.m
//  iOSDevX
//
//  Created by Xavier on 7/1/23.
//

#import "DemoObjectiveCIntegration20230630_OCViewController.h"

@interface DemoObjectiveCIntegration20230630_OCViewController ()
@end

@implementation DemoObjectiveCIntegration20230630_OCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 50)];
    _label.adjustsFontSizeToFitWidth = YES;
    _label.textColor = [UIColor systemCyanColor];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.center = self.view.center;
    [self.view addSubview:_label];
}


@end
