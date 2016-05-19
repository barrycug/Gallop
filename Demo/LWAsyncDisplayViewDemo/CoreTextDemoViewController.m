/********************* 有任何问题欢迎反馈给我 liuweiself@126.com ****************************************/
/***************  https://github.com/waynezxcv/Gallop 持续更新 ***************************/
/******************** 正在不断完善中，谢谢~  Enjoy ******************************************************/





#import "CoreTextDemoViewController.h"
#import "Gallop.h"
#import "LWAlertView.h"

@interface CoreTextDemoViewController ()<LWAsyncDisplayViewDelegate>

@property (nonatomic,strong) LWAsyncDisplayView* asyncDisplayView;

@end

@implementation CoreTextDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"CoreText";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.asyncDisplayView];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        LWLayout* layout = [[LWLayout alloc] init];
        LWTextStorage* textStorage = [[LWTextStorage alloc] init];
        textStorage.text = @"Easy to use yet capable of so much, iOS 9 was engineered to work hand in hand with the advanced technologies built into iPhone.";
        textStorage.frame = CGRectMake(10, 50.0f, self.view.bounds.size.width - 20.0f, CGFLOAT_MAX);
        textStorage.font = [UIFont systemFontOfSize:18.0f];
        textStorage.textColor = [UIColor blackColor];
        [textStorage lw_replaceTextWithView:[[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 60.0f, 30.0f)]
                                contentMode:UIViewContentModeScaleAspectFill
                                       size:CGSizeMake(60.0f, 30.0f)
                                  alignment:LWTextAttachAlignmentTop
                                      range:NSMakeRange(1,0)];

        [textStorage lw_replaceTextWithImage:[UIImage imageNamed:@"005.png"]
                                 contentMode:UIViewContentModeScaleAspectFill
                                   imageSize:CGSizeMake(12, 12)
                                   alignment:LWTextAttachAlignmentTop
                                       range:NSMakeRange(5, 1)];

        [textStorage lw_addLinkWithData:@"touch link"
                                  range:NSMakeRange(12, 25)
                              linkColor:[UIColor blueColor]
                         highLightColor:RGB(0, 0, 0, 0.35f)];

        [textStorage lw_addLinkWithData:@"iPhone."
                                  range:NSMakeRange(textStorage.text.length - 7,8)
                              linkColor:[UIColor greenColor]
                         highLightColor:RGB(0, 0, 0, 0.35f)];
        [layout addStorage:textStorage];


        LWImageStorage* imamgeStorage = [[LWImageStorage alloc] init];
        imamgeStorage.image = [UIImage imageNamed:@"pic.jpeg"];
        imamgeStorage.frame = CGRectMake(textStorage.left, textStorage.bottom + 20.0f, 80, 80);
        imamgeStorage.cornerRadius = 40.0f;
        imamgeStorage.type = LWImageStorageLocalImage;
        [layout addStorage:imamgeStorage];
        dispatch_sync(dispatch_get_main_queue(), ^{
            self.asyncDisplayView.layout = layout;
        });
    });
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.asyncDisplayView.frame = CGRectMake(0, 64.0f, self.view.bounds.size.width, self.view.bounds.size.height - 64.0f);
    self.asyncDisplayView.delegate = self;
}

- (LWAsyncDisplayView *)asyncDisplayView {
    if (_asyncDisplayView) {
        return _asyncDisplayView;
    }
    _asyncDisplayView = [[LWAsyncDisplayView alloc] initWithFrame:CGRectZero];
    _asyncDisplayView.backgroundColor = [UIColor whiteColor];
    return _asyncDisplayView;
}

- (void)lwAsyncDisplayView:(LWAsyncDisplayView *)asyncDisplayView didCilickedLinkWithfData:(id)data {
    if ([data isKindOfClass:[NSString class]]) {
        [LWAlertView shoWithMessage:data];
    }
}

@end
