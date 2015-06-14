# QXCycleViewDemo
A new kind of cycle image viewing control item.（新型图片轮播器）

Created with three imageViews, staying one by one, swiping leads to the exchange order and data reloading.

You can create it usuing basic init method:
```objc

    QXCycleView *cycleView = [[QXCycleView alloc] init];
    cycleView.frame = CGRectMake(50, 50, 200, 200);
    [self.view addSubview:cycleView];
```

Datasource is added like showing below: (only paths, which may not causes the rise in memery)
```objc
    // 添加数据源
    cycleView.imagePaths = @[
                             [[NSBundle mainBundle] pathForResource:@"00.jpg" ofType:nil],
                             [[NSBundle mainBundle] pathForResource:@"01.jpg" ofType:nil],
                             [[NSBundle mainBundle] pathForResource:@"02.jpg" ofType:nil],
                             [[NSBundle mainBundle] pathForResource:@"03.jpg" ofType:nil],
                             [[NSBundle mainBundle] pathForResource:@"04.jpg" ofType:nil],
                             [[NSBundle mainBundle] pathForResource:@"05.jpg" ofType:nil],
                             [[NSBundle mainBundle] pathForResource:@"06.jpg" ofType:nil],
                             [[NSBundle mainBundle] pathForResource:@"07.jpg" ofType:nil],
                             ];
```

Conrol point shows below :
```objc
    [cycleView pre];
    [cycleView next];
```

You can also add a target to observe the changing index:
```objc
    [cycleView addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventValueChanged];
```
Have fun!
