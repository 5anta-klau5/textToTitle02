//
//  ViewController.m
//  textToTitle02
//
//  Created by Serhii Serhiienko on 7/16/16.
//  Copyright © 2016 Serhii Serhiienko. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self addMyGoBtn];
    self.txtField.delegate = self;
    self.txtField.returnKeyType = UIReturnKeyDone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addMyGoBtn {
    UIButton *goBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [goBtn setTranslatesAutoresizingMaskIntoConstraints:NO];
    [goBtn setTitle:@">>" forState:UIControlStateNormal];
    [goBtn sizeToFit];
    goBtn.layer.cornerRadius = 5;
//    goBtn.center = CGPointMake(320, 370);
    [goBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [goBtn setBackgroundColor:[UIColor colorWithRed:0 green:0.5 blue:1 alpha:1.0]];
    [self.view addSubview:goBtn];
    NSLayoutConstraint *goBtnLeading = [NSLayoutConstraint constraintWithItem:goBtn
                                                                    attribute:NSLayoutAttributeLeading
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.txtField
                                                                    attribute:NSLayoutAttributeTrailing
                                                                   multiplier:1
                                                                     constant:30];
    
    NSLayoutConstraint *goBtnBaseLine = [NSLayoutConstraint constraintWithItem:goBtn
                                                                     attribute:NSLayoutAttributeBaseline
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.txtField
                                                                     attribute:NSLayoutAttributeBaseline
                                                                    multiplier:1 constant:0];
    
    [self.view addConstraint:goBtnLeading];
    [self.view addConstraint:goBtnBaseLine];
    
    [goBtn addTarget:self action:@selector(goBtnPressed:) forControlEvents:UIControlEventTouchUpInside];


}

- (void)goBtnPressed:(id)sender {
    [self setTitleOnBtnPress];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self setTitleOnBtnPress];
    return YES;
}

- (void)setTitleOnBtnPress {
    if (!(self.txtField.text.length == 0)) {
        self.title = self.txtField.text;
        [self.txtField resignFirstResponder];
    }
}

@end
