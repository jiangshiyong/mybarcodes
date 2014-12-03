//
//  ZxingScannerViewController.h
//  MyBarcodes
//
//  Created by shiyong on 14/12/3.
//  Copyright (c) 2014年 DanDanChina. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZXingObjC.h"
#import <AudioToolbox/AudioToolbox.h>

@protocol ZingbarcodeScanCodefinishedDelegate <NSObject>

@optional

- (void)zingbarcodeScanFinishedWithformat:(NSString *)formatString withBarcodeScanner:(NSString *)barcodeScanner;

@end

@interface ZxingScannerViewController : UIViewController


@property (strong,nonatomic)id<ZingbarcodeScanCodefinishedDelegate>       delegate;
@end
