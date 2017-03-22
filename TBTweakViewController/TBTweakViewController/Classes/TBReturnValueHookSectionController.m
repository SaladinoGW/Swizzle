//
//  TBReturnValueHookSectionController.m
//  TBTweakViewController
//
//  Created by Tanner on 10/9/16.
//  Copyright © 2016 Tanner Bennett. All rights reserved.
//

#import "TBReturnValueHookSectionController.h"

@implementation TBReturnValueHookSectionController

#pragma mark Overrides

+ (instancetype)delegate:(id<TBValueHookSectionDelegate>)delegate signature:(NSMethodSignature *)signature {
    TBReturnValueHookSectionController *controller = [super delegate:delegate signature:signature];
    controller->_typeEncoding = signature.methodReturnType;
    controller.valueType = TBValueTypeFromTypeEncoding(controller->_typeEncoding);
    controller->_hookedValue = [TBValue defaultValueForTypeEncoding:controller->_typeEncoding];
    return controller;
}

- (NSString *)typePickerTitle {
    return @"Change return type";
}

- (NSUInteger)sectionRowCount {
    return self.hookedValue == [TBValue null] ? 1 : 2;
    // For a future redesign?
    // return self.hookedValue.overriden ? 2 : 1;
}

- (BOOL)shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    // +1 row because return value doesn't have a toggle
    return [self shouldHighlightRow:indexPath.row+1];
}

- (TBTableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)ip {
    // +1 row because return value doesn't have a toggle
    ip = [NSIndexPath indexPathForRow:ip.row+1 inSection:ip.section];
    return [super cellForRowAtIndexPath:ip];
}

- (void)didSelectRowAtIndexPath:(NSIndexPath *)ip {
    // +1 row because return value doesn't have a toggle
    ip = [NSIndexPath indexPathForRow:ip.row+1 inSection:ip.section];
    [super didSelectRowAtIndexPath:ip];
}

@end