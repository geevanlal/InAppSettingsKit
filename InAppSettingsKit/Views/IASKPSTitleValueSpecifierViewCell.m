//
//  IASKPSTitleValueSpecifierViewCell.m
//  http://www.inappsettingskit.com
//
//  Copyright (c) 2010:
//  Luc Vandal, Edovia Inc., http://www.edovia.com
//  Ortwin Gentz, FutureTap GmbH, http://www.futuretap.com
//  All rights reserved.
// 
//  It is appreciated but not required that you give credit to Luc Vandal and Ortwin Gentz, 
//  as the original authors of this code. You can give credit in a blog post, a tweet or on 
//  a info page of your app. Also, the original authors appreciate letting them know if you use this code.
//
//  This code is licensed under the BSD license that is available at: http://www.opensource.org/licenses/bsd-license.php
//

#import "IASKPSTitleValueSpecifierViewCell.h"
#import "IASKSettingsReader.h"
#import "IASKHelper.h"


@implementation IASKPSTitleValueSpecifierViewCell

-(void) awakeFromNib
{
	if (isPad()) {
		self.backgroundColor = [UIColor colorWithRed:247.0f/255.0f
											   green:247.0f/255.0f
												blue:247.0f/255.0f
											   alpha:1.0f];
	}
}

- (void)layoutSubviews {
	// left align the value if the title is empty
	if (!self.textLabel.text.length) {
		self.textLabel.text = self.detailTextLabel.text;
		self.detailTextLabel.text = nil;
		if ([self.reuseIdentifier isEqualToString:kIASKPSMultiValueSpecifier]) {
			self.textLabel.font = [UIFont systemFontOfSize:[UIFont labelFontSize]];
			self.textLabel.textColor = self.detailTextLabel.textColor;
		}
	}
	[super layoutSubviews];
	
	CGSize viewSize =  [self.textLabel superview].frame.size;
	
	// set the left title label frame
	CGFloat labelWidth = [self.textLabel sizeThatFits:CGSizeZero].width;
	CGFloat minValueWidth = (self.detailTextLabel.text.length) ? kIASKMinValueWidth + kIASKSpacing : 0;
	labelWidth = MIN(labelWidth, viewSize.width - minValueWidth - kIASKPaddingLeft -kIASKPaddingRight);
	CGRect labelFrame = CGRectMake(kIASKPaddingLeft, 0, labelWidth, viewSize.height -2);
	self.textLabel.frame = labelFrame;
	
	// set the right value label frame
	if (self.detailTextLabel.text.length) {
		CGRect valueFrame = CGRectMake(kIASKPaddingLeft + labelWidth + kIASKSpacing,
									   0,
									   viewSize.width - (kIASKPaddingLeft + labelWidth + kIASKSpacing) - kIASKPaddingRight,
									   viewSize.height -2);
		self.detailTextLabel.frame = valueFrame;
	}
}

@end
