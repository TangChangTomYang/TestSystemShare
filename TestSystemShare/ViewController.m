//
//  ViewController.m
//  TestSystemShare
//
//  Created by yangrui on 2018/3/4.
//  Copyright © 2018年 yangrui. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSString *shareTitle = @"分享的标题";
    UIImage *shareImage = [UIImage imageNamed:@"me"];
    NSURL *shareUrl = [NSURL URLWithString:@"https://www.jianshu.com/u/acdcce712303"];
    NSArray *activityItems = @[shareTitle,
                               shareImage,
                               shareUrl]; // 必须要提供url 才会显示分享标签否则只显示图片
    
    
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    
    activityVC.excludedActivityTypes = [self excludetypes];
    
    activityVC.completionWithItemsHandler = ^(UIActivityType  _Nullable activityType, BOOL completed, NSArray * _Nullable returnedItems, NSError * _Nullable activityError) {
        
        NSLog(@"activityType: %@,\ncompleted: %d,\nreturnedItems:%@,\nactivityError:%@",activityType,completed,returnedItems,activityError);
    };
    
    [self presentViewController:activityVC animated:YES completion:nil];
}



-(NSArray *)excludetypes{
    
    NSMutableArray *excludeTypesM =  [NSMutableArray arrayWithArray:@[//UIActivityTypePostToFacebook,
                                                                      UIActivityTypePostToTwitter,
                                                                      UIActivityTypePostToWeibo,
                                                                      UIActivityTypeMessage,
                                                                      UIActivityTypeMail,
                                                                      UIActivityTypePrint,
                                                                      UIActivityTypeCopyToPasteboard,
                                                                      UIActivityTypeAssignToContact,
                                                                      UIActivityTypeSaveToCameraRoll,
                                                                      UIActivityTypeAddToReadingList,
                                                                      UIActivityTypePostToFlickr,
                                                                      UIActivityTypePostToVimeo,
                                                                      UIActivityTypePostToTencentWeibo,
                                                                      UIActivityTypeAirDrop,
                                                                      UIActivityTypeOpenInIBooks]];
    
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 11.0) {
        [excludeTypesM addObject:UIActivityTypeMarkupAsPDF];
    }
    
    return excludeTypesM;
}

@end
