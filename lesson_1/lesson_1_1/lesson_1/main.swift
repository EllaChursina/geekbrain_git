

import Foundation

var a : Float = 5
var b : Float = -2
var c : Float = 2
var D = pow (b,2) - 4*a*c
if D > 0 {
    let x_1 : Float = (-b + sqrt(D))/(2*a)
    let x_2 : Float = (-b - sqrt(D))/(2*a)
    print ("Корни уравнения: x1 = ", x_1, "x2 = ", x_2)
} else if D==0 {
    let x_3 : Float = -b/(2*a)
    print ("Корень уравнения: x1 = ", x_3)
} else {
    print ("Не имеет решения")
}
