# SwiftUI：仿iWatch运动
### 演示

### 学习内容

* 创建自定义形状
* 为自定义形状添加渐变颜色
* 动画自定义形状

### 开始
启动一个新的Xcode项目：

* 开启Xcode
* 创建一个新的Xcode项目
* 选择单视图应用程序，然后单击下一步
* 为您的应用命名（**RingGraph**），并确保用户界面是**Swift UI**
* 最后，单击“完成”
* 将**ContentView**文件名和结构重命名为**RingGraph**，并确保在中将其引用重命名**SceneDelegate**

```Swift
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        // Create the SwiftUI view that provides the window contents.
        let ringGraph = RingGraph()

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: ringGraph)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
```

您看到的所有**ContentView**引用**RingGraph**。

### 创建RingShape
创建一个名为**Shapes**的文件夹，并在其中创建一个名为的快速文件**RingShape**。

```Swift
import SwiftUI

struct RingShape: Shape {
    var percent: Double
    var radius: CGFloat = 100
    
    var animatableData: Double{
        get{
            return percent
        }
        
        set{
            percent = newValue
        }
    }

    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        let center = CGPoint(x: width / 2, y: height / 2)
        let endAngle = Angle(degrees: ( percent / 100 * 360) - 90)
        let radius = width / 2
        
        return Path{ path in
            path.addArc(center: center, radius: radius, startAngle: Angle(degrees: -90.0) , endAngle: endAngle, clockwise: false)
        }
    }
}
```

说明

* 要创建自定义形状，该结构必须符合**Shape**协议。
* 前两个属性是显而易见的。至于第三个属性，我们需要使用它来动画化路径的绘制。每次您需要为路径设置动画时，请确保覆盖该属性并返回将更改要设置动画的路径状态的属性。
* 当您遵守**Shape**协议时，将需要覆盖此方法**path(in rect: CGRect) -> Path**。
* 在path方法中，设置了用于绘制圆弧的常量。-90的值。因为我希望图形从90度而不是0（默认值）开始。

### 创建RingView
现在，该创建一个包含我们新创建**RingShape**的视图了。

创建一个名为**Views**的新文件夹，并在其中创建一个名为**RingView**的**swiftUI**文件。

```Swift
import SwiftUI

struct Ring: View {
    @Binding var percent: Double
    var thickness: CGFloat = 35
    var fontSize:CGFloat = 15
    var gradientColors =  [Color.blue, Color.red]
    
    var body: some View {
        return drawRing()
    }
    
    private func drawRing() -> some View{
        let formattedPercent = String(format: "%.f", CGFloat(self.percent))
        
        return ZStack(alignment: .top) {
            
            RingShape(percent: 100)
                .stroke(style: StrokeStyle(lineWidth: self.thickness - 5))
                .fill(Color.gray.opacity(0.2))
            
            RingShape(percent: self.percent)
                .stroke(style: StrokeStyle(lineWidth: self.thickness, lineCap: CGLineCap.round))
                .fill(
                    LinearGradient(
                        gradient: .init(colors: gradientColors), startPoint: .init(x: 0.2, y: 0.4), endPoint:  .init(x: 0.5, y: 1)
                    )
            )
            
            Text("\(formattedPercent)%")
                .multilineTextAlignment(.trailing)
                .font(.system(size: fontSize, weight: .black))
                .offset(y: -thickness / 4)
                .shadow(radius: 10)
        }
    }
}

struct Ring_Previews: PreviewProvider {
    static var previews: some View {
        Ring(percent: .constant(50))
    }
}
```

这里要注意的一点是我如何创建**RingPaths**
第一个是带有灰色的完整圆圈
第二个是将指示百分比水平的圆圈。
使用**startPoint**和**endPoint**来完成。

预览效果

### 放在一起
创建一个名为**Utils**的新文件夹，并在其中创建一个名为**Colors**的快速文件。在该文件中添加以下代码块：

