//
//  CustomerPickupViewController.m
//  HereHelp
//
//  Created by Hiên Hiên on 11/18/18.
//  Copyright © 2018 Hiên Hiên. All rights reserved.
//

#import "CustomerPickupViewController.h"

@interface CustomerPickupViewController ()
@property (weak, nonatomic) IBOutlet UIView *infoView;
@property (weak, nonatomic) IBOutlet UIView *paymentView;

@end

@implementation CustomerPickupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _paymentView.hidden = YES;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.paymentView.hidden = NO;
    });
    
}

- (IBAction)dismissKeyboard:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
}

@end
