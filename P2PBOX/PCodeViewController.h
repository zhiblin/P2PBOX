//
//  PCodeViewController.h
//  P2PBOX
//
//  Created by p2pmsg on 12-12-28.
//  Copyright (c) 2012年 p2pmsg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBarSDK.h"

@interface PCodeViewController : UIViewController<UITextFieldDelegate,ZBarReaderDelegate>

{
    UILabel *label;
    UITextField *addressfield;
    UIButton *generatorbut;
    UIButton *scanbut;
    UIImageView *codeImage;
}

@property(nonatomic, retain) UITextField *addressfield;
@property(nonatomic, retain) UIButton *generatorbut;
@property(nonatomic, retain) UIButton *scanbut;
@property(nonatomic, retain) UIImageView *codeImage;
@property(nonatomic, retain) UILabel *label;


@end
