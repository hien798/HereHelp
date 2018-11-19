//
//  UIImage+Resize.m
//  HereHelp
//
//  Created by Hiên Hiên on 11/18/18.
//  Copyright © 2018 Hiên Hiên. All rights reserved.
//

#import "UIImage+Resize.h"

@implementation UIImage (Resize)

+ (UIImage *)imageWithImage:(UIImage *)image size:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage *)imageWithImage:(UIImage *)image scale:(double)scale {
    CGSize size = CGSizeMake(image.size.width*scale, image.size.height*scale);
    return [UIImage imageWithImage:image size:size];
}

@end
