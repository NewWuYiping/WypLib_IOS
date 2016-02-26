//
//  ExpandTableController.m
//  邬一平
//
//  Created by 邬一平 on 10/01/14.
//  Copyright (c) 2014 邬一平. All rights reserved.
//

#import "ExpandTableController.h"
#import <QuartzCore/QuartzCore.h>
#import "WypDeviceTools.h"


@interface ExpandTableController () {
    NSMutableArray *_sectionsRecorder;
    NSUInteger _openedSection;
    ExpandTableAnimationType _animationType;
}

@property (nonatomic, weak) NSObject<ExpandTableDelegate> *mDelegate;
@end

@implementation ExpandTableController

- (id) initWithTable:(UITableView *)__tableView withDelegate:(id)__delegate withAnimationType:(ExpandTableAnimationType) __type {
    if (self = [super init]) {
        
        _mDelegate =  __delegate;
        
        _tableView = __tableView;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
        _animationType = __type;
        _openedSection = -1;
    }
    
    return self;
}

- (void)setData:(NSMutableArray *)__data {
    _data = __data;
    _sectionsRecorder = [NSMutableArray array];
    [_data enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [_sectionsRecorder addObject:@NO];
    }];
}

- (void)switchSectionState:(NSInteger)__sectionIndex {
    
    BOOL value = [[_sectionsRecorder objectAtIndex:__sectionIndex] boolValue];
    NSNumber *updatedValue = [NSNumber numberWithBool:!value];
    WypLog(@"switch=%ld, 是否展开=%@", (long)__sectionIndex, [updatedValue boolValue] == YES ? @"yes" : @"no");
    [_sectionsRecorder setObject:updatedValue atIndexedSubscript:__sectionIndex];
    
    _openedSection = __sectionIndex;
    
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:__sectionIndex] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - UITableViewDataSource
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    if (!self.data) {
        return 0;
    }else{
        return self.data.count;
    }
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    @try {
        if ([[_sectionsRecorder objectAtIndex:section] boolValue]){
            if (self.mDelegate) {
                return [self.mDelegate expandTableView:tableView numberOfRowsInSection:section];
            }
        }
    }
    @catch (NSException *exception) {
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.mDelegate){
        return [self.mDelegate expandTableView:tableView cellForRowAtIndexPath:indexPath];
    }
    return nil;
}

#pragma mark - UITableViewDelegate
- (void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == _openedSection && _animationType == ExpandTableAnimationType_Bounce) {
        CGPoint offsetPositioning = CGPointMake(cell.frame.size.width / 2.0f, 20.0f);
        CATransform3D transform = CATransform3DIdentity;
        transform = CATransform3DTranslate(transform, offsetPositioning.x, offsetPositioning.y, 0.0);
        UIView *card = (UITableViewCell * )cell ;
        card.layer.transform = transform;
        card.layer.opacity = 0.5;
        [UIView animateWithDuration:0.5f delay:0.0f usingSpringWithDamping:0.2f initialSpringVelocity:0.2f options:UIViewAnimationOptionCurveEaseInOut animations:^{
            card.layer.transform = CATransform3DIdentity;
            card.layer.opacity = 1;
        } completion:NULL];
    }
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.mDelegate && [self.mDelegate respondsToSelector:@selector(expandTableView:didSelectRowAtIndexPath:)]){
        return [self.mDelegate expandTableView:tableView didSelectRowAtIndexPath:indexPath];
    }else{
        return [self switchSectionState:indexPath.section];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (self.mDelegate && [self.mDelegate respondsToSelector:@selector(expandTableView:heightForHeaderInSection:)]) {
        return [self.mDelegate expandTableView:tableView heightForHeaderInSection:section];
    }
    return tableView.sectionHeaderHeight;
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    BOOL value = [[_sectionsRecorder objectAtIndex:section] boolValue];
    
    return [self.mDelegate expandTableView:tableView viewForHeaderInSection:section isExpand:value];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.mDelegate){
        return [self.mDelegate expandTableView:tableView heightForRowAtIndexPath:indexPath];
    }
    
    return 44;
}

@end