//
//  PCodeViewController.m
//  P2PBOX
//
//  Created by p2pmsg on 12-12-28.
//  Copyright (c) 2012年 p2pmsg. All rights reserved.
//

#import "PCodeViewController.h"
#import "QRCodeGenerator.h"

@interface PCodeViewController ()

@end

@implementation PCodeViewController

@synthesize generatorbut,scanbut,addressfield,codeImage,label;

-(void) dealloc{
    [generatorbut release];
    [scanbut release];
    [addressfield release];
    [codeImage release];
    [label release];
    
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    UITextField *myTextField=[[UITextField alloc]initWithFrame:CGRectMake(20, 10, 280, 31)]; //初始化一个UITextField的frame
    myTextField.textColor=[UIColor redColor];  //UITextField 的文字颜色
    myTextField.delegate=self;//UITextField 代理方法设置
    myTextField.placeholder=@"输入网址";//UITextField 的初始隐藏文字，当然这个文字的字体大小颜色都可以改，重写uitextfield，下次介绍
    myTextField.textAlignment=NSTextAlignmentCenter;//UITextField 的文字对齐格式
    myTextField.font=[UIFont fontWithName:@"Times New Roman" size:20];//UITextField 的文字大小和字体
    myTextField.adjustsFontSizeToFitWidth=YES;//UITextField 的文字自适应
    myTextField.clearsOnBeginEditing=NO;//UITextField 的是否出现一件清除按钮
    myTextField.borderStyle=UITextBorderStyleRoundedRect;//UITextField 的边框
    //myTextField.background=[UIImage imageNamed:@"my.png"];//UITextField 的背景，注意只有UITextBorderStyleNone的时候改属性有效
    myTextField.clearButtonMode=UITextFieldViewModeNever;//UITextField 的一件清除按钮是否出现
    //myTextField.leftView=myView;//UITextField 的左边view
    //myTextField.leftViewMode=UITextFieldViewModeAlways;//UITextField 的左边view 出现模式
    //myTextField.rightView=myView2;//UITextField 的有边view
    //myTextField.rightViewMode=UITextFieldViewModeAlways;//UITextField 的右边view 出现模式
    myTextField.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;//UITextField 的字的摆设方式
    //[myView release];
    //[myView2 release];
    //[self.view addSubview:myTextField];
    
    
    self.addressfield = myTextField;
    
    [self.view addSubview:self.addressfield];
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(20, 50, 280, 280)];
    self.codeImage = image;
    
    [self.view addSubview:codeImage];
    [image release];
    
    
    UIButton *but1 = [UIButton buttonWithType:UIButtonTypeRoundedRect]; //创建圆角矩形button
	[but1 setFrame:CGRectMake(20, 330, 120, 35)]; //设置button的frame
	[but1 setTitle:@"生成二维码" forState:UIControlStateNormal]; //设置button的标题
	[but1 addTarget:self action:@selector(generatorCode) forControlEvents:UIControlEventTouchUpInside]; //定义点击时的响应函数
	
    self.generatorbut = but1;
    
    [self.view addSubview:self.generatorbut];
    [but1 release];
    
    UIButton *but2 = [UIButton buttonWithType:UIButtonTypeRoundedRect]; //创建圆角矩形button
	[but2 setFrame:CGRectMake(180, 330, 120, 35)]; //设置button的frame
	[but2 setTitle:@"扫描二维码" forState:UIControlStateNormal]; //设置button的标题
	[but2 addTarget:self action:@selector(scanimage) forControlEvents:UIControlEventTouchUpInside]; //定义点击时的响应函数

   
    self.scanbut = but2;
    
    
    [self.view addSubview:self.scanbut];
    
    [but2 release];
}

-(void)scanimage {
    
    /*扫描二维码部分：
     导入ZBarSDK文件并引入一下框架
     AVFoundation.framework
     CoreMedia.framework
     CoreVideo.framework
     QuartzCore.framework
     libiconv.dylib
     引入头文件#import “ZBarSDK.h” 即可使用
     当找到条形码时，会执行代理方法
     
     - (void) imagePickerController: (UIImagePickerController*) reader didFinishPickingMediaWithInfo: (NSDictionary*) info
     
     最后读取并显示了条形码的图片和内容。*/
    
    ZBarReaderViewController *reader = [ZBarReaderViewController new];
    reader.readerDelegate = self;
    reader.supportedOrientationsMask = ZBarOrientationMaskAll;
    
    ZBarImageScanner *scanner = reader.scanner;
    
    [scanner setSymbology: ZBAR_I25
                   config: ZBAR_CFG_ENABLE
                       to: 0];
    
    //[self presentModalViewController: reader animated: YES];
    [self presentViewController:reader animated:YES completion:nil];
    [reader release];
}

- (void)generatorCode {
    /*字符转二维码
     导入 libqrencode文件
     引入头文件#import "QRCodeGenerator.h" 即可使用
     */
	codeImage.image = [QRCodeGenerator qrImageForString:addressfield.text imageSize:codeImage.bounds.size.width];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [addressfield resignFirstResponder];
    return YES;
}


- (void) imagePickerController: (UIImagePickerController*) reader didFinishPickingMediaWithInfo: (NSDictionary*) info
{
    id<NSFastEnumeration> results =
    [info objectForKey: ZBarReaderControllerResults];
    ZBarSymbol *symbol = nil;
    for(symbol in results)
        break;
    
    codeImage.image =
    [info objectForKey: UIImagePickerControllerOriginalImage];
    
//    [reader dismissModalViewControllerAnimated: YES];
    [reader dismissViewControllerAnimated:YES completion:nil];
    //判断是否包含 头'http:'
    NSString *regex = @"http+:[^\\s]*";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    
    //判断是否包含 头'ssid:'
    NSString *ssid = @"ssid+:[^\\s]*";;
    NSPredicate *ssidPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",ssid];
    
    label.text =  symbol.data ;
    
    if ([predicate evaluateWithObject:label.text]) {
        
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil
                                                        message:@"It will use the browser to this URL。"
                                                       delegate:nil
                                              cancelButtonTitle:@"Close"
                                              otherButtonTitles:@"Ok", nil];
        alert.delegate = self;
        alert.tag=1;
        [alert show];
        [alert release];
        
        
        
    }
    else if([ssidPre evaluateWithObject:label.text]){
        
        NSArray *arr = [label.text componentsSeparatedByString:@";"];
        
        NSArray * arrInfoHead = [[arr objectAtIndex:0] componentsSeparatedByString:@":"];
        
        NSArray * arrInfoFoot = [[arr objectAtIndex:1] componentsSeparatedByString:@":"];
        
        
        label.text=
        [NSString stringWithFormat:@"ssid: %@ \n password:%@",
         [arrInfoHead objectAtIndex:1],[arrInfoFoot objectAtIndex:1]];
        
        
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:label.text
                                                        message:@"The password is copied to the clipboard , it will be redirected to the network settings interface"
                                                       delegate:nil
                                              cancelButtonTitle:@"Close"
                                              otherButtonTitles:@"Ok", nil];
        
        
        alert.delegate = self;
        alert.tag=2;
        [alert show];
        [alert release];
        
        UIPasteboard *pasteboard=[UIPasteboard generalPasteboard];
        //        然后，可以使用如下代码来把一个字符串放置到剪贴板上：
        pasteboard.string = [arrInfoFoot objectAtIndex:1];
        
        
    }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
