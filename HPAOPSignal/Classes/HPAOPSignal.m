//
//  HPAOPSignal.m
//  Aspects
//
//  Created by hapy on 2020/4/25.
//

#import <UIKit/UIKit.h>
#import "HPAOPSignal.h"
#import <Aspects/Aspects.h>

@implementation HPAOPSignal

+ (void)track {
    //到指定目录
    NSURL *bundleURL = [[NSBundle mainBundle] URLForResource:@"Frameworks" withExtension:nil];
    bundleURL = [bundleURL URLByAppendingPathComponent:@"HPAOPSignal"];
    bundleURL = [bundleURL URLByAppendingPathExtension:@"framework"];
    NSDictionary *eventDic;
    if (bundleURL) {
        NSBundle *bundle = [NSBundle bundleWithURL:bundleURL];
        NSString *path = [bundle pathForResource:@"HPAOPSignal" ofType:@"plist"];
        eventDic = [NSDictionary dictionaryWithContentsOfFile:path];
    }
    if (eventDic) {
        for (NSString *classStr in eventDic.allKeys) {
            //class
            Class class = NSClassFromString(classStr);
            
            // tracking dic
            NSDictionary *trackDic = eventDic[classStr];
            
            NSString *trackingId = trackDic[@"trackingId"];
            NSString *trackingAction = trackDic[@"trackingAction"];
            SEL action = NSSelectorFromString(trackingAction);
            BOOL isTrackingViewWillAppear = [trackDic[@"trackingViewWillAppear"] boolValue];
            if (trackingId) {
                if (isTrackingViewWillAppear) {
                    [self trackingClass:class];
                }
                if (trackingAction) {
                    [self trackingAction:class trackingEvent:action];
                }
            }
        }
    }
    
}


///  页面
/// @param class class
+ (void)trackingClass:(Class)class {

      [class aspect_hookSelector:@selector(viewWillAppear:)
                     withOptions:AspectPositionAfter
                      usingBlock:^(id<AspectInfo> info){
          NSLog(@"~~~%@", info.instance);
      }  error:NULL];
}


/// action
/// @param class class
/// @param event event
+ (void)trackingAction:(Class)class trackingEvent:(SEL)event {
    [class aspect_hookSelector:event
                     withOptions:AspectPositionAfter
                      usingBlock:^(id<AspectInfo> info){
        NSLog(@"~~~%@", info.instance);
    }  error:NULL];
}
@end
