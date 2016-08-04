/********************* 有任何问题欢迎反馈给我 liuweiself@126.com ****************************************/
/***************  https://github.com/waynezxcv/Gallop 持续更新 ***************************/
/******************** 正在不断完善中，谢谢~  Enjoy ******************************************************/





#import "CornerRadiusViewController.h"
#import "Gallop.h"


@interface CornerRadiusViewController ()


@end

@implementation CornerRadiusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    UIView* view1 = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2 - 50, 84.0f,100,100)];
    view1.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view1];
    /**
     *  指定一个圆角半径，SDWebImage将额外缓存一份圆角半径版本的图片
     *
     */
    [view1.layer lw_setImageWithURL:
     [NSURL URLWithString:@"http://img.club.pchome.net/kdsarticle/2013/11small/21/fd548da909d64a988da20fa0ec124ef3_1000x750.jpg"]
                   placeholderImage:nil
                       cornerRadius:50
                               size:CGSizeMake(100, 100)
                            options:0
                           progress:nil
                          completed:nil];


    UIView* view2 = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2 - 50,200, 100,100)];
    view2.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view2];
    [view2.layer sd_setImageWithURL:[NSURL URLWithString:@"http://img.club.pchome.net/kdsarticle/2013/11small/21/fd548da909d64a988da20fa0ec124ef3_1000x750.jpg"]];
}


@end
