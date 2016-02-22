//
//  ViewController.m
//  ControlSizePOC
//
//  Created by David Clark on 22/02/2016.
//  Copyright (c) 2016 David Clark. All rights reserved.
//


#import "ViewController.h"
#import "CustomControl.h"


@interface ViewController ()

@end

static const CGFloat controlMarginX = 10;
static const CGFloat controlMarginY = 10;

@implementation ViewController {
	NSLayoutConstraint *_normalConstraint;
	NSLayoutConstraint *_editingConstraint;
}

- (void)loadView {
	[self setView:[[UIView alloc] init]];
	[self.view setBackgroundColor:[UIColor whiteColor]];

	UITextField *textField01 = [[UITextField alloc] init];
	[textField01 setTranslatesAutoresizingMaskIntoConstraints:NO];
	[textField01 setBorderStyle:UITextBorderStyleRoundedRect];
	[self.view addSubview:textField01];
	[textField01.topAnchor constraintEqualToAnchor:self.topLayoutGuide.bottomAnchor constant:controlMarginY].active = YES;
	[textField01.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:controlMarginX].active = YES;
	[textField01.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-controlMarginX].active = YES;

	CustomControl *customControl01 = [[CustomControl alloc] init];
	[customControl01 setTranslatesAutoresizingMaskIntoConstraints:NO];
	[customControl01 setBorderStyle:UITextBorderStyleRoundedRect];
	[customControl01 addTarget:self action:@selector(controlBeginEditing:) forControlEvents:UIControlEventEditingDidBegin];
	[customControl01 addTarget:self action:@selector(controlEndEditing:) forControlEvents:UIControlEventEditingDidEnd];
	[self.view addSubview:customControl01];
	_normalConstraint = [customControl01.topAnchor constraintEqualToAnchor:textField01.bottomAnchor constant:controlMarginY];
	_editingConstraint = [customControl01.topAnchor constraintEqualToAnchor:self.topLayoutGuide.bottomAnchor constant:controlMarginY];
	_normalConstraint.active = YES;
	[customControl01.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:controlMarginX].active = YES;
	[customControl01.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-controlMarginX].active = YES;

	UITextField *textField03 = [[UITextField alloc] init];
	[textField03 setTranslatesAutoresizingMaskIntoConstraints:NO];
	[textField03 setBorderStyle:UITextBorderStyleRoundedRect];
	[self.view addSubview:textField03];
	[textField03.topAnchor constraintEqualToAnchor:customControl01.bottomAnchor constant:controlMarginY].active = YES;
	[textField03.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:controlMarginX].active = YES;
	[textField03.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-controlMarginX].active = YES;

	UITextField *textField04 = [[UITextField alloc] init];
	[textField04 setTranslatesAutoresizingMaskIntoConstraints:NO];
	[textField04 setBorderStyle:UITextBorderStyleRoundedRect];
	[self.view addSubview:textField04];
	[textField04.topAnchor constraintEqualToAnchor:textField03.bottomAnchor constant:controlMarginY].active = YES;
	[textField04.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:controlMarginX].active = YES;
	[textField04.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-controlMarginX].active = YES;
}

- (void)controlBeginEditing:(id)sender {
	_normalConstraint.active = NO;
	_editingConstraint.active = YES;
}

- (void)controlEndEditing:(id)sender {
	_editingConstraint.active = NO;
	_normalConstraint.active = YES;
}

@end
