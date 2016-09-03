//
//  ViewController.m
//  测试
//
//  Created by 非凡科技 on 16/9/2.
//  Copyright © 2016年 非凡科技. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray *url;
    NSMutableArray *array_image;
    
}
@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    array_image=[NSMutableArray array];
    url=@[@"http://www.apoints.com/graphics/UploadFiles/200803/20080301202754140.jpg",@"http://www.apoints.com/graphics/UploadFiles/200803/20080301202754140.jpg",@"http://www.apoints.com/graphics/UploadFiles/200803/20080301202754140.jpg",@"http://www.apoints.com/graphics/UploadFiles/200803/20080301202754140.jpg"];
    for (int i=0; i<url.count; i++) {
        NSThread *thread=[[NSThread alloc]initWithTarget:self selector:@selector(loadImage:) object:nil];
        thread.name=@"thread";
        
        [thread start];
    }
}

-(void)loadImage:(NSNumber *)number{
    NSData *data=[NSData dataWithContentsOfURL:[NSURL URLWithString:url[[number intValue]]]];
    [array_image addObject:data];
    NSLog(@">>>%@",data);
    [self performSelectorOnMainThread:@selector(updataImage:) withObject:data waitUntilDone:YES];
    
}
-(void)updataImage:(NSNumber *)number{
    UIImage *image_s=array_image [[number intValue]+1 ];
    self.imageview.image=image_s;
    NSLog(@"123456");
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
