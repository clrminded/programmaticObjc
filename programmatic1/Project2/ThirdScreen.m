//
//  ThirdScreen.m
//  ObjCoreSkills
//
//  Created by liudachris on 4/30/20.
//  Copyright © 2020 clrminded. All rights reserved.
//

#import "ThirdScreen.h"

@interface ThirdScreen ()

@property UILabel *redLabel;
@property UISwitch *redSwitch;
@property UILabel *blueLabel;
@property UISwitch *blueSwitch;
@property UILabel *greenLabel;
@property UISwitch *greenSwitch;
@property UIView *colorView;

@end

@implementation ThirdScreen

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addScrollView];
    self.view.backgroundColor = [UIColor greenColor];
    
    [self addRedLabel];
    [self addRedSwitch];
    [self addBlueLabel];
    [self addBlueSwitch];
    [self addGreenLabel];
    [self addGreenSwitch];
    [self addColorView];
    
    if (_blueSwitch.isOn){
        _colorView.backgroundColor = [UIColor whiteColor];
    } else {
        _colorView.backgroundColor = [UIColor blueColor];
    }
}

-(void) addScrollView {
    UIScrollView *scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
        NSInteger viewcount= 2;
        for(int i = 0; i< viewcount; i++) {
          CGFloat y = i * self.view.frame.size.height;
          UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, y,self.view.frame.size.width, self .view.frame.size.height)];
          view.backgroundColor = [UIColor greenColor];
          [scrollview addSubview:view];
       }
    
    scrollview.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height *viewcount);
    
    [self.view addSubview:scrollview];
}
// Red Label and Switch
-(void) addRedLabel {
    _redLabel = [[UILabel alloc] init];
    _redLabel.text = @"Red: ";
    [self.view addSubview: _redLabel];
    [self setRedLabelConstraints];
}
-(void) setRedLabelConstraints {
    _redLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [_redLabel.topAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.topAnchor constant: 55].active = YES;
    
}
-(void) addRedSwitch {
    _redSwitch = [[UISwitch alloc] init];
    [_redSwitch setOn: YES animated: YES];
    if(_redSwitch.isOn){
           NSLog(@"Switch State is Disabled");
       }else{
          NSLog(@"Switch State is Enabled");
       }
    [self.view addSubview: _redSwitch];
    [self setRedSwitchConstraints];
}
-(void) setRedSwitchConstraints {
    _redSwitch.translatesAutoresizingMaskIntoConstraints = NO;
    [_redSwitch.topAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.topAnchor constant: 50].active = YES;
    [_redSwitch.centerXAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.centerXAnchor].active = YES;
    [_redSwitch.leadingAnchor constraintEqualToAnchor: _redLabel.trailingAnchor constant: 5].active = YES;
    
}

// Blue label and Switch
-(void) addBlueLabel {
    _blueLabel = [[UILabel alloc] init];
    _blueLabel.text = @"Blue: ";
    [self.view addSubview: _blueLabel];
    
    [self setBlueLabelConstraints];
}
-(void) setBlueLabelConstraints {
    _blueLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [_blueLabel.topAnchor constraintEqualToAnchor: _redLabel.bottomAnchor constant: 60].active = YES;
}
-(void) addBlueSwitch {
    _blueSwitch = [[UISwitch alloc] init];
    [_blueSwitch setOn: NO animated: YES];
    [self.view addSubview: _blueSwitch];
    [self setBlueSwitchConstraints];
}
-(void) setBlueSwitchConstraints {
    _blueSwitch.translatesAutoresizingMaskIntoConstraints = NO;
    [_blueSwitch.topAnchor constraintEqualToAnchor: _redSwitch.bottomAnchor constant: 50].active = YES;
    [_blueSwitch.centerXAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.centerXAnchor].active = YES;
    [_blueSwitch.leadingAnchor constraintEqualToAnchor: _blueLabel.trailingAnchor constant: 5].active = YES;
}

// Green Label and Switch
-(void) addGreenLabel {
    _greenLabel = [[UILabel alloc] init];
    _greenLabel.text = @"Green: ";
    [self.view addSubview: _greenLabel];
       
    [self setGreenLabelConstraints];
}
-(void) setGreenLabelConstraints {
    _greenLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [_greenLabel.topAnchor constraintEqualToAnchor: _blueLabel.bottomAnchor constant: 60].active = YES;
    
    
}
-(void) addGreenSwitch {
    _greenSwitch = [[UISwitch alloc] init];
    [_greenSwitch setOn: YES animated: YES];
    if(_greenSwitch.isOn){
           NSLog(@"Switch State is Disabled");
       }else{
          NSLog(@"Switch State is Enabled");
       }
    [self.view addSubview: _greenSwitch];
    [self setGreenSwitchConstraints];
}
-(void) setGreenSwitchConstraints {
    _greenSwitch.translatesAutoresizingMaskIntoConstraints = NO;
    [_greenSwitch.topAnchor constraintEqualToAnchor: _blueSwitch.bottomAnchor constant: 50].active = YES;
    [_greenSwitch.centerXAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.centerXAnchor].active = YES;
    [_greenSwitch.leadingAnchor constraintEqualToAnchor: _greenLabel.trailingAnchor constant: 5].active = YES;
}

-(void) addColorView {
    _colorView = [[UIView alloc] init];
    _colorView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview: _colorView];
    [self setColorViewConstraints];
}
-(void) setColorViewConstraints {
    _colorView.translatesAutoresizingMaskIntoConstraints = NO;
    [_colorView.widthAnchor constraintEqualToConstant: 100].active = YES;
    [_colorView.heightAnchor constraintEqualToConstant: 100].active = YES;
    [_colorView.topAnchor constraintEqualToAnchor: _greenSwitch.bottomAnchor constant: 50].active = YES;
    [_colorView.centerXAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.centerXAnchor].active = YES;
}

@end

