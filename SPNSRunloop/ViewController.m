//
//  ViewController.m
//  SPNSRunloop
//
//  Created by shinephe on 17/3/20.
//  Copyright © 2017年 shinephe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,strong)UIScrollView *scrollview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.scrollview];
    

#pragma mark -定时器
    /*NSRunLoopCommonModes，NSDefaultRunLoopMode，UITrackingRunLoopMode
     
     默认不开启Runloop
     [NSTimer timerWithTimeInterval:<#(NSTimeInterval)#> target:<#(nonnull id)#> selector:<#(nonnull SEL)#> userInfo:<#(nullable id)#> repeats:<#(BOOL)#>]
     
     默认开启runloop
     [NSTimer scheduledTimerWithTimeInterval:<#(NSTimeInterval)#> target:<#(nonnull id)#> selector:<#(nonnull SEL)#> userInfo:<#(nullable id)#> repeats:<#(BOOL)#>]
    
     1.需要创建一个runloop，并把定时器加入其中进行运作，定时器只能在特定的模式中运作，如果滑动scrollview则runloop模式切换为UITrackingRunLoopMode，则定时器不运行，此时必须要把定时器模式切换为NSRunLoopCommonModes[NSRunLoop currentRunLoop]和[NSRunLoop mainRunLoop]如果当前没有runloop，则会创建一个
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(run) userInfo:nil repeats:YES];

    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    
    2
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(run) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
     */
#pragma mark -ImageView在scrollview拖拽时不显示图片，拖拽完成时显示图片
    
    /*
    [self.imageView performSelector:@selector(setImage:) withObject:[UIImage imageNamed:@"placeholder"]afterDelay:3.0 inModes:@[NSDefaultRunLoopMode]];
     
     */
    
#pragma mark -PerformSelector
    /*
     设置Model类型
    [self performSelector:<#(nonnull SEL)#> withObject:<#(nullable id)#> afterDelay:<#(NSTimeInterval)#> inModes:<#(nonnull NSArray<NSRunLoopMode> *)#>]
     */
#pragma mark -常驻线程 
   /*
    应用场景:经常在后台进行耗时操作,如:监控联网状态,扫描沙盒等 不希望线程处理完事件就销毁,保持常驻状态
   
    @autoreleasepool {
    
    另外两种启动方式
    [NSDate distantFuture]:遥远的未来  这种写法跟上面的run是一个意思
    [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    不设置模式
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate distantFuture]];
   
    
    [[NSRunLoop currentRunLoop] addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
    //启动RunLoop
    [[NSRunLoop currentRunLoop] run];
    }
    退出当前线程
    [NSThread exit];
    */
    
    
    /*
    /** 定时器(这里不用带*，因为dispatch_source_t就是个类，内部已经包含了*)
    @property (nonatomic, strong) dispatch_source_t timer;
    
    int count = 0;
    - (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
    {
        // 获得队列
        //    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
        dispatch_queue_t queue = dispatch_get_main_queue();
        
        // 创建一个定时器(dispatch_source_t本质还是个OC对象)
        self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
        
        // 设置定时器的各种属性（几时开始任务，每隔多长时间执行一次）
        // GCD的时间参数，一般是纳秒 NSEC_PER_SEC（1秒 == 10的9次方纳秒）
        // 何时开始执行第一个任务
        // dispatch_time(DISPATCH_TIME_NOW, 3.0 * NSEC_PER_SEC) 比当前时间晚3秒
        dispatch_time_t start = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC));
        uint64_t interval = (uint64_t)(1.0 * NSEC_PER_SEC);
        dispatch_source_set_timer(self.timer, start, interval, 0);
        
        // 设置回调
        dispatch_source_set_event_handler(self.timer, ^{
            NSLog(@"------------%@", [NSThread currentThread]);
            count++;
            
            //        if (count == 4) {
            //            // 取消定时器
            //            dispatch_cancel(self.timer);
            //            self.timer = nil;
            //        }
        });
        
        // 启动定时器
        dispatch_resume(self.timer);
    }
    */
}

- (void)run {
    
    static NSInteger i = 0;
    
    SPLog(@"定时器执行---%ld",(long)i++);
    
    

}

- (UIScrollView *)scrollview {
    
    if (!_scrollview) {
        
        _scrollview = [[UIScrollView alloc]initWithFrame:self.view.bounds];
        _scrollview.backgroundColor = [UIColor cyanColor];
        _scrollview.contentSize = CGSizeMake(0, 99999);
        
    }
    return _scrollview;
}





@end
