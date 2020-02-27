//
//  AppDelegate.m
//  NSFontCollection_test
//
//  Created by Gregory Casamento on 12/15/19.
//  Copyright © 2019 Open Logic. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    NSArray *names = [NSFontCollection allFontCollectionNames];
    NSLog(@"names = %@",names);
    NSFontCollection *fonts = [NSFontCollection fontCollectionWithName:
                               NSFontCollectionAllFonts];
    NSLog(@"fonts = %@",fonts);
    NSData *d = [NSKeyedArchiver archivedDataWithRootObject:fonts
                                      requiringSecureCoding:NO
                                                      error:NULL];
    BOOL result = [d writeToFile:@"archive.out" atomically:YES];
    NSLog(@"%d", result);
    
    NSFontCollection *fun = [NSFontCollection fontCollectionWithName: @"Fun"];
    NSLog(@"%@",fun.matchingDescriptors);
    NSString *fileName = [[NSBundle mainBundle] pathForResource:@"PDF" ofType:@"collection"];
    NSData *data = [NSData dataWithContentsOfFile:fileName];
    NSKeyedUnarchiver *coder = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    NSFontCollection *pdf = [[NSFontCollection alloc] initWithCoder: coder];
    NSLog(@"PDF = %@", pdf);
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
