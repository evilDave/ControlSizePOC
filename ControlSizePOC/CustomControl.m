//
// Created by David Clark on 22/02/2016.
// Copyright (c) 2016 David Clark. All rights reserved.
//

#import "CustomControl.h"
#import "NSSet+each.h"


@implementation CustomControl {
	UIView *_normalContainer;
	UIButton *_normalLeft;
	UIButton *_normalRight;
	UIView *_editingContainer;
	UIButton *_editingLeft;
	UIButton *_editingRight;
	NSMutableSet *_editingConstraints;
	NSMutableSet *_normalConstraints;
	UIView *_editingBottom;
	UIButton *_editingTop;
}

static const int controlMarginX = 10;
static const int controlMarginY = 10;
static const int controlHeight = 32;
static const int controlCornerRadius = 5;

- (instancetype)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		_normalContainer = [[UIView alloc] init];
		[_normalContainer setTranslatesAutoresizingMaskIntoConstraints:NO];
		_normalConstraints = [[NSMutableSet alloc] init];
		[_normalConstraints addObject:[_normalContainer.topAnchor constraintEqualToAnchor:self.topAnchor]];
		[_normalConstraints addObject:[_normalContainer.bottomAnchor constraintEqualToAnchor:self.bottomAnchor]];
		[_normalConstraints addObject:[_normalContainer.leadingAnchor constraintEqualToAnchor:self.leadingAnchor]];
		[_normalConstraints addObject:[_normalContainer.trailingAnchor constraintEqualToAnchor:self.trailingAnchor]];

		_normalLeft = [[UIButton alloc] init];
		[_normalLeft setTranslatesAutoresizingMaskIntoConstraints:NO];
		[_normalLeft setBackgroundColor:[UIColor greenColor]];
		[_normalLeft addTarget:self action:@selector(leftTouch) forControlEvents:UIControlEventTouchUpInside];
		[_normalLeft.layer setCornerRadius:controlCornerRadius];
		[_normalContainer addSubview:_normalLeft];
		[_normalLeft.topAnchor constraintEqualToAnchor:_normalContainer.topAnchor].active = YES;
		[_normalLeft.leadingAnchor constraintEqualToAnchor:_normalContainer.leadingAnchor].active = YES;
		[_normalLeft.widthAnchor constraintEqualToAnchor:_normalContainer.widthAnchor multiplier:0.5 constant:-controlMarginX/2].active = YES;
		[_normalLeft.heightAnchor constraintEqualToConstant:controlHeight].active = YES;
		[_normalLeft.bottomAnchor constraintEqualToAnchor:_normalContainer.bottomAnchor].active = YES; // constraint to pull container down

		_normalRight = [[UIButton alloc] init];
		[_normalRight setTranslatesAutoresizingMaskIntoConstraints:NO];
		[_normalRight setBackgroundColor:[UIColor greenColor]];
		[_normalRight addTarget:self action:@selector(rightTouch) forControlEvents:UIControlEventTouchUpInside];
		[_normalRight.layer setCornerRadius:controlCornerRadius];
		[_normalContainer addSubview:_normalRight];
		[_normalRight.topAnchor constraintEqualToAnchor:_normalContainer.topAnchor].active = YES;
		[_normalRight.trailingAnchor constraintEqualToAnchor:_normalContainer.trailingAnchor].active = YES;
		[_normalRight.widthAnchor constraintEqualToAnchor:_normalContainer.widthAnchor multiplier:0.5 constant:-controlMarginX/2].active = YES;
		[_normalRight.heightAnchor constraintEqualToConstant:controlHeight].active = YES;
		
		_editingContainer = [[UIView alloc] init];
		[_editingContainer setTranslatesAutoresizingMaskIntoConstraints:NO];
		_editingConstraints = [[NSMutableSet alloc] init];
		[_editingConstraints addObject:[_editingContainer.topAnchor constraintEqualToAnchor:self.topAnchor]];
		[_editingConstraints addObject:[_editingContainer.bottomAnchor constraintEqualToAnchor:self.bottomAnchor]];
		[_editingConstraints addObject:[_editingContainer.leadingAnchor constraintEqualToAnchor:self.leadingAnchor]];
		[_editingConstraints addObject:[_editingContainer.trailingAnchor constraintEqualToAnchor:self.trailingAnchor]];

		_editingTop = [[UIButton alloc] init];
		[_editingTop setTranslatesAutoresizingMaskIntoConstraints:NO];
		[_editingTop setBackgroundColor:[UIColor redColor]];
		[_editingTop addTarget:self action:@selector(topTouch) forControlEvents:UIControlEventTouchUpInside];
		[_editingTop.layer setCornerRadius:controlCornerRadius];
		[_editingContainer addSubview:_editingTop];
		[_editingTop.topAnchor constraintEqualToAnchor:_editingContainer.topAnchor].active = YES;
		[_editingTop.leadingAnchor constraintEqualToAnchor:_editingContainer.leadingAnchor].active = YES;
		[_editingTop.widthAnchor constraintEqualToAnchor:_editingContainer.widthAnchor].active = YES;
		[_editingTop.heightAnchor constraintEqualToConstant:controlHeight].active = YES;

		_editingLeft = [[UIButton alloc] init];
		[_editingLeft setTranslatesAutoresizingMaskIntoConstraints:NO];
		[_editingLeft setBackgroundColor:[UIColor redColor]];
		[_editingLeft addTarget:self action:@selector(leftTouch) forControlEvents:UIControlEventTouchUpInside];
		[_editingLeft.layer setCornerRadius:controlCornerRadius];
		[_editingContainer addSubview:_editingLeft];
		[_editingLeft.topAnchor constraintEqualToAnchor:_editingTop.bottomAnchor constant:controlMarginY].active = YES;
		[_editingLeft.leadingAnchor constraintEqualToAnchor:_editingContainer.leadingAnchor].active = YES;
		[_editingLeft.widthAnchor constraintEqualToAnchor:_editingContainer.widthAnchor multiplier:0.5 constant:-controlMarginX/2].active = YES;
		[_editingLeft.heightAnchor constraintEqualToConstant:controlHeight].active = YES;

		_editingRight = [[UIButton alloc] init];
		[_editingRight setTranslatesAutoresizingMaskIntoConstraints:NO];
		[_editingRight setBackgroundColor:[UIColor redColor]];
		[_editingRight addTarget:self action:@selector(rightTouch) forControlEvents:UIControlEventTouchUpInside];
		[_editingRight.layer setCornerRadius:controlCornerRadius];
		[_editingContainer addSubview:_editingRight];
		[_editingRight.topAnchor constraintEqualToAnchor:_editingTop.bottomAnchor constant:controlMarginY].active = YES;
		[_editingRight.trailingAnchor constraintEqualToAnchor:_editingContainer.trailingAnchor].active = YES;
		[_editingRight.widthAnchor constraintEqualToAnchor:_editingContainer.widthAnchor multiplier:0.5 constant:-controlMarginX/2].active = YES;
		[_editingRight.heightAnchor constraintEqualToConstant:controlHeight].active = YES;
		
		_editingBottom = [[UIView alloc] init];
		[_editingBottom setTranslatesAutoresizingMaskIntoConstraints:NO];
		[_editingBottom setBackgroundColor:[UIColor redColor]];
		[_editingBottom.layer setCornerRadius:controlCornerRadius];
		[_editingContainer addSubview:_editingBottom];
		[_editingBottom.topAnchor constraintEqualToAnchor:_editingLeft.bottomAnchor constant:controlMarginY].active = YES;
		[_editingBottom.leadingAnchor constraintEqualToAnchor:_editingContainer.leadingAnchor].active = YES;
		[_editingBottom.widthAnchor constraintEqualToAnchor:_editingContainer.widthAnchor].active = YES;
		[_editingBottom.heightAnchor constraintEqualToConstant:controlHeight*5].active = YES;
		[_editingBottom.bottomAnchor constraintEqualToAnchor:_editingContainer.bottomAnchor].active = YES; // constraint to pull container down

		[self setEditing:NO];
	}

	return self;
}

