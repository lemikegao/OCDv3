//
//  OCDRotationLevelScene.m
//  OCDv3
//
//  Created by Michael Gao on 7/20/14.
//  Copyright (c) 2014 Chin and Cheeks. All rights reserved.
//

#import "OCDRotationLevelScene.h"

static CGFloat const kRotationInterval = 15;

static inline CGFloat degreesToRadians(CGFloat degrees) {
    return (M_PI * degrees) / 180.0f;
}

static inline CGFloat radiansToDegrees(CGFloat radians) {
    return (radians * 180.0f) / M_PI;
}

static inline CGFloat angleBetweenLinesInRadians(CGPoint line1Start, CGPoint line1End, CGPoint line2Start, CGPoint line2End) {
    
    CGFloat a = line1End.x - line1Start.x;
    CGFloat b = line1End.y - line1Start.y;
    CGFloat c = line2End.x - line2Start.x;
    CGFloat d = line2End.y - line2Start.y;
    
    CGFloat line1Slope = (line1End.y - line1Start.y) / (line1End.x - line1Start.x);
    CGFloat line2Slope = (line2End.y - line2Start.y) / (line2End.x - line2Start.x);
    
    CGFloat degs = acosf(((a*c) + (b*d)) / ((sqrt(a*a + b*b)) * (sqrt(c*c + d*d))));
    
    
    return (line2Slope > line1Slope) ? degs : -degs;
}

@interface OCDRotationLevelScene()

@property (nonatomic) CGFloat tappedNodeRotationRemainder;

@end

@implementation OCDRotationLevelScene

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        _tappedNodeRotationRemainder = 0;
    }
    
    return self;
}

- (BOOL)shouldLockObject:(SKSpriteNode *)object withPossibleTarget:(SKNode *)possibleTarget
{
    // WARNING: THIS CURRENTLY ONLY WORKS FOR SQUARES
    NSInteger objectAngle = object.zRotation < 0 ? roundf(radiansToDegrees(object.zRotation + 2*M_PI)) : roundf(radiansToDegrees(object.zRotation));
    BOOL isCorrectAngle = NO;
    NSInteger targetAngle = roundf(radiansToDegrees(possibleTarget.zRotation));
    while (targetAngle < 360)
    {
        if (targetAngle == objectAngle)
        {
            isCorrectAngle = YES;
            break;
        }
        
        targetAngle += 90;
    }
    
    return (isCorrectAngle && [super shouldLockObject:object withPossibleTarget:possibleTarget]);
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    // Rotation
    if (touches.count == 2)
    {
        NSArray *twoTouches = [touches allObjects];
        UITouch *first = [twoTouches objectAtIndex:0];
        UITouch *second = [twoTouches objectAtIndex:1];
        
        CGFloat currentAngle = angleBetweenLinesInRadians([first previousLocationInView:self.view], [second previousLocationInView:self.view], [first locationInView:self.view], [second locationInView:self.view]);
        self.tappedNodeRotationRemainder += currentAngle;
        
        CGFloat degreeIntervalInRadians = degreesToRadians(kRotationInterval);
        CGFloat numIntervalsToRotate = (fabsf(self.tappedNodeRotationRemainder) > degreeIntervalInRadians) ? 1 : 0;
        CGFloat multiplier = (self.tappedNodeRotationRemainder > 0) ? 1 : -1;
        CGFloat amountToRotateInRadians = multiplier * numIntervalsToRotate * degreeIntervalInRadians;
        self.selectedNode.zRotation -= amountToRotateInRadians;
        
        self.tappedNodeRotationRemainder -= amountToRotateInRadians;
    }
    else
    {
        [super touchesMoved:touches withEvent:event];
    }
}


@end
