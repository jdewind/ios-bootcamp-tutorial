
@interface JusticeSpecialObjectionModule : ObjectionModule {
  UIWindow *_window;
}

@property (nonatomic, readonly, retain) UIWindow *window;

- (id)initWithWindow:(UIWindow *)window;
@end
