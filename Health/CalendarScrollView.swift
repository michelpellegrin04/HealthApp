//
//  CalendarScrollView.swift
//  Health
//
//  Created by Michel Andre Pellegrin Quiroz on 20/11/23.
//

import SwiftUI

import SwiftUI

struct HorizontalCalendarView: View {
    let startDate: Date
    let daysToShow: Int
    //@State private var pickerType: TripPicker = .normal
    @State private var activeID: Int?
    @State private var selectedDate: Date = Date()
    
    
    
    init(startDate: Date = Date(), daysToShow: Int = 365) {
        self.startDate = startDate
        self.daysToShow = daysToShow
    }
    
    var body: some View {
        let currentDate = Date()
        let oneHundredDaysAgo = Calendar.current.date(byAdding: .day, value: -10, to: currentDate) ?? currentDate
        VStack {
            Image(systemName: "arrowtriangle.down.fill")
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(0..<daysToShow, id: \.self) { day in
                        CalendarDateView(date: oneHundredDaysAgo.addingTimeInterval(TimeInterval(86400 * day)))
                            //.visualEffect { view, proxy in view
                                    //.offset(y: offset(proxy))
                                    //.offset(y: scale(proxy) * 15)
                                
                            //}
                            .scrollTransition(.interactive, axis: .horizontal){
                                view, phase in
                                view
                                    .scaleEffect(phase.isIdentity && activeID == day ? 1 : 1, anchor: .bottom)
                                
                            }
                        
                    }
                    
                    /*.scrollTransition { effect, phase in
                     effect
                     .scaleEffect(
                     x: phase.isIdentity ? 1 : 0.5,
                     y: phase.isIdentity ? 1 : 0.5)
                     }*/
                }
                
            }
            .scrollPosition(id: $activeID)
        }
        //.padding()
        
        
        
    }
    func offset(_ proxy: GeometryProxy) -> CGFloat{
        let progress = progress(proxy)
        return progress < 0 ? progress * -2 : progress * 2
    }
    func progress(_ proxy: GeometryProxy) -> CGFloat {
        let viewWidth = proxy.size.width
        let minX = (proxy.bounds(of: .scrollView)?.minX ?? 0)
    return minX / 200
    }
    
    func scale(_ proxy: GeometryProxy) -> CGFloat {
        let progress = min(max(progress(proxy), -1), 1)
    return progress < 0 ? 1 + progress : 1 - progress
    }
    
}

struct CalendarDateView: View {
    let date: Date
    @State private var showCircle = false
    @State private var diaSeleccionado: String = ""
    
    var body: some View {
        VStack {
            Text(dayOfWeekInitial(from: date))
                .font(.headline)
                .foregroundColor(isToday(date: date) ? Color.white : Color.gray)
                .padding(10)
                .background(
                    Circle()
                        .fill(isToday(date: date) ? Color.black : Color.clear)
                )
            ZStack{
                Color.gray.opacity(0.2)
                    .clipShape(RoundedRectangle(cornerRadius: 70))
                    .frame(width: 40, height: 60)
                if showCircle {
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.red.opacity(0.6))
                        .padding(.bottom, 20)
                }
                
            }
            .onTapGesture {
                withAnimation {
                    showCircle.toggle()
                    /*let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "d"
                    let selectedDay = dateFormatter.string(from: date)
                    if let selectedDayInt = Int(selectedDay) {
                        let calendar = Calendar.current
                        if let selectedDate = calendar.date(bySetting: .day, value: selectedDayInt, of: date) {
                            if isWithinNextFourDays(selectedDate: selectedDate) {
                                
                            } else {
                                print("The date is not within the next four days.")                            }
                        }
                    }*/
                }
            }
            
            
            
            /*Text(date, style: .date)
             .font(.caption)
             .foregroundColor(.secondary)*/
        }
    }
    
    private func isToday(date: Date) -> Bool {
        return Calendar.current.isDateInToday(date)
    }
    
    private func isWithinNextFourDays(selectedDate: Date) -> Bool {
        let calendar = Calendar.current
        let nextFourDays = calendar.date(byAdding: .day, value: 4, to: selectedDate)!
        
        return selectedDate <= nextFourDays
    }
    
    
    func dayOfWeekInitial(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E"
        return String(dateFormatter.string(from: date).prefix(1))
    }
}

struct HorizontalCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalCalendarView()
            .padding()
    }
}

//#Preview {
//HorizontalCalendarView()
//}
