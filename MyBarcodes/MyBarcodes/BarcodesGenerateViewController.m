//
//  ViewController.m
//  MyBarcodes
//
//  Created by shiyong on 14/12/2.
//  Copyright (c) 2014年 DanDanChina. All rights reserved.
//

#import "BarcodesGenerateViewController.h"
#import "SVProgressHUD.h"
#import "BarcodesGenerateSettingViewController.h"
#import "UIImage-NKDBarcode.h"

#import "NKDBarcode.h"
#import "NKDUPCEBarcode.h"
#import "NKDCode128Barcode.h"
#import "NKDCode39Barcode.h"
#import "NKDEAN13Barcode.h"
#import "NKDEAN8Barcode.h"
#import "NKDExtendedCode39Barcode.h"
#import "NKDModifiedPlesseyBarcode.h"
#import "NKDPostnetBarcode.h"
#import "NKDRoyalMailBarcode.h"
#import "NKDUPCABarcode.h"
#import "NKDUPCEBarcode.h"
#import "ZXingObjC.h"

@interface BarcodesGenerateViewController ()<UITextFieldDelegate,BarcodesGenerateSettingsDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *barcodesImageView;
@property (weak, nonatomic) IBOutlet UITextField *myTextField;
@property (weak, nonatomic) IBOutlet UILabel *barcodesTypeLabel;

@property (nonatomic,strong)NSString *barcodesString;
@property (nonatomic,strong)NSString *barcodesType;

@end

@implementation BarcodesGenerateViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.barcodesString = @"";
    self.barcodesType = @"NKDCode128Barcode";
    //self.barcodesType = @"NKDEAN13Barcode";
    self.myTextField.delegate = self;
    self.barcodesTypeLabel.text = self.barcodesType;
    //self.title = @"条形码生成";
    //self.barcodesImageView.contentMode = UIViewContentModeScaleAspectFit;

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
    [SVProgressHUD dismiss];
}

- (void)viewDidDisappear:(BOOL)animated {
    
    [super viewDidDisappear:animated];
}

-(void)zxingBarcodesGenerate:(ZXBarcodeFormat)myZXBarcodeFormat {
    
    NSError *error = nil;
    ZXMultiFormatWriter *writer = [ZXMultiFormatWriter writer];
    
    ZXBitMatrix* result = [writer encode:self.barcodesString
                                  format:myZXBarcodeFormat
                                   width:500
                                  height:500
                                   error:&error];
    if (result) {
        CGImageRef image = [[ZXImage imageWithMatrix:result] cgimage];
        
        // This CGImageRef image can be placed in a UIImage, NSImage, or written to a file.
        self.barcodesImageView.image = [UIImage imageWithCGImage:image];
        
    } else {
        NSString *errorMessage = [error localizedDescription];
        
        [SVProgressHUD showErrorWithStatus:errorMessage];
    }

}
- (IBAction)zxingSettingViewControllerClicked:(id)sender {
    
    BarcodesGenerateSettingViewController *viewController = [[BarcodesGenerateSettingViewController alloc]init];
    viewController.delegate = self;
    viewController.barcodesType = 1;
    [self.navigationController pushViewController:viewController animated:YES];
}

- (IBAction)settingViewControllerClicked:(id)sender {
    
    BarcodesGenerateSettingViewController *viewController = [[BarcodesGenerateSettingViewController alloc]init];
    viewController.delegate = self;
    viewController.barcodesType = 0;
    [self.navigationController pushViewController:viewController animated:YES];
}

