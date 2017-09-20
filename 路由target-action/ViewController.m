//
//  ViewController.m
//  路由target-action
//
//  Created by mac on 2017/9/20.
//  Copyright © 2017年 lifepay. All rights reserved.
//

#import "ViewController.h"
#import "CBMediator+CBModel.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *AdataSource;
@property (nonatomic, strong) NSArray *BdataSource;
@end

@implementation ViewController

- (UITableView *)tableView{
    if (_tableView == nil){
        _tableView = [[UITableView alloc] init];
        _tableView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor lightGrayColor];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}
- (NSArray *)AdataSource
{
    if (_AdataSource == nil) {
        _AdataSource = @[@"push AviewController", @"present  AviewController", @"present Url AviewController", @"push error viewController"];
    }
    return _AdataSource;
}

- (NSArray *)BdataSource
{
    if (_BdataSource == nil) {
        _BdataSource = @[@"push BviewController", @"present  BviewController", @"present Url BviewController", @"push error viewController"];
    }
    return _BdataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0){
        return self.AdataSource.count;
    }else {
        return self.BdataSource.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (indexPath.section == 0){
        cell.textLabel.text = self.AdataSource[indexPath.row];
    }else {
        cell.textLabel.text = self.BdataSource[indexPath.row];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0){
        if (indexPath.row == 0){
            UIViewController *vc = [[CBMediator sharedInstance] CBMediator_ViewController];
            [self.navigationController pushViewController:vc animated:YES];
        }else if (indexPath.row == 1){
            UIViewController *vc = [[CBMediator sharedInstance] CBMediator_ViewController];
            [self presentViewController:vc animated:YES completion:nil];
        }else if (indexPath.row == 2){
            UIViewController *vc = [[CBMediator sharedInstance] CBMediator_forUrltoViewController:@"aaa://A/AnativeFetchDetailViewController?key=The remote Url AViewController"];
            [self presentViewController:vc animated:YES completion:nil];
        }else if (indexPath.row == 3){
            UIViewController *vc = [[CBMediator sharedInstance] CBMediator_ErrorViewController];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }else {
        if (indexPath.row == 0){
            UIViewController *vc = [[CBMediator sharedInstance] CBMediator_BViewController];
            [self.navigationController pushViewController:vc animated:YES];
        }else if (indexPath.row == 1){
            UIViewController *vc = [[CBMediator sharedInstance] CBMediator_BViewController];
            [self presentViewController:vc animated:YES completion:nil];
        }else if (indexPath.row == 2){
            UIViewController *vc = [[CBMediator sharedInstance] CBMediator_forUrltoViewController:@"aaa://B/BnativeFetchDetailViewController?key=The remote Url BViewController"];
            [self presentViewController:vc animated:YES completion:nil];
        }else if (indexPath.row == 3){
            UIViewController *vc = [[CBMediator sharedInstance] CBMediator_ErrorViewController];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}



//----------醉醉的--------------
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
