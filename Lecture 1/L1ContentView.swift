//
//  ContentView.swift
//  CS193p-Memorize
//
//  Created by Troy York on 7/11/21.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    ZStack {            
       RoundedRectangle(cornerRadius: 20)
         .stroke(lineWidth: 3)
      Text("Hello World!")
    }
           .padding(.horizontal)
           .foregroundColor(.red)
  }
}

struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
       ContentView()
   }
}
