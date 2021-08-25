//
//  ToggleStyle.swift
//  SwiftUIKit
//
//  Created by PC on 2021/8/25.
//

import SwiftUI

/**
 下面是3中自定义常用的Toggle样式，可以更改开关状态颜色，动画.如果需要可以仿制新的样式。
 注意:
    1.水平/垂直方向样式中的填充Spacer()
    2.解决onTapGesture无效的解决方法，见文件末尾
 */


//不会显示Toggle内部View的ToggleStyle
struct ToggleStyleSimple:ToggleStyle {
    let width: CGFloat = 50
    let height:CGFloat = 30
    var onColor:Color  = .green
    var offColor:Color = .init(UIColor.systemGray5)
    var isAnimation = true

    func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: configuration.isOn ? .trailing : .leading) {
            RoundedRectangle(cornerRadius: height/2.0)
                .frame(width: width, height: height)
                .foregroundColor(configuration.isOn ? onColor : offColor)
                .animation(isAnimation ? .easeIn(duration: 0.15) : nil)
                .onTapGesture {
                    configuration.$isOn.wrappedValue.toggle()
                }

            RoundedRectangle(cornerRadius: (height-4)/2.0)
                .frame(width: height-4 , height: height-4)
                .padding(2)
                .foregroundColor(.white)
                .animation(isAnimation ? .easeIn(duration: 0.15) : nil)
                .onTapGesture {
                    configuration.$isOn.wrappedValue.toggle()
                }

        }
    }
}


//水平方向排序Toggle内部View的ToggleStyle
struct ToggleStyleHorizontal:ToggleStyle {
    let width: CGFloat = 50
    let height:CGFloat = 30
    var onColor:Color  = .green
    var offColor:Color = .init(UIColor.systemGray5)
    var isAnimation = true

    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            ZStack(alignment: configuration.isOn ? .trailing : .leading) {
                RoundedRectangle(cornerRadius: height/2.0)
                    .frame(width: width, height: height)
                    .foregroundColor(configuration.isOn ? onColor : offColor)
                    .animation(isAnimation ? .easeIn(duration: 0.15) : nil)
                    .onTapGesture {
                        configuration.$isOn.wrappedValue.toggle()
                    }

                RoundedRectangle(cornerRadius: (height-4)/2.0)
                    .frame(width: height-4 , height: height-4)
                    .padding(2)
                    .foregroundColor(.white)
                    .animation(isAnimation ? .easeIn(duration: 0.15) : nil)
                    .onTapGesture {
                        configuration.$isOn.wrappedValue.toggle()
                    }

            }
        }
    }
}

// 垂直方向排序Toggle内部View的ToggleStyle
struct ToggleStyleVertical:ToggleStyle {
    let width: CGFloat = 50
    let height:CGFloat = 30
    var onColor:Color  = .green
    var offColor:Color = .init(UIColor.systemGray5)
    var isAnimation = true

    func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.label
            ZStack(alignment: configuration.isOn ? .trailing : .leading) {
                RoundedRectangle(cornerRadius: height/2.0)
                    .frame(width: width, height: height)
                    .foregroundColor(configuration.isOn ? onColor : offColor)
                    .animation(isAnimation ? .easeIn(duration: 0.15) : nil)
                    .onTapGesture {
                        configuration.$isOn.wrappedValue.toggle()
                    }

                RoundedRectangle(cornerRadius: (height-4)/2.0)
                    .frame(width: height-4 , height: height-4)
                    .padding(2)
                    .foregroundColor(.white)
                    .animation(isAnimation ? .easeIn(duration: 0.15) : nil)
                    .onTapGesture {
                        configuration.$isOn.wrappedValue.toggle()
                    }
            }
        }
    }
}



//使用自定义样式后，为Toggle添加onTapGesture无效的解决方法
/**

 //替换原来得.onTapGesture
 Toggle(isOn:$tmpState) {
     Text("Click check..")
 }
 .toggleStyle(MyToggleStyle())//自定义样式中使用了onTapGesture，所以需要.simultaneousGesture
 .simultaneousGesture(
     TapGesture()
         .onEnded{
             print("inOn:\(tmpState) 检查是否符合条件，如果不符合就还原状态")
             DispatchQueue.global().asyncAfter(deadline: DispatchTime.now()+0.3) {
                 print("还原状态")
                 withAnimation(Animation.easeIn(duration: 0.15)){
                     tmpState.toggle()
                 }
             }
         }
 )
 //.simultaneousGesture可以使用多个，如果有多个.simultaneousGesture，则先执行后添加的.simultaneousGesture

 */
