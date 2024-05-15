//
//  ContentView.swift
//  Weather
//
//  Created by Jack Derifaj on 5/14/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            BackgroundView(topColor: Color.blue, bottomColor: Color("lightblue"))
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                
                MainWeatherStatusView(imageName: "cloud.sun.fill", temperture: 75)
                HStack(spacing:10){
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 74)
                    WeatherDayView(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 80)
                    WeatherDayView(dayOfWeek: "THU", imageName: "snow", temperature: 25)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.sun.fill", temperature: 90)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "sunset.fill", temperature: 70)
                    
                }
                .padding()
            
                Spacer()
                
                Button {
                    print("Button Tapped")
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: Color.blue, backgroundColor: Color.white)
                }
                
                Spacer()
                
                
            }
        }
    }
}
    #Preview {
        ContentView()
    }
    
    struct WeatherDayView: View {
        var dayOfWeek: String
        var imageName: String
        var temperature: Int
        
        var body: some View {
            VStack {
                Text(dayOfWeek)
                    .font(.system(size: 16, weight: .medium, design: .default))
                    .foregroundColor(.white)
                Image(systemName: imageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                Text("\(temperature)°")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.white)
                
            }
            Spacer()
            
        }
    }


struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]), startPoint: .topLeading, endPoint: .bottomLeading)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default)).foregroundColor(.white)
            .padding()
    }
}


struct MainWeatherStatusView: View {
    var imageName: String
    var temperture: Int
    
    var body: some View{
        VStack(spacing: 10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height:180)
            
            Text("\(temperture)°")
                .font(.system(size: 70, weight: .medium, design: .default))
                .foregroundColor(.white)
            
        }
        .padding(.bottom, 40)
    }
}


struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .font(.system(size:20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}
