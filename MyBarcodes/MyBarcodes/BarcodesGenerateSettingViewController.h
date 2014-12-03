//
//  BarcodesGenerateSettingViewController.h
//  MyBarcodes
//
//  Created by shiyong on 14/12/3.
//  Copyright (c) 2014年 DanDanChina. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol BarcodesGenerateSettingsDelegate <NSObject>
@required
- (void) barcodesGenerateSettingsChanged:(NSString *)allowedTypes;
@end


@interface BarcodesGenerateSettingViewController : UIViewController

@property (nonatomic)NSInteger barcodesType;
@property (weak) id <BarcodesGenerateSettingsDelegate> delegate;

@end
