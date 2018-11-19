//
//  CustomerViewController.m
//  HereHelp
//
//  Created by Hiên Hiên on 11/17/18.
//  Copyright © 2018 Hiên Hiên. All rights reserved.
//

#import "CustomerViewController.h"
#import "CustomerPickupViewController.h"
#import "UIImage+Resize.h"

#import <NMAKit/NMAKit.h>

@interface CustomerViewController ()
@property (weak, nonatomic) IBOutlet NMAMapView *mapView;
@property (weak, nonatomic) IBOutlet UIButton *hereBtn;
@property (weak, nonatomic) IBOutlet UIButton *menuBtn;
@property (weak, nonatomic) IBOutlet UIButton *gasBtn;
@property (weak, nonatomic) IBOutlet UIButton *tyreBtn;
@property (weak, nonatomic) IBOutlet UIButton *brokenBtn;
@property (weak, nonatomic) IBOutlet UIButton *othersBtn;
@property (weak, nonatomic) IBOutlet UIButton *sosBtn;

// notiview
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIView *waitingView;
@property (weak, nonatomic) IBOutlet UIView *orderView;
@property (weak, nonatomic) IBOutlet UIButton *acceptServiceBtn;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;

@end

@implementation CustomerViewController
{
    NSMutableArray *_listGasMapMarker;
    NSMutableArray *_listTyreMapMarker;
    NSMutableArray *_listBrokenMapMarker;
    NSMutableArray *_listOthersMapMarker;
    NMAMapMarker *_mapMarker;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupData];
    [self setupView];
    [self hiddenAllSearchBtn];
    
    _mapView.positionIndicator.visible = YES;
    _mapView.positionIndicator.accuracyIndicatorVisible = YES;
    
    NMAPositioningManager.sharedPositioningManager.dataSource = [[NMAHEREPositionSource alloc] init];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self setHereLocation];
    });
    
    [self addBrokenMapMarker];
}

- (void)setupView {
    _waitingView.layer.cornerRadius = 125.f;
    _acceptServiceBtn.layer.cornerRadius = 20.f;
    _cancelBtn.layer.cornerRadius = 20.f;
    _waitingView.hidden = YES;
    _backView.hidden = YES;
    _orderView.hidden = YES;
}

- (void)setupData {
    [self createGasMapMarker];
    [self createTyreMapMarker];
    [self createBrokenMapMarker];
}

- (IBAction)getHereLocation:(id)sender {
    [self setHereLocation];
}

- (IBAction)pickupBtn:(id)sender {
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    CustomerPickupViewController *pickupVC = [storyboard instantiateViewControllerWithIdentifier:@"CustomerPickupViewController"];
//    [self.navigationController pushViewController:pickupVC animated:YES];
    
    
    
}

- (void)setHereLocation {
    NMAGeoPosition *currentPosition = [[NMAPositioningManager sharedPositioningManager] currentPosition];
    [_mapView setGeoCenter:currentPosition.coordinates withAnimation:(NMAMapAnimationRocket)];
}

- (IBAction)sosBtn:(id)sender {
    _backView.hidden = NO;
    _waitingView.hidden = NO;
    _orderView.hidden = YES;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.orderView.hidden = NO;
    });
}

- (IBAction)searchBtn:(id)sender {
    if (_gasBtn.isHidden) {
        [self displayAllSearchBtn];
    } else {
        [self hiddenAllSearchBtn];
    }
}

- (IBAction)gasBtn:(id)sender {
    [self addGasMapMarker];
}

- (IBAction)tyreBtn:(id)sender {
    [self addTyreMapMarker];
}

- (IBAction)brokenBtn:(id)sender {
    [self addBrokenMapMarker];
}

- (IBAction)othersBtn:(id)sender {
//    [self.mapView addMapObjects:_listOthersMapMarker];
//    [self hiddenAllSearchBtn];
//    [self.mapView removeMapObject:_mapMarker];
//    for (NMAMapMarker *mapMarker in _listGasMapMarker) {
//        [self.mapView removeMapObject:mapMarker];
//    }
}


- (void)hiddenAllSearchBtn {
    _gasBtn.hidden = YES;
    _tyreBtn.hidden = YES;
    _brokenBtn.hidden = YES;
    _othersBtn.hidden = YES;
}

- (void)displayAllSearchBtn {
    _gasBtn.hidden = NO;
    _tyreBtn.hidden = NO;
    _brokenBtn.hidden = NO;
    _othersBtn.hidden = NO;
}

- (void)createGasMapMarker {
    _listGasMapMarker = [NSMutableArray new];
    
    NSMutableArray *listMarker = [NSMutableArray new];
    NMAGeoCoordinates *coord1 = [[NMAGeoCoordinates alloc] initWithLatitude:10.859797 longitude:106.788196];
    NMAGeoCoordinates *coord2 = [[NMAGeoCoordinates alloc] initWithLatitude:10.855171 longitude:106.790843];
    NMAGeoCoordinates *coord3 = [[NMAGeoCoordinates alloc] initWithLatitude:10.856735 longitude:106.786635];
    NMAGeoCoordinates *coord4 = [[NMAGeoCoordinates alloc] initWithLatitude:10.858075 longitude:106.791658];
    NMAGeoCoordinates *coord5 = [[NMAGeoCoordinates alloc] initWithLatitude:10.857461 longitude:106.783829];
    [listMarker addObject:coord1];
    [listMarker addObject:coord2];
    [listMarker addObject:coord3];
    [listMarker addObject:coord4];
    [listMarker addObject:coord5];
    
    UIImage *uiImage = [UIImage imageNamed:@"gas"];
    UIImage *newImage  = [UIImage imageWithImage:uiImage size:CGSizeMake(30*uiImage.size.height/uiImage.size.width, 30)];
    NMAImage *image = [NMAImage imageWithUIImage:newImage];
    
    for (NSInteger i=0; i<listMarker.count; i++) {
        NMAMapMarker *mapMarker = [NMAMapMarker mapMarkerWithGeoCoordinates:[listMarker objectAtIndex:i] icon:image];
//        [self.mapView addMapObject:mapMarker];
        [_listGasMapMarker addObject:mapMarker];
    }
}

