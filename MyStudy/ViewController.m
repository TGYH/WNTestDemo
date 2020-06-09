//
//  ViewController.m
//  MyStudy
//
//  Created by 王家楠 on 2020/6/8.
//  Copyright © 2020 王家楠. All rights reserved.
//

#import "ViewController.h"

#import "DIYView.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *showArr;

@property (nonatomic, strong) DIYView *subView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"知识点";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSLog(@"Hello World!");
    
    [self initData];
    
    [self initUI];
}

-(void)layoutSubviews
{
    NSLog(@"我是 %s",__func__);
}

-(void)initUI
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    [self.tableView makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.safeAreaLayoutGuideTop);
        make.bottom.equalTo(self.view.safeAreaLayoutGuideBottom);
        make.left.equalTo(self.view.safeAreaLayoutGuideLeft);
        make.right.equalTo(self.view.safeAreaLayoutGuideRight);
    }];
    
    self.subView = [[DIYView alloc] init];
    [self.view addSubview:self.subView];
    
    [self.subView makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.equalTo(100);
    
    }];
}

-(void)initData
{
    self.showArr = @[@"Masonry",@"组件化"];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.showArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *flagStr = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:flagStr];
    
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:flagStr];
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.textLabel.text = self.showArr[indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self.subView layoutIfNeeded];//
    
    [WNNetWorkManager postTo:@{}];
}

@end
