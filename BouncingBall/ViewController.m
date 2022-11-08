//
//  ViewController.m
//  BouncingBall
//
//  Created by Amr Abdelnasser on 17/05/2022.
//

#import "ViewController.h"

@interface ViewController () <UICollisionBehaviorDelegate>
@property(nonatomic, readwrite) BOOL translatesReferenceBoundsIntoBoundary;
@property (weak, nonatomic) IBOutlet UIView *myBall;
@property UIDynamicAnimator *animator;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _myBall.layer.cornerRadius = 25.0;
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    [self demoGravity];
   
    
    
}
-(void) demoGravity {
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc]initWithItems:@[_myBall]];
    [_animator addBehavior:gravity];
    
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[_myBall]];
    [_animator addBehavior:collision];
    
    UIDynamicItemBehavior *ballBehavior = [[UIDynamicItemBehavior alloc]initWithItems:@[_myBall] ];
    ballBehavior.elasticity = 0.75;
    [_animator addBehavior:ballBehavior];
    collision.translatesReferenceBoundsIntoBoundary = YES;
    [_animator addBehavior:collision];
    collision.collisionDelegate = self;
}
-(void)collisionBehavior : (UICollisionBehavior *)behavior beganContactForItem:(id)item withBoundaryIdentifier:( id)identifier atPoint:(CGPoint)p{
    
    self.myBall.backgroundColor = [UIColor yellowColor];
}

@end
