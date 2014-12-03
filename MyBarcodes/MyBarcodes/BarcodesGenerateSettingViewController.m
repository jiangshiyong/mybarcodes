//
//  BarcodesGenerateSettingViewController.m
//  MyBarcodes
//
//  Created by shiyong on 14/12/3.
//  Copyright (c) 2014年 DanDanChina. All rights reserved.
//

#import "BarcodesGenerateSettingViewController.h"

@interface BarcodesGenerateSettingViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@property (strong,nonatomic) NSArray           *myAllArray;

@end

@implementation BarcodesGenerateSettingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"选择编码方式";
    
    if (self.barcodesType==0) {
        
        self.myAllArray = @[@"NKDBarcode",@"NKDUPCEBarcode",@"NKDCode128Barcode",@"NKDCode39Barcode",@"NKDEAN13Barcode",@"NKDExtendedCode39Barcode",@"NKDModifiedPlesseyBarcode",@"NKDPostnetBarcode",@"NKDRoyalMailBarcode",@"NKDUPCABarcode",@"NKDUPCEBarcode"];
    }else if (self.barcodesType==1){
        
        self.myAllArray = @[@"kBarcodeFormatAztec",@"kBarcodeFormatCodabar",@"kBarcodeFormatCode39",@"kBarcodeFormatCode93",@"kBarcodeFormatCode128",@"kBarcodeFormatDataMatrix",@"kBarcodeFormatEan8",@"kBarcodeFormatEan13",@"kBarcodeFormatITF",@"kBarcodeFormatMaxiCode",@"kBarcodeFormatPDF417",@"kBarcodeFormatQRCode",@"kBarcodeFormatRSS14",@"kBarcodeFormatRSSExpanded",@"kBarcodeFormatUPCA",@"kBarcodeFormatUPCE",@"kBarcodeFormatUPCEANExtension"];
    }else{
        
        self.myAllArray = @[@"NKDBarcode",@"NKDUPCEBarcode",@"NKDCode128Barcode",@"NKDCode39Barcode",@"NKDEAN13Barcode",@"NKDExtendedCode39Barcode",@"NKDModifiedPlesseyBarcode",@"NKDPostnetBarcode",@"NKDRoyalMailBarcode",@"NKDUPCABarcode",@"NKDUPCEBarcode"];
    }
    
    self.myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.backgroundColor = [UIColor clearColor];
    [self.myTableView reloadData];
    self.tabBarController.tabBar.hidden = YES;
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
            
            if ([self.delegate respondsToSelector:@selector(barcodesGenerateSettingsChanged:)]) {
                
                [self.delegate barcodesGenerateSettingsChanged:self.myAllArray[indexPath.row]];
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
