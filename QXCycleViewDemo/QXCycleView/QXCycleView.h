//
//  QXCycleView.h
//  QXCycleViewDemo
//
//  Created by QinXin on 15/6/11.
//  Copyright (c) 2015年 labi3285_Lab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QXCycleView : UIControl

@property (nonatomic, strong) NSArray *imagePaths;
@property (nonatomic, assign, readonly) NSInteger index;
@property (nonatomic, assign, getter=isMoving) BOOL moving;

- (void)pre;
- (void)next;

@end
