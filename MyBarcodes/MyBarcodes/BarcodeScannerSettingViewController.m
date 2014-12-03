//
//  BarcodeScannerSettingViewController.m
//  MyBarcodes
//
//  Created by shiyong on 14/12/3.
//  Copyright (c) 2014年 DanDanChina. All rights reserved.
//

#import "BarcodeScannerSettingViewController.h"

@interface BarcodeScannerSettingViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@property (strong,nonatomic) NSArray           *myAllArray;

@end

@implementation BarcodeScannerSettingViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"选择编码方式";
    self.myAllArray = @[@"ZBAR_NONE",@"ZBAR_PARTIAL",@"ZBAR_EAN2",@"ZBAR_EAN5",@"ZBAR_EAN8",@"ZBAR_UPCE",@"ZBAR_ISBN10",@"ZBAR_UPCA",@"ZBAR_EAN13",@"ZBAR_ISBN13",@"ZBAR_COMPOSITE",@"ZBAR_I25",@"ZBAR_DATABAR",@"ZBAR_DATABAR_EXP",@"ZBAR_CODE39",@"ZBAR_PDF417",@"ZBAR_QRCODE",@"ZBAR_CODE93",@"ZBAR_CODE128"];
    self.myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.backgroundColor = [UIColor clearColor];
    [self.myTableView reloadData];
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    
    [super viewDidDisappear:animated];
}


#pragma mark -
#pragma mark UITableView data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    if (tableView==self.myTableView) {
        
        return 1;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (tableView==self.myTableView) {
        
        return 0;
    }else{
        
        return 0;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView==self.myTableView) {
        
        if (indexPath.section==0) {
            
            return 44.0f;
            
        }else if (indexPath.section==1) {
            
            return 44.0f;
        }
        return 44.0f;
    }else{
        
        return 44.0f;
    }
    return 44.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (tableView == self.myTableView){
        if (section==0) {
            
            if ([self.myAllArray count]>0) {
                
                return [self.myAllArray count];
            }else{
                return 0;
            }
        }else{
            
            return 1;
        }
        return 1;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static NSString *CellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (tableView == self.myTableView){
        
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        cell.textLabel.text = self.myAllArray[indexPath.row];
        return cell;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView==self.myTableView) {
        
        if (indexPath.section==0) {
            
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            
            if ([self.delegate respondsToSelector:@selector(barcodeScannerSettingsChanged:)]) {
                
                [self.delegate barcodeScannerSettingsChanged:self.myAllArray[indexPath.row]];
            }
            [self.navigationController popViewControllerAnimated:YES];
        }else{
            
        }
    }
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
