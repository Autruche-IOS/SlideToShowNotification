#import "Tweak.h"

// Overrides the open action
%hook NCNotificationListCell
-(void)_performDefaultActionForLeft {
    [self cellViewButtonPressed:nil];
}
%end

// Overrides the left text
// Hook from here because the rightActionButtonsView/leftActionButtonsView properties aren't populated at [NCNotificationListCell layoutSubviews]
%hook NCNotificationListCellActionButtonsView
-(void)layoutSubviews {
    %orig;

    // Get the NCNotificationListCell (https://stackoverflow.com/a/2309978)
    NCNotificationListCell *listCell = nil;
    for (UIView *next = [self superview]; next; next = next.superview)
    {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[%c(NCNotificationListCell) class]])
        {
            listCell = (NCNotificationListCell *) nextResponder;
            break;
        }
    }

    // In case of... things...
    if (listCell == nil) return;


    // Get the object containing the options StackView
    NCNotificationListCellActionButtonsView *rActionButtonsView = listCell.rightActionButtonsView,
                                            *lActionButtonsView = listCell.leftActionButtonsView;

    // Get the show button view
    NSString *showLabelString;
    NSArray<NCNotificationListCellActionButton*> *rButtonsArray = rActionButtonsView.buttonsStackView.arrangedSubviews;

    // Default
    if (rButtonsArray.count == 3) showLabelString = rButtonsArray[1].titleLabel.text;
    // After DontManageMyNotifications
    else if (rButtonsArray.count == 2) showLabelString = rButtonsArray[0].titleLabel.text;
    // Unknown case
    else return;


    // Clone it and replace the left button
    NSArray<NCNotificationListCellActionButton*> *lButtonsArray = lActionButtonsView.buttonsStackView.arrangedSubviews;
    // Unknown case
    if (lButtonsArray.count != 1) return;

    // Change the label
    [lButtonsArray[0].titleLabel setText:showLabelString];
}
%end
