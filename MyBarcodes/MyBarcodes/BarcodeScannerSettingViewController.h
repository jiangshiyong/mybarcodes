//
//  BarcodeScannerSettingViewController.h
//  MyBarcodes
//
//  Created by shiyong on 14/12/3.
//  Copyright (c) 2014年 DanDanChina. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BarcodeScannerSettingDelegate <NSObject>
@required
- (void) barcodeScannerSettingsChanged:(NSString *)allowedTypes;
@end

@interface BarcodeScannerSettingViewController : UIViewController

@property (weak) id <BarcodeScannerSettingDelegate> delegate;

@end
