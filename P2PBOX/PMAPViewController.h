//
//  PMAPViewController.h
//  P2PBOX
//
//  Created by p2pmsg on 12-12-26.
//  Copyright (c) 2012年 p2pmsg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface PMAPViewController : UIViewController<MKMapViewDelegate>

{
    MKMapView *mapview;
}

@property(retain, nonatomic) MKMapView *mapview;

@end