- (void)leftTouch {
	[self becomeFirstResponder];
}

- (void)rightTouch {
	[self becomeFirstResponder];
}

- (void)topTouch {
	[self resignFirstResponder];
}

- (BOOL)canBecomeFirstResponder {
	return YES;
}

- (BOOL)becomeFirstResponder {
	BOOL result = [super becomeFirstResponder];
	if(result) {
		[self setEditing:YES];
	}
	return result;
}

- (BOOL)canResignFirstResponder {
	return YES;
}

- (BOOL)resignFirstResponder {
	BOOL result = [super resignFirstResponder];
	if(result) {
		[self setEditing:NO];
	}
	return result;
}

- (void)setEditing:(BOOL)editing {
	_editing = editing;

	if(editing) {
		_normalConstraints.each(^(NSLayoutConstraint *constraint){
			constraint.active = NO;
		});
		[_normalContainer removeFromSuperview];
		[self addSubview:_editingContainer];
		_editingConstraints.each(^(NSLayoutConstraint *constraint){
			constraint.active = YES;
		});
		[self sendActionsForControlEvents:UIControlEventEditingDidBegin];
	}
	else {
		_editingConstraints.each(^(NSLayoutConstraint *constraint){
			constraint.active = NO;
		});
		[_editingContainer removeFromSuperview];
		[self addSubview:_normalContainer];
		_normalConstraints.each(^(NSLayoutConstraint *constraint){
			constraint.active = YES;
		});
		[self sendActionsForControlEvents:UIControlEventEditingDidEnd];
	}
}

@end
