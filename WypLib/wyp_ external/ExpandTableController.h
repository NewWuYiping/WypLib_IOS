//
//  ExpandTableController.h
//  邬一平
//
//  Created by 邬一平 on 10/01/14.
//  Copyright (c) 2014 邬一平. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ExpandTableController;
@class ExpandTableDelegate;

typedef NS_ENUM(NSUInteger, ExpandTableAnimationType) {
    ExpandTableAnimationType_None,
    ExpandTableAnimationType_Bounce,
};

@protocol ExpandTableDelegate

@required
- (NSInteger)expandTableView:(UITableView *)__tableView numberOfRowsInSection:(NSInteger)__section;
- (UITableViewCell *)expandTableView:(UITableView *)__tableView cellForRowAtIndexPath:(NSIndexPath *)__indexPath;
- (CGFloat)expandTableView:(UITableView *)__tableView heightForRowAtIndexPath:(NSIndexPath *)__indexPath;
- (UIView *)expandTableView:(UITableView *)__tableView viewForHeaderInSection:(NSInteger)__section isExpand:(BOOL)__isExpand;

@optional
- (void)expandTableView:(UITableView *)__tableView didSelectRowAtIndexPath:(NSIndexPath *)__indexPath;
- (CGFloat)expandTableView:(UITableView *)__tableView heightForHeaderInSection:(NSInteger)__section;
@end

@interface ExpandTableController : NSObject<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong, readonly) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *data;

- (id) initWithTable:(UITableView *)__tableView withDelegate:(id)__delegate withAnimationType:(ExpandTableAnimationType) __type;
- (void) switchSectionState:(NSInteger)__sectionIndex;
@end