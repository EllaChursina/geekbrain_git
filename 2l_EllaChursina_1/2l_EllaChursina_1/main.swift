

import Foundation

/*Задача 1

func EvenNumber (_ number : Int){
    number % 2 == 0 ? print("четное число"):print("нечетное число")
}
*/

/*Задача 2

func MultipleOfThree (_ number : Int){
    number % 3 == 0 ? print("Число делится без остатка на 3"):print("Число не делится без остатка на 3")
}
MultipleOfThree (9) */

/*Задача 3

var array: [Int] = []
for i in 0...99 {
    array.append (i)
} */

/*Задача 4

var array: [Int] = []
for i in 0...99 {
    array.append (4)
}
for value in array {
    if (value % 2) == 0 || (value % 3) == 0 {
        array.remove (at: array.firstIndex(of: value)!)
    }
}
print (array) */


/*Задача 5
func getFib (sequenceNumber : UInt) -> CUnsignedLongLong {
    var sn = sequenceNumber
    var fibNumber1 : CUnsignedLongLong = 1
    var fibNumber2 : CUnsignedLongLong = 1
    var sumFibNumber: CUnsignedLongLong = fibNumber2
    while 0 <= Int(sn) - 2 {
        sumFibNumber = fibNumber1 + fibNumber2
        fibNumber1 = fibNumber2
        fibNumber2 = sumFibNumber
        sn -= 1;
    }
    return sumFibNumber
}
var myArray : [CUnsignedLongLong] = []
for i in 0...92{
    myArray.append(getFib(sequenceNumber: UInt(i)))
}

print(myArray)
*/