- (IBAction)zxingBarcodesGenerateClicked:(id)sender {

    if (![self.barcodesString isEqualToString:@""]) {
        
        if (![self.barcodesType isEqualToString:@""]) {
            
            if ([self.barcodesType isEqualToString:@"kBarcodeFormatAztec"]) {
                
                [self zxingBarcodesGenerate:kBarcodeFormatAztec];
                
            }else if ([self.barcodesType isEqualToString:@"kBarcodeFormatCodabar"]){
                
                [self zxingBarcodesGenerate:kBarcodeFormatCodabar];
            }else if ([self.barcodesType isEqualToString:@"kBarcodeFormatCode39"]){
                
                [self zxingBarcodesGenerate:kBarcodeFormatCode39];
            }else if ([self.barcodesType isEqualToString:@"kBarcodeFormatCode93"]){
                
                [self zxingBarcodesGenerate:kBarcodeFormatCode93];
            }else if ([self.barcodesType isEqualToString:@"kBarcodeFormatCode128"]){
                
                [self zxingBarcodesGenerate:kBarcodeFormatCode128];
            }else if ([self.barcodesType isEqualToString:@"kBarcodeFormatDataMatrix"]){
                
                [self zxingBarcodesGenerate:kBarcodeFormatDataMatrix];
            }else if ([self.barcodesType isEqualToString:@"kBarcodeFormatEan8"]){
                
                [self zxingBarcodesGenerate:kBarcodeFormatEan8];
            }else if ([self.barcodesType isEqualToString:@"kBarcodeFormatEan13"]){
                
                [self zxingBarcodesGenerate:kBarcodeFormatEan13];
            }else if ([self.barcodesType isEqualToString:@"kBarcodeFormatITF"]){
                
                [self zxingBarcodesGenerate:kBarcodeFormatITF];
            }else if ([self.barcodesType isEqualToString:@"kBarcodeFormatMaxiCode"]){
                
                [self zxingBarcodesGenerate:kBarcodeFormatMaxiCode];
            }else if ([self.barcodesType isEqualToString:@"kBarcodeFormatPDF417"]){
                
                [self zxingBarcodesGenerate:kBarcodeFormatPDF417];
            }else if ([self.barcodesType isEqualToString:@"kBarcodeFormatQRCode"]){
                
                [self zxingBarcodesGenerate:kBarcodeFormatQRCode];
            }else if ([self.barcodesType isEqualToString:@"kBarcodeFormatRSS14"]){
                
                [self zxingBarcodesGenerate:kBarcodeFormatRSS14];
            }else if ([self.barcodesType isEqualToString:@"kBarcodeFormatRSSExpanded"]){
                
                [self zxingBarcodesGenerate:kBarcodeFormatRSSExpanded];
            }else if ([self.barcodesType isEqualToString:@"kBarcodeFormatUPCA"]){
                
                [self zxingBarcodesGenerate:kBarcodeFormatUPCA];
            }else if ([self.barcodesType isEqualToString:@"kBarcodeFormatUPCE"]){
                
                [self zxingBarcodesGenerate:kBarcodeFormatUPCEANExtension];
            }else if ([self.barcodesType isEqualToString:@"kBarcodeFormatUPCEANExtension"]){
                
                [self zxingBarcodesGenerate:kBarcodeFormatUPCE];
            }else{
                
                [self zxingBarcodesGenerate:kBarcodeFormatCode128];
            }
        }
        self.barcodesTypeLabel.text = self.barcodesType;
    }else{
        
        [SVProgressHUD showErrorWithStatus:@"请输入内容"];
    }
}