```Swift
extension Color {
    static var ring1color1: Color {
        return Color("ring1color1")
    }
    static var ring1color2:Color {
        return Color("ring1color2")
    }
    static var ring2color1:Color {
        return Color("ring2color1")
    }
    static var ring2color2:Color {
        return Color("ring2color2")
    }
    static var ring3color1:Color {
        return Color("ring3color1")
    }
    static var ring3color2:Color {
        return Color("ring3color2")
    }
}

```

然后创建一个名为**Modifiers**的新文件夹，并添加一个**NutrientModifier**包含以下代码块的文件：

```Swift
struct NutrientModifier: ViewModifier {
    var color: Color = .red
    func body(content: Content) -> some View {
           content.foregroundColor(color)
           .frame(width: 25, height: 25)
           .cornerRadius(4)
    }

}
```

这只是一个简单的修饰符，我们将在短时间内使用。

在**RingGraph**文件中，将它们添加到结构的顶部：

```Swift
    @State var percent1: Double = 60
    @State var percent2: Double = 70
    @State var percent3: Double = 80
    
    var gRing1:[Color] = [Color.ring1color1, Color.ring1color2]
    var gRing2:[Color] = [Color.ring2color1, Color.ring2color2]
    var gRing3:[Color] = [Color.ring3color1, Color.ring3color2]
    
    private var thickness: CGFloat = 40
```

在body内，所有内容并将此代码放入其中

```Swift
    var body: some View {
        return NavigationView {
                VStack {
                    
                    Text("今天你已经消耗了 \(String(format: "%.1f", CGFloat((self.percent1 + self.percent2 + self.percent3) / 3)))%")
                        .font(.title)
                        .fontWeight(.bold)
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)
                        .frame(height: 70)
                    
                    Text("保持好你的身体")
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 30)
 
                        
                    self.createGrapth().frame(minWidth: 0.0, maxWidth: .infinity)
                    Spacer()
                    HStack {
                        HStack{
                            Rectangle().modifier(NutrientModifier(color: .ring1color1) )
                            Text("碳水化合物")
                            
                        }
                        Spacer()
                        HStack{
                            Rectangle().modifier(NutrientModifier(color: .ring2color2) )
                            Text("蛋白")
                            
                        }
                        Spacer()
                        HStack{
                            Rectangle().modifier(NutrientModifier(color: .ring3color2) )
                            Text("脂肪")
                        }
                    }
                    
                }.padding().navigationBarTitle(Text("SwiftUI仿写运动"), displayMode: .inline).navigationBarItems(trailing: self.trailingButton())
            
        }
    }
```

这段代码有错误，因为没有**createGraph**和**trailingButton**功能，现在创建这些：

将其放在**RingGraph**结构内但在**body**块下面：

```Swift
    private func createGrapth() -> some View{
        let width = UIScreen.main.bounds.width - 20
        return
            ZStack {
                Ring(percent: self.$percent1, thickness: self.thickness, fontSize: 15, gradientColors: gRing1).frame(width: width - thickness, height: width - thickness )
                Ring(percent: self.$percent2, thickness:  self.thickness, fontSize: 15, gradientColors: gRing2).frame(width: width - thickness * 3, height: width - thickness * 3)
                Ring(percent: self.$percent3, thickness:  self.thickness, fontSize: 15, gradientColors: gRing3).frame(width: width - thickness * 5, height: width - thickness * 5)
            }
    }
    
    private func trailingButton() -> some View{
          return Button(action: {
              withAnimation(.easeInOut(duration: 1)) {
                  self.percent1 = Double.random(in: 1...100)
                  self.percent2 = Double.random(in: 1...100)
                  self.percent3 = Double.random(in: 1...100)
              }
          }) {
              Image(systemName: "arrow.clockwise")
                  .resizable()
                  .frame(width: 25, height: 30)
                .foregroundColor(.ring3color2)
                  .aspectRatio(contentMode: ContentMode.fit)
          }
      }
```

如您所见，这些是2个独立的函数。
第一个创建3个环
第二个创建为每个环生成1到100之间的3个随机数。

* 代码下载地址
[点击跳转下载](https://github.com/qijinliang/SwiftUI-WorkSpace/tree/master/SwiftUI-RingGraph)
* 欢迎点赞和反馈
本文为作者原著,欢迎转载,转载请注明作者出处