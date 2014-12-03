//
//  BarcodeScannerViewController.m
//  MyBarcodes
//
//  Created by shiyong on 14/12/2.
//  Copyright (c) 2014年 DanDanChina. All rights reserved.
//

#import "BarcodeScannerViewController.h"
#import "BarcodeScannerSettingViewController.h"
#import "ZBarSDK.h"
#import "ZxingScannerViewController.h"

@interface BarcodeScannerViewController ()<BarcodeScannerSettingDelegate,ZBarReaderDelegate,ZingbarcodeScanCodefinishedDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (strong,nonatomic)ZBarReaderViewController *zBarReaderView;
@property (weak, nonatomic) IBOutlet UILabel *barcodesTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *barcodeScannerResultLabel;
@property (nonatomic,strong)NSString *barcodesType;
@end

@implementation BarcodeScannerViewController

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
    
    //self.barcodesType = @"ZBAR_CODE128";
    self.barcodesType = @"ZBAR_ISBN13";
    self.barcodesTypeLabel.text =  self.barcodesType;
    self.title = @"条码扫描";
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.hidden = NO;
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


- (IBAction)zxingBarcodeScanner:(id)sender {
    
    ZxingScannerViewController *scanCodeView = [[ZxingScannerViewController alloc]init];
    scanCodeView.delegate = self;
    //scanCodeView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [scanCodeView setModalPresentationStyle:UIModalPresentationPageSheet];
    [scanCodeView setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    //[self.navigationController pushViewController:scanCodeView animated:YES];
    if ([self respondsToSelector:@selector(presentViewController:animated:completion:)]){
        
        [self presentViewController:scanCodeView animated:YES completion:nil];
    } else {
        //[self presentModalViewController:reader animated:YES];
    }
}

- (IBAction)barcodeScannerClicked:(id)sender {
    
    self.barcodesTypeLabel.text = self.barcodesType;
    if (![self.barcodesType isEqualToString:@""]) {
        
        if ([self.barcodesType isEqualToString:@"ZBAR_NONE"]) {
            
            ZBarReaderViewController *reader = [ZBarReaderViewController new];
            reader.readerDelegate = self;
            ZBarImageScanner *scanner = reader.scanner;
            [scanner setSymbology: ZBAR_NONE
                           config: ZBAR_CFG_ENABLE
                               to: 0];
            
            if ([self respondsToSelector:@selector(presentViewController:animated:completion:)]){
                [self presentViewController:reader animated:YES completion:nil];
            } else {
                //[self presentModalViewController:reader animated:YES];
            }
        }else if ([self.barcodesType isEqualToString:@"ZBAR_PARTIAL"]){
            
            ZBarReaderViewController *reader = [ZBarReaderViewController new];
            reader.readerDelegate = self;
            ZBarImageScanner *scanner = reader.scanner;
            [scanner setSymbology: ZBAR_PARTIAL
                           config: ZBAR_CFG_ENABLE
                               to: 0];
            
            if ([self respondsToSelector:@selector(presentViewController:animated:completion:)]){
                [self presentViewController:reader animated:YES completion:nil];
            } else {
                //[self presentModalViewController:reader animated:YES];
            }
        }else if ([self.barcodesType isEqualToString:@"ZBAR_EAN2"]){
            
            
            ZBarReaderViewController *reader = [ZBarReaderViewController new];
            reader.readerDelegate = self;
            ZBarImageScanner *scanner = reader.scanner;
            [scanner setSymbology: ZBAR_EAN2
                           config: ZBAR_CFG_ENABLE
                               to: 0];
            
            if ([self respondsToSelector:@selector(presentViewController:animated:completion:)]){
                [self presentViewController:reader animated:YES completion:nil];
            } else {
                //[self presentModalViewController:reader animated:YES];
            }
        }else if ([self.barcodesType isEqualToString:@"ZBAR_EAN5"]){
            
            ZBarReaderViewController *reader = [ZBarReaderViewController new];
            reader.readerDelegate = self;
            ZBarImageScanner *scanner = reader.scanner;
            [scanner setSymbology: ZBAR_EAN5
                           config: ZBAR_CFG_ENABLE
                               to: 0];
            
            if ([self respondsToSelector:@selector(presentViewController:animated:completion:)]){
                [self presentViewController:reader animated:YES completion:nil];
            } else {
                //[self presentModalViewController:reader animated:YES];
            }
        }else if ([self.barcodesType isEqualToString:@"ZBAR_EAN8"]){
            
            ZBarReaderViewController *reader = [ZBarReaderViewController new];
            reader.readerDelegate = self;
            ZBarImageScanner *scanner = reader.scanner;
            [scanner setSymbology: ZBAR_EAN8
                           config: ZBAR_CFG_ENABLE
                               to: 0];
            
            if ([self respondsToSelector:@selector(presentViewController:animated:completion:)]){
                [self presentViewController:reader animated:YES completion:nil];
            } else {
                //[self presentModalViewController:reader animated:YES];
            }
        }else if ([self.barcodesType isEqualToString:@"ZBAR_UPCE"]){
            
            ZBarReaderViewController *reader = [ZBarReaderViewController new];
            reader.readerDelegate = self;
            ZBarImageScanner *scanner = reader.scanner;
            [scanner setSymbology: ZBAR_UPCE
                           config: ZBAR_CFG_ENABLE
                               to: 0];
            
            if ([self respondsToSelector:@selector(presentViewController:animated:completion:)]){
                [self presentViewController:reader animated:YES completion:nil];
            } else {
                //[self presentModalViewController:reader animated:YES];
            }
        }else if ([self.barcodesType isEqualToString:@"ZBAR_ISBN10"]){
            
            ZBarReaderViewController *reader = [ZBarReaderViewController new];
            reader.readerDelegate = self;
            ZBarImageScanner *scanner = reader.scanner;
            [scanner setSymbology: ZBAR_ISBN10
                           config: ZBAR_CFG_ENABLE
                               to: 0];
            
            if ([self respondsToSelector:@selector(presentViewController:animated:completion:)]){
                [self presentViewController:reader animated:YES completion:nil];
            } else {
                //[self presentModalViewController:reader animated:YES];
            }
        }else if ([self.barcodesType isEqualToString:@"ZBAR_UPCA"]){
            
            ZBarReaderViewController *reader = [ZBarReaderViewController new];
            reader.readerDelegate = self;
            ZBarImageScanner *scanner = reader.scanner;
            [scanner setSymbology: ZBAR_UPCA
                           config: ZBAR_CFG_ENABLE
                               to: 0];
            
            if ([self respondsToSelector:@selector(presentViewController:animated:completion:)]){
                [self presentViewController:reader animated:YES completion:nil];
            } else {
                //[self presentModalViewController:reader animated:YES];
            }
        }else if ([self.barcodesType isEqualToString:@"ZBAR_EAN13"]){
            
            ZBarReaderViewController *reader = [ZBarReaderViewController new];
            reader.readerDelegate = self;
            ZBarImageScanner *scanner = reader.scanner;
            [scanner setSymbology: ZBAR_EAN13
                           config: ZBAR_CFG_ENABLE
                               to: 0];
            
            if ([self respondsToSelector:@selector(presentViewController:animated:completion:)]){
                [self presentViewController:reader animated:YES completion:nil];
            } else {
                //[self presentModalViewController:reader animated:YES];
            }
        }else if ([self.barcodesType isEqualToString:@"ZBAR_ISBN13"]){
            
            ZBarReaderViewController *reader = [ZBarReaderViewController new];
            reader.readerDelegate = self;
            ZBarImageScanner *scanner = reader.scanner;
            [scanner setSymbology: ZBAR_ISBN13
                           config: ZBAR_CFG_ENABLE
                               to: 0];
            
            if ([self respondsToSelector:@selector(presentViewController:animated:completion:)]){
                [self presentViewController:reader animated:YES completion:nil];
            } else {
                //[self presentModalViewController:reader animated:YES];
            }
        }else if ([self.barcodesType isEqualToString:@"ZBAR_COMPOSITE"]){
            
            ZBarReaderViewController *reader = [ZBarReaderViewController new];
            reader.readerDelegate = self;
            ZBarImageScanner *scanner = reader.scanner;
            [scanner setSymbology: ZBAR_COMPOSITE
                           config: ZBAR_CFG_ENABLE
                               to: 0];
            
            if ([self respondsToSelector:@selector(presentViewController:animated:completion:)]){
                [self presentViewController:reader animated:YES completion:nil];
            } else {
                //[self presentModalViewController:reader animated:YES];
            }
        }else if ([self.barcodesType isEqualToString:@"ZBAR_I25"]){
            
            ZBarReaderViewController *reader = [ZBarReaderViewController new];
            reader.readerDelegate = self;
            ZBarImageScanner *scanner = reader.scanner;
            [scanner setSymbology: ZBAR_I25
                           config: ZBAR_CFG_ENABLE
                               to: 0];
            
            if ([self respondsToSelector:@selector(presentViewController:animated:completion:)]){
                [self presentViewController:reader animated:YES completion:nil];
            } else {
                //[self presentModalViewController:reader animated:YES];
            }
        }else if ([self.barcodesType isEqualToString:@"ZBAR_DATABAR"]){
            
            ZBarReaderViewController *reader = [ZBarReaderViewController new];
            reader.readerDelegate = self;
            ZBarImageScanner *scanner = reader.scanner;
            [scanner setSymbology: ZBAR_DATABAR
                           config: ZBAR_CFG_ENABLE
                               to: 0];
            
            if ([self respondsToSelector:@selector(presentViewController:animated:completion:)]){
                [self presentViewController:reader animated:YES completion:nil];
            } else {
                //[self presentModalViewController:reader animated:YES];
            }
        }else if ([self.barcodesType isEqualToString:@"ZBAR_DATABAR_EXP"]){
            
            ZBarReaderViewController *reader = [ZBarReaderViewController new];
            reader.readerDelegate = self;
            ZBarImageScanner *scanner = reader.scanner;
            [scanner setSymbology: ZBAR_DATABAR_EXP
                           config: ZBAR_CFG_ENABLE
                               to: 0];
            
            if ([self respondsToSelector:@selector(presentViewController:animated:completion:)]){
                [self presentViewController:reader animated:YES completion:nil];
            } else {
                //[self presentModalViewController:reader animated:YES];
            }
        }else if ([self.barcodesType isEqualToString:@"ZBAR_CODE39"]){
            
            ZBarReaderViewController *reader = [ZBarReaderViewController new];
            reader.readerDelegate = self;
            ZBarImageScanner *scanner = reader.scanner;
            [scanner setSymbology: ZBAR_CODE39
                           config: ZBAR_CFG_ENABLE
                               to: 0];
            
            if ([self respondsToSelector:@selector(presentViewController:animated:completion:)]){
                [self presentViewController:reader animated:YES completion:nil];
            } else {
                //[self presentModalViewController:reader animated:YES];
            }
        }else if ([self.barcodesType isEqualToString:@"ZBAR_PDF417"]){
            
            ZBarReaderViewController *reader = [ZBarReaderViewController new];
            reader.readerDelegate = self;
            ZBarImageScanner *scanner = reader.scanner;
            [scanner setSymbology: ZBAR_PDF417
                           config: ZBAR_CFG_ENABLE
                               to: 0];
            
            if ([self respondsToSelector:@selector(presentViewController:animated:completion:)]){
                [self presentViewController:reader animated:YES completion:nil];
            } else {
                //[self presentModalViewController:reader animated:YES];
            }
        }else if ([self.barcodesType isEqualToString:@"ZBAR_QRCODE"]){
            
            ZBarReaderViewController *reader = [ZBarReaderViewController new];
            reader.readerDelegate = self;
            ZBarImageScanner *scanner = reader.scanner;
            [scanner setSymbology: ZBAR_QRCODE
                           config: ZBAR_CFG_ENABLE
                               to: 0];
            
            if ([self respondsToSelector:@selector(presentViewController:animated:completion:)]){
                [self presentViewController:reader animated:YES completion:nil];
            } else {
                //[self presentModalViewController:reader animated:YES];
            }
        }else if ([self.barcodesType isEqualToString:@"ZBAR_CODE93"]){
            
            ZBarReaderViewController *reader = [ZBarReaderViewController new];
            reader.readerDelegate = self;
            ZBarImageScanner *scanner = reader.scanner;
            [scanner setSymbology: ZBAR_CODE93
                           config: ZBAR_CFG_ENABLE
                               to: 0];
            
            if ([self respondsToSelector:@selector(presentViewController:animated:completion:)]){
                [self presentViewController:reader animated:YES completion:nil];
            } else {
                //[self presentModalViewController:reader animated:YES];
            }
        }else if ([self.barcodesType isEqualToString:@"ZBAR_CODE128"]){
            
            ZBarReaderViewController *reader = [ZBarReaderViewController new];
            reader.readerDelegate = self;
            ZBarImageScanner *scanner = reader.scanner;
            [scanner setSymbology: ZBAR_CODE128
                           config: ZBAR_CFG_ENABLE
                               to: 0];
            
            if ([self respondsToSelector:@selector(presentViewController:animated:completion:)]){
                [self presentViewController:reader animated:YES completion:nil];
            } else {
                //[self presentModalViewController:reader animated:YES];
            }
        }else{
            
            ZBarReaderViewController *reader = [ZBarReaderViewController new];
            reader.readerDelegate = self;
            ZBarImageScanner *scanner = reader.scanner;
            [scanner setSymbology: ZBAR_ISBN13
                           config: ZBAR_CFG_ENABLE
                               to: 0];    //ZBAR_CFG_ENABLE
            
            
            if ([self respondsToSelector:@selector(presentViewController:animated:completion:)]){
                [self presentViewController:reader animated:YES completion:nil];
            } else {
                //[self presentModalViewController:reader animated:YES];
            }
        }
    }
}


- (IBAction)settingViewControllerClicked:(id)sender {
    
    BarcodeScannerSettingViewController *viewController = [[BarcodeScannerSettingViewController alloc]init];
    viewController.delegate = self;
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void) barcodeScannerSettingsChanged:(NSString *)allowedTypes {
    
    self.barcodesType = allowedTypes;
    
    self.barcodesTypeLabel.text = allowedTypes;
}

#pragma mark -
#pragma mark - ZingbarcodeScanCodefinishedDelegate
- (void)zingbarcodeScanFinishedWithformat:(NSString *)formatString withBarcodeScanner:(NSString *)barcodeScanner {

    self.barcodesTypeLabel.text = formatString;
    
    self.barcodeScannerResultLabel.text = barcodeScanner;
}

#pragma mark -
#pragma mark - ZBarDelegate
- (void)imagePickerController: (UIImagePickerController*) reader
 didFinishPickingMediaWithInfo: (NSDictionary*) info {
    
    // ADD: get the decode results
    id<NSFastEnumeration> results = [info objectForKey: ZBarReaderControllerResults];
    ZBarSymbol *symbol = nil;
    for(symbol in results)
        // EXAMPLE: just grab the first barcode
        break;
    
    // EXAMPLE: do something useful with the barcode data
    NSString *str = [NSString stringWithFormat:@"%@",symbol.data];
    NSLog(@"===%@",symbol.data);
    
    self.barcodeScannerResultLabel.text = str;
    
//    str = [self encodingScanResult:str];
//    str = [str stringByReplacingOccurrencesOfString:@"\"" withString:@""];
    
    UIImage *image = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    
    if (image) {//选择图片
        
        [self dismissViewControllerAnimated:YES completion:^{;}];
    }else{
        
        [self dismissViewControllerAnimated:YES completion:^{;}];
    }
}

- (void)readerControllerDidFailToRead: (ZBarReaderController*) reader withRetry: (BOOL) retry {
    
    if(retry){
        
        //retry == 1 选择图片为非二维码。
        if(![self.parentViewController isBeingDismissed]){
            [self dismissViewControllerAnimated:YES completion:nil];
        }
        return;
    }
}

- (NSString *)encodingScanResult:(NSString *)text {
    
    NSString *tempStr;
    //M_Johnny20131021:修正扫描出来二维码里有中文时为乱码问题
    if ([text canBeConvertedToEncoding:NSShiftJISStringEncoding])
    {
        tempStr = [NSString stringWithCString:[text cStringUsingEncoding:NSShiftJISStringEncoding] encoding:NSUTF8StringEncoding];
        
        //如果转化成utf-8失败，再尝试转化为gbk
        
        if (tempStr == nil)
        {
            tempStr = [NSString stringWithCString:[text cStringUsingEncoding:NSShiftJISStringEncoding] encoding:CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000)];
        }
        //如果转化为utf-8和gbk都失败，就显示原始扫描出来的字符串
        if (tempStr == nil)
        {
            tempStr = text;
        }
    }
    return tempStr;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