- (void)createTyreMapMarker {
    _listTyreMapMarker = [NSMutableArray new];
    
    NSMutableArray *listMarker = [NSMutableArray new];
    NMAGeoCoordinates *coord1 = [[NMAGeoCoordinates alloc] initWithLatitude:10.852797 longitude:106.788196];
    NMAGeoCoordinates *coord2 = [[NMAGeoCoordinates alloc] initWithLatitude:10.859171 longitude:106.799843];
    NMAGeoCoordinates *coord3 = [[NMAGeoCoordinates alloc] initWithLatitude:10.856435 longitude:106.788635];
    NMAGeoCoordinates *coord4 = [[NMAGeoCoordinates alloc] initWithLatitude:10.855075 longitude:106.794658];
    NMAGeoCoordinates *coord5 = [[NMAGeoCoordinates alloc] initWithLatitude:10.855461 longitude:106.787829];
    [listMarker addObject:coord1];
    [listMarker addObject:coord2];
    [listMarker addObject:coord3];
    [listMarker addObject:coord4];
    [listMarker addObject:coord5];
    
    UIImage *uiImage = [UIImage imageNamed:@"tyre"];
    UIImage *newImage  = [UIImage imageWithImage:uiImage size:CGSizeMake(30*uiImage.size.height/uiImage.size.width, 30)];
    NMAImage *image = [NMAImage imageWithUIImage:newImage];
    
    for (NSInteger i=0; i<listMarker.count; i++) {
        NMAMapMarker *mapMarker = [NMAMapMarker mapMarkerWithGeoCoordinates:[listMarker objectAtIndex:i] icon:image];
        //        [self.mapView addMapObject:mapMarker];
        [_listTyreMapMarker addObject:mapMarker];
    }
}

- (void)createBrokenMapMarker {
    _listBrokenMapMarker = [NSMutableArray new];

    NSMutableArray *listMarker = [NSMutableArray new];
    NMAGeoCoordinates *coord1 = [[NMAGeoCoordinates alloc] initWithLatitude:10.851797 longitude:106.782196];
    NMAGeoCoordinates *coord2 = [[NMAGeoCoordinates alloc] initWithLatitude:10.852171 longitude:106.790843];
    NMAGeoCoordinates *coord3 = [[NMAGeoCoordinates alloc] initWithLatitude:10.853735 longitude:106.789635];
    NMAGeoCoordinates *coord4 = [[NMAGeoCoordinates alloc] initWithLatitude:10.859075 longitude:106.797658];
    NMAGeoCoordinates *coord5 = [[NMAGeoCoordinates alloc] initWithLatitude:10.854461 longitude:106.787829];
    [listMarker addObject:coord1];
    [listMarker addObject:coord2];
    [listMarker addObject:coord3];
    [listMarker addObject:coord4];
    [listMarker addObject:coord5];
    
    UIImage *uiImage = [UIImage imageNamed:@"broken"];
    UIImage *newImage  = [UIImage imageWithImage:uiImage size:CGSizeMake(30*uiImage.size.height/uiImage.size.width, 30)];
    NMAImage *image = [NMAImage imageWithUIImage:newImage];
    
    for (NSInteger i=0; i<listMarker.count; i++) {
        NMAMapMarker *mapMarker = [NMAMapMarker mapMarkerWithGeoCoordinates:[listMarker objectAtIndex:i] icon:image];
        //        [self.mapView addMapObject:mapMarker];
        [_listBrokenMapMarker addObject:mapMarker];
    }
}

- (void)addGasMapMarker {
    [self.mapView removeMapObjects:_listTyreMapMarker];
    [self.mapView removeMapObjects:_listBrokenMapMarker];
    [self.mapView removeMapObjects:_listOthersMapMarker];
    
    [self.mapView addMapObjects:_listGasMapMarker];
}

- (void)addTyreMapMarker {
    [self.mapView removeMapObjects:_listGasMapMarker];
    [self.mapView removeMapObjects:_listBrokenMapMarker];
    [self.mapView removeMapObjects:_listOthersMapMarker];
    
    [self.mapView addMapObjects:_listTyreMapMarker];
}

- (void)addBrokenMapMarker {
    [self.mapView removeMapObjects:_listGasMapMarker];
    [self.mapView removeMapObjects:_listTyreMapMarker];
    [self.mapView removeMapObjects:_listOthersMapMarker];
    
    [self.mapView addMapObjects:_listBrokenMapMarker];
}

- (void)addOthersMapMarker {
    [self.mapView removeMapObjects:_listGasMapMarker];
    [self.mapView removeMapObjects:_listTyreMapMarker];
    [self.mapView removeMapObjects:_listBrokenMapMarker];
    
    [self.mapView addMapObjects:_listOthersMapMarker];
}



// service

- (IBAction)acceptServiceBtn:(id)sender {
    _backView.hidden = YES;
    _waitingView.hidden = YES;
    _orderView.hidden = YES;
}

- (IBAction)cancelBtn:(id)sender {
    _backView.hidden = YES;
    _waitingView.hidden = YES;
    _orderView.hidden = YES;
}

@end
