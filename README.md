# SpriteKitButton
There is no in-built button present in SpriteKit framework. 

This project achieves the mechanism of button tap on nodes in Scene. In addition to that, the project can detect upon which body the touch has started moving in and on which body, the touch has started moving out.

Instructions for using this files:
————————————————

-Make PPButtonActionScene as the base class of all your SKScene file which want to achieve the features of button tap, touch start, touch end on various types of SKNode bodies.
-Make sure, the bodies of interest are named. Unnamed bodies will not be called by this project.
-If you would like to make use of touch methods in your scene, call super of that particular method.

Ex: 
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
   [super touchesMoved:touches withEvent:event];
    // Your code here.
}

