
var stepSize = 1

func increment(_ number: inout Int) {
    // number 和 stepSize都指向了同一个存储地址，同一块内存的读写和访问重叠了，就产生冲突了
    number += stepSize
}
//  stepSize是一个全局变量，可以在increment(:)正常访问
//  错误：stepSize 访问冲突
//  increment(&stepSize)

//  解决冲突的方式就是，显示拷贝一份stepSize
var copyOfStepSize = stepSize
increment(&copyOfStepSize)

//  更新原来的值
stepSize = copyOfStepSize
//  stepSize 的值为 2
print("\(stepSize)")

