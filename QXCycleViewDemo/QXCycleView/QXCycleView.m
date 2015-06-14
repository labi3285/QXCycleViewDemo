//
//  QXCycleView.m
//  QXCycleViewDemo
//
//  Created by QinXin on 15/6/11.
//  Copyright (c) 2015年 labi3285_Lab. All rights reserved.
//

#import "QXCycleView.h"

@interface QXCycleView ()
@property (nonatomic, strong) NSMutableArray *imageViews;
@end

@implementation QXCycleView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.clipsToBounds = YES;
        
        UISwipeGestureRecognizer *leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(pre)];
        leftSwipe.direction = UISwipeGestureRecognizerDirectionRight;
        UISwipeGestureRecognizer *rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(next)];
        rightSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
        
        [self addGestureRecognizer:leftSwipe];
        [self addGestureRecognizer:rightSwipe];
        
    }
    return self;
}

- (NSMutableArray *)imageViews {
    if (!_imageViews) {
        _imageViews = [NSMutableArray array];
        for (int i = 0; i < 3; i++) {
            UIImageView *imageView = [[UIImageView alloc] init];
            [self addSubview:imageView];
            [_imageViews addObject:imageView];
        }
    }
    return _imageViews;
}

- (void)setImagePaths:(NSArray *)imagePaths {
    _imagePaths = imagePaths;
    [self setImages];
    [self orderImageViews];
}

- (void)setImages {
      
    [self.imageViews enumerateObjectsUsingBlock:^(UIImageView *imageView, NSUInteger idx, BOOL *stop) {
        NSUInteger i = (self.index + idx - 1 + self.imagePaths.count) % self.imagePaths.count;
        imageView.image = [UIImage imageWithContentsOfFile:[self.imagePaths objectAtIndex:i]];
    }];
    
}

- (void)orderImageViews {
    
    CGSize size = self.bounds.size;

    UIImageView *leftView = self.imageViews[0];
    UIImageView *centerView = self.imageViews[1];
    UIImageView *rightView = self.imageViews[2];
    
    leftView.frame = CGRectMake(- size.width, 0, size.width, size.height);
    centerView.frame = CGRectMake(0, 0, size.width, size.height);
    rightView.frame = CGRectMake(size.width, 0, size.width, size.height);
    
    [self bringSubviewToFront:centerView];
}

- (void)pre {
    
    if (self.isMoving) return;
    
    _index--;
    if (_index < 0) _index = self.imagePaths.count - 1;

    [self.imageViews exchangeObjectAtIndex:1 withObjectAtIndex:2];
    [self.imageViews exchangeObjectAtIndex:0 withObjectAtIndex:1];
    [UIView animateWithDuration:0.4 animations:^{
        [self orderImageViews];
    } completion:^(BOOL finished) {
        [self setImages];
        [self setMoving:NO];
    }];
    
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

- (void)next {
    
    if (self.isMoving) return;

    _index++;
    if (_index == self.imagePaths.count) _index = 0;
    
    [self.imageViews exchangeObjectAtIndex:0 withObjectAtIndex:1];
    [self.imageViews exchangeObjectAtIndex:1 withObjectAtIndex:2];
    [UIView animateWithDuration:0.4 animations:^{
        [self orderImageViews];
        [self setMoving:YES];
    } completion:^(BOOL finished) {
        [self setImages];
        [self setMoving:NO];
    }];

    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

@end
