//
// Created by David Clark on 22/02/2016.
// Copyright (c) 2016 David Clark. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface CustomControl : UIControl

@property(nonatomic) enum UITextBorderStyle borderStyle;

@property(nonatomic) BOOL editing;
@end
