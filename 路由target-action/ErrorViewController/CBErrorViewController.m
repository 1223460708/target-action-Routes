//
//  CBErrorViewController.m
//  路由target-action
//
//  Created by mac on 2017/9/20.
//  Copyright © 2017年 lifepay. All rights reserved.
//

#import "CBErrorViewController.h"

@interface CBErrorViewController ()
@property (nonatomic, strong) UIButton *backBtn;
@end

@implementation CBErrorViewController

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
- (void)backClick{
    if (self.navigationController == nil){
        [self dismissViewControllerAnimated:YES completion:nil];
    }else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:self.backBtn];
    
    UILabel *errorLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 100, 120, 30)];
    errorLabel.text = @"错误界面";
    errorLabel.textColor = [UIColor blackColor];
    errorLabel.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:errorLabel];
    
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
