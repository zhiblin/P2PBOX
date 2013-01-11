//
//  PLBSViewController.h
//  P2PBOX
//
//  Created by p2pmsg on 12-12-26.
//  Copyright (c) 2012年 p2pmsg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface PLBSViewController : UIViewController<CLLocationManagerDelegate>{
    UITextField *startlatitudetextfield;
    UITextField *startlongitudetextfield;
    UITextField *distancetextfield;
    UITextField *endlatitudetextfield;
    UITextField *endlongitudetextfield;
    CLLocationManager *lm;
    NSString *lngstr;
    NSString *latstr;

}

@property (retain,nonatomic) UITextField *startlatitudetextfield;
@property (retain,nonatomic) UITextField *startlongitudetextfield;
@property (retain,nonatomic) UITextField *distancetextfield;
@property (retain,nonatomic) UITextField *endlatitudetextfield;
@property (retain,nonatomic) UITextField *endlongitudetextfield;
@property (retain,nonatomic) NSString *lngstr;
@property (retain,nonatomic) NSString *latstr;


@end
