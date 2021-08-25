//
//  ToggleDemo.swift
//  SwiftUIKit
//
//  Created by PC on 2021/8/25.
//

import SwiftUI

struct ToggleDemo: View {
    @State var toggleState:Bool = false
    var body: some View {
        Toggle(isOn: $toggleState) {
            Text("label 1")
            Text("label 2")
        }
        .background(Color.orange)
        .onTapGesture {
            print("system onTap..",toggleState)
        }

    }
}



struct ToggleDemoSimple: View {
    @State var toggleState:Bool = false
    var body: some View {
        Toggle(isOn: $toggleState) {
            Text("label 1")
            Text("label 2")
        }
        .toggleStyle(ToggleStyleSimple())//自定义样式中使用了onTapGesture，所以需要.simultaneousGesture
        .background(Color.orange)
        .onTapGesture {//无效
            print("ToggleDemoSimple onTap..")
        }
        .simultaneousGesture(
            TapGesture().onEnded{
                print("ToggleDemoSimple simultaneousGesture onTap.. ",!toggleState)
            }
        )


    }
}

struct ToggleDemoH: View {
    @State var toggleState:Bool = false
    var body: some View {
        Toggle(isOn: $toggleState) {
            Text("label 1")
            Text("label 2")
        }
        .toggleStyle(ToggleStyleHorizontal())
        .background(Color.orange)
        .onTapGesture {//无效
            print("ToggleStyleHorizontal onTap..")
        }
        .simultaneousGesture(
            TapGesture().onEnded{
                print("ToggleStyleHorizontal simultaneousGesture onTap.. ",!toggleState)
            }
        )
    }
}

struct ToggleDemoV: View {
    @State var toggleState:Bool = false
    var body: some View {
        Toggle(isOn: $toggleState) {
            Text("label 1")
            Text("label 2")
        }
        .toggleStyle(ToggleStyleVertical())
        .background(Color.orange)
        .onTapGesture {//无效
            print("ToggleStyleVertical onTap..")
        }
        .simultaneousGesture(
            TapGesture().onEnded{
                print("ToggleStyleVertical simultaneousGesture onTap.. ",!toggleState)
            }
        )
    }
}



struct ToggleDemo_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            ToggleViewTest()
        }
    }
}


struct ToggleViewTest: View {
    @State var toggleState:Bool = false
    var body: some View {
        VStack{
            Spacer()
            ToggleDemo()
            Spacer()
            ToggleDemoSimple()
            Spacer()
            ToggleDemoH()
            Spacer()
            ToggleDemoV()
            Spacer()
        }
    }
}
