//
//  AppDelegate.m
//  HereHelp
//
//  Created by Hiên Hiên on 11/17/18.
//  Copyright © 2018 Hiên Hiên. All rights reserved.
//

#import "AppDelegate.h"
#import <NMAKit/NMAKit.h>

//@import NMAKit;

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    #define kHelloMapAppID @"KfSulF9kUnnPMcJoDm7P"
    #define kHelloMapAppCode @"wZOzDEy8VeuLKQ_87gdgDw"
    #define kHelloMapLicenseKey @"AhlTwaNG7riZYYsi9YBpkc3RL/boHTXDRWUF12/HCE9hmU0fl8M5sffIRWI9ydf/xj6IiePA+YSUG1Lc8tFYmw8TGmdq7ZR4nevG1sxChgtdp+7oU0nOjSwRIksxEAhTinVFA6Z1ZAkJpyBc5t40gcqiozaJS14sJx/+ptR3MsLH3ElcLSU4fO+FLDm5pbR13+wSFH/oxGZBBh4k48vZy7b/zfccAL6uXMd+2ZP5ngcbEd7JyXqaVYHc3Ay5guc0wq9j77QiVl8oHqjrKwHLZeDp+zivWjbs6q4LS5VHZx0GSiqxGl0t/tCrQpFCOI48FC34bUYrYIMS6hqr8NMQ5/0IugJC9fSZKBepLPO1XkKwqY3ncsqhrr+z43HK4Muomlj1WvnwwGNl2NlBMlmLvqPyOcNxAwTpJfEtCVSMrwbseD11I0C4HiR51XNi0Fm/Y2ZlAbtr+WY9f54dRj6/Ku4m6h8oH4jYnBDFJOP4VFzhcuhw344Ks11PRVBZrpefhB4pylY2SqCCzhWFERXED9M8p/oyT0BcN8MtC64en1Hk0zq0xygWZKRqeuaoKra+tnc4GOqnrt9EGrToZ0kL5nGujI3vg4867OuuelMR7LzlzlyM29uXTK90rpuhlri+EMkmyT/bWKs8QYK1qKMewVvfe7jz3znOGEH6vQISzgM="
    
    NMAApplicationContextError error = [NMAApplicationContext setAppId:kHelloMapAppID
                                                               appCode:kHelloMapAppCode
                                                            licenseKey:kHelloMapLicenseKey];
    assert(error == NMAApplicationContextErrorNone);
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
