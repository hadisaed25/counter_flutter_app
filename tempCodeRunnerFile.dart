// Mine Exercise
/*
In the example above you found the sine of 45° by first
converting 45° to radians and then using the Dart sin
function, which works in radians, to calculate the result. Now
print the value of 1 over the square root of 2 in Dart. Confirm
that it equals the sine of 45°.
 */
import 'dart:math';
void main(){
  double x = sin(45 * pi / 180);
  double y= 1/ sqrt(2);
  if (x == y){
    print("$x = $y");
  }
  else{
        print("$x != $y");
  }
}