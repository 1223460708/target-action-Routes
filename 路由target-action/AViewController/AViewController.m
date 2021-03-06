//
//  AViewController.m
//  路由target-action
//
//  Created by mac on 2017/9/20.
//  Copyright © 2017年 lifepay. All rights reserved.
//

#import "AViewController.h"

@interface AViewController ()

@property (nonatomic, strong) UIButton *backBtn;

@property (nonatomic, strong) UILabel *valueLabel;

@end

@implementation AViewController

- (UIButton *)backBtn{
    if (!_backBtn){
        _backBtn = [[UIButton alloc] init];
        _backBtn.frame = CGRectMake(100, 350, 100, 40);
        [_backBtn setTitle:@"back" forState:UIControlStateNormal];
        [_backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
        _backBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    }
    return _backBtn;
}

- (UILabel *)valueLabel{
    if (!_valueLabel){
        _valueLabel = [[UILabel alloc] init];
        _valueLabel.frame = CGRectMake(20, 100, 200, 30);
        _valueLabel.text = @"no value";
        _valueLabel.textColor = [UIColor blackColor];
        _valueLabel.font = [UIFont systemFontOfSize:14];
    }
    return _valueLabel;
}

- (void)backClick{
    if (self.navigationController == nil){
        [self dismissViewControllerAnimated:YES completion:nil];
    }else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:self.backBtn];
    
    [self.view addSubview:self.valueLabel];
    
    _valueLabel.text = self.aVc_params[@"key"];
    
    
    
    
    // Do any additional setup after loading the view.
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
