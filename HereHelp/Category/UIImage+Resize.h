//
//  UIImage+Resize.h
//  HereHelp
//
//  Created by Hiên Hiên on 11/18/18.
//  Copyright © 2018 Hiên Hiên. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Resize)

+ (UIImage *)imageWithImage:(UIImage *)image size:(CGSize)size;
+ (UIImage *)imageWithImage:(UIImage *)image scale:(double)scale;

@end

NS_ASSUME_NONNULL_END
