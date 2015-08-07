# SpriteKitButton
There is no in-built button present in SpriteKit framework. 

This project achieves the mechanism of button tap on nodes in Scene. In addition to that, the project can detect upon which body the touch has started moving in and on which body, the touch has started moving out.

### Instructions:
   - Make PPButtonActionScene as the base class of all your SKScene file which want to achieve the features of button tap, touch start, touch end on various types of SKNode bodies.
   - Make sure, the bodies of interest are named. Unnamed bodies will not be called by this project.
   - If you would like to make use of touch methods in your scene, call super of that particular method. Ex:

         - (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
               [super touchesMoved:touches withEvent:event];
              // Your code here.
         }
   - To get tap action, override the following method in your Scene file.
   
         - (void)touchUpInsideOnNodeName:(NSString *)nodeName atPoint:(CGPoint)touchPoint {
            // Your code here.
         }
   - To get to know the start of touch on a particular body, override the following method in your Scene file.
   
         - (void)touchBeginOnNodeName:(NSString *)nodeName {
            // Your code here.
         }
   - To get to know the end of touch on a particular body, override the following method in your Scene file.
   
         - (void)touchEndedOnNodeName:(NSString *)nodeName {
            // Your code here.
         }