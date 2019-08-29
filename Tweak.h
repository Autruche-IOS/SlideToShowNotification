@interface NCNotificationListCellActionButtonsView : UIView
@property (nonatomic,retain) UIStackView * buttonsStackView;
@end

@interface NCNotificationListCellActionButton : UIControl
@property (nonatomic,retain) UILabel * titleLabel;
@end

@interface NCNotificationListCell : UICollectionViewCell
@property (nonatomic,retain) NCNotificationListCellActionButtonsView * leftActionButtonsView;
@property (nonatomic,retain) NCNotificationListCellActionButtonsView * rightActionButtonsView;
-(void)cellViewButtonPressed:(id)arg1;
@end