- (IBAction)barcodesGenerateClicked:(id)sender {

    if (![self.barcodesString isEqualToString:@""]) {

        if (![self.barcodesType isEqualToString:@""]) {
            
            if ([self.barcodesType isEqualToString:@"NKDBarcode"]) {
                
                NKDBarcode *code = [[NKDBarcode alloc]initWithContent:self.barcodesString printsCaption:YES];
                UIImage * generatedImage = [UIImage imageFromBarcode:code]; // ..or as a less accurate UIImage
                self.barcodesImageView.image = generatedImage;
            }else if ([self.barcodesType isEqualToString:@"NKDUPCEBarcode"]){
                
                NKDUPCEBarcode *code = [[NKDUPCEBarcode alloc]initWithContent:self.barcodesString printsCaption:YES];
                UIImage * generatedImage = [UIImage imageFromBarcode:code]; // ..or as a less accurate UIImage
                self.barcodesImageView.image = generatedImage;
            }else if ([self.barcodesType isEqualToString:@"NKDCode128Barcode"]){
                
                NKDCode128Barcode *code = [[NKDCode128Barcode alloc]initWithContent:self.barcodesString printsCaption:YES];
                //NSData * generatedPdf = [UIImage pdfFromBarcode:code];
                //UIImage * generatedImage = [UIImage imageWithData:generatedPdf];
                UIImage * generatedImage = [UIImage imageFromBarcode:code]; // ..or as a less accurate UIImage
                generatedImage=[UIImage imageWithCGImage:generatedImage.CGImage scale:1.0 orientation:UIImageOrientationDown];
                self.barcodesImageView.image = generatedImage;
            }else if ([self.barcodesType isEqualToString:@"NKDCode39Barcode"]){
                
                NKDCode39Barcode *code = [[NKDCode39Barcode alloc]initWithContent:self.barcodesString printsCaption:YES];
                UIImage * generatedImage = [UIImage imageFromBarcode:code]; // ..or as a less accurate UIImage
                self.barcodesImageView.image = generatedImage;
            }else if ([self.barcodesType isEqualToString:@"NKDEAN13Barcode"]){
                
                NKDEAN13Barcode *code = [[NKDEAN13Barcode alloc]initWithContent:self.barcodesString printsCaption:YES];
                UIImage * generatedImage = [UIImage imageFromBarcode:code]; // ..or as a less accurate UIImage
                self.barcodesImageView.image = generatedImage;
            }else if ([self.barcodesType isEqualToString:@"NKDExtendedCode39Barcode"]){
                
                NKDExtendedCode39Barcode *code = [[NKDExtendedCode39Barcode alloc]initWithContent:self.barcodesString printsCaption:YES];
                UIImage * generatedImage = [UIImage imageFromBarcode:code]; // ..or as a less accurate UIImage
                self.barcodesImageView.image = generatedImage;
            }else if ([self.barcodesType isEqualToString:@"NKDModifiedPlesseyBarcode"]){
                
                NKDModifiedPlesseyBarcode *code = [[NKDModifiedPlesseyBarcode alloc]initWithContent:self.barcodesString printsCaption:YES];
                UIImage * generatedImage = [UIImage imageFromBarcode:code]; // ..or as a less accurate UIImage
                self.barcodesImageView.image = generatedImage;
            }else if ([self.barcodesType isEqualToString:@"NKDPostnetBarcode"]){
                
                NKDPostnetBarcode *code = [[NKDPostnetBarcode alloc]initWithContent:self.barcodesString printsCaption:YES];
                UIImage * generatedImage = [UIImage imageFromBarcode:code]; // ..or as a less accurate UIImage
                self.barcodesImageView.image = generatedImage;
            }else if ([self.barcodesType isEqualToString:@"NKDRoyalMailBarcode"]){
                
                NKDRoyalMailBarcode *code = [[NKDRoyalMailBarcode alloc]initWithContent:self.barcodesString printsCaption:YES];
                UIImage * generatedImage = [UIImage imageFromBarcode:code]; // ..or as a less accurate UIImage
                self.barcodesImageView.image = generatedImage;
            }else if ([self.barcodesType isEqualToString:@"NKDUPCABarcode"]){
                
                NKDUPCABarcode *code = [[NKDUPCABarcode alloc]initWithContent:self.barcodesString printsCaption:YES];
                UIImage * generatedImage = [UIImage imageFromBarcode:code]; // ..or as a less accurate UIImage
                self.barcodesImageView.image = generatedImage;
            }else if ([self.barcodesType isEqualToString:@"NKDUPCEBarcode"]){
                
                NKDUPCEBarcode *code = [[NKDUPCEBarcode alloc]initWithContent:self.barcodesString printsCaption:YES];
                UIImage * generatedImage = [UIImage imageFromBarcode:code]; // ..or as a less accurate UIImage
                self.barcodesImageView.image = generatedImage;
            }
        }
    }else{
        
        [SVProgressHUD showErrorWithStatus:@"请输入内容"];
    }
}

- (IBAction)downLoadImage:(id)sender {
    
    UIImage *tempPhoto = self.barcodesImageView.image;
    if (tempPhoto) {
        
        [self saveImageToPhotos:tempPhoto];
    }
}

- (void)saveImageToPhotos:(UIImage*)savedImage {
    
    UIImageWriteToSavedPhotosAlbum(savedImage, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
}

// 指定回调方法
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *) error contextInfo: (void *) contextInfo {
    
    NSString *msg = nil;
    [SVProgressHUD dismiss];
    if(error != NULL){
        
        msg = @"保存图片失败" ;
        [SVProgressHUD showErrorWithStatus:msg];
    }else{
        
        msg = @"保存图片成功" ;
        [SVProgressHUD showSuccessWithStatus:msg];
    }
}

#pragma mark -
#pragma mark - BarcodesGenerateSettingsDelegate
- (void) barcodesGenerateSettingsChanged:(NSString *)allowedTypes {

    self.barcodesType = allowedTypes;
    self.barcodesTypeLabel.text = allowedTypes;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self.myTextField resignFirstResponder];
}

#pragma mark -
#pragma mark textField
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
	textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [UIView animateWithDuration:0.3 animations:^{
        
        CGRect myViewframe=self.view.frame;
        myViewframe.origin.y=-88;
        [self.view setFrame:myViewframe];
    } completion:^(BOOL finished){
        
    }];
	return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
	
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    
	return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    [textField resignFirstResponder];
    self.barcodesString = self.myTextField.text;
    
    if (self.view.frame.size.height==480.0f||self.view.frame.size.height==460.0f) {
        
        [UIView animateWithDuration:0.3 animations:^{
            
            CGRect myViewframe=self.view.frame;
            myViewframe.origin.y=0;
            [self.view setFrame:myViewframe];
        } completion:^(BOOL finished){
            
        }];
    }else{
        
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	
	[textField resignFirstResponder];
	return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
