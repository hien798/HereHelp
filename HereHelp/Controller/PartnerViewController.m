//
//  PartnerViewController.m
//  HereHelp
//
//  Created by Hiên Hiên on 11/18/18.
//  Copyright © 2018 Hiên Hiên. All rights reserved.
//

#import "PartnerViewController.h"
#import "UIImage+Resize.h"
#import <NMAKit/NMAKit.h>

@interface PartnerViewController ()
@property (weak, nonatomic) IBOutlet NMAMapView *mapView;
@property (weak, nonatomic) IBOutlet UIButton *hereBtn;
@property (weak, nonatomic) IBOutlet UIButton *pickupBtn;

@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIView *waitinView;
@property (weak, nonatomic) IBOutlet UIButton *acceptBtn;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;


@end

@implementation PartnerViewController
{
    NMAMapMarker *_customer1;
    NMAMapMarker *_customer2;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupView];
    
    _mapView.positionIndicator.visible = YES;
    _mapView.positionIndicator.accuracyIndicatorVisible = YES;
    
    NMAPositioningManager.sharedPositioningManager.dataSource = [[NMAHEREPositionSource alloc] init];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self setHereLocation];
    });
    
}

- (void)setupView {
    
    _waitinView.layer.cornerRadius = 125.f;
    _acceptBtn.layer.cornerRadius = 20.f;
    _cancelBtn.layer.cornerRadius = 20.f;
    _backView.hidden = YES;
    _waitinView.hidden = YES;
    
    NMAGeoCoordinates *coord1 = [[NMAGeoCoordinates alloc] initWithLatitude:10.853675 longitude:106.789372];
    NMAGeoCoordinates *coord2 = [[NMAGeoCoordinates alloc] initWithLatitude:10.859491 longitude:106.790745];
    UIImage *uiImage1 = [UIImage imageNamed:@"moto"];
    UIImage *newImage1  = [UIImage imageWithImage:uiImage1 size:CGSizeMake(40*uiImage1.size.height/uiImage1.size.width, 40)];
    NMAImage *image1 = [NMAImage imageWithUIImage:newImage1];
    
    UIImage *uiImage2 = [UIImage imageNamed:@"car"];
    UIImage *newImage2  = [UIImage imageWithImage:uiImage2 size:CGSizeMake(40*uiImage2.size.height/uiImage2.size.width, 40)];
    NMAImage *image2 = [NMAImage imageWithUIImage:newImage2];
    
    _customer1 = [NMAMapMarker mapMarkerWithGeoCoordinates:coord1 icon:image1];
    _customer2 = [NMAMapMarker mapMarkerWithGeoCoordinates:coord2 icon:image2];
    
    [self.mapView addMapObject:_customer1];
    [self.mapView addMapObject:_customer2];
}

- (void)setHereLocation {
    NMAGeoPosition *currentPosition = [[NMAPositioningManager sharedPositioningManager] currentPosition];
    [_mapView setGeoCenter:currentPosition.coordinates withAnimation:(NMAMapAnimationRocket)];
}

- (IBAction)getHereLocation:(id)sender {
    [self setHereLocation];
}

- (IBAction)pickupBtn:(id)sender {
    _backView.hidden = NO;
    _waitinView.hidden = NO;
}

- (IBAction)acceptBtn:(UIButton *)sender {
    _backView.hidden = YES;
    _waitinView.hidden = YES;
}

- (IBAction)cancelBtn:(UIButton *)sender {
    _backView.hidden = YES;
    _waitinView.hidden = YES;
}

@end
