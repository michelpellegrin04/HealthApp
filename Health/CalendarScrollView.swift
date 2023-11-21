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
    
    
    init(startDate: Date = Date(), daysToShow: Int = 365) {
        self.startDate = startDate
        self.daysToShow = daysToShow
    }
    
    var body: some View {
        let currentDate = Date()
        let oneHundredDaysAgo = Calendar.current.date(byAdding: .day, value: -10, to: currentDate) ?? currentDate
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(0..<daysToShow, id: \.self) { day in
                    CalendarDateView(date: oneHundredDaysAgo.addingTimeInterval(TimeInterval(86400 * day)))
                }
            }
            .padding()
        }
    }
    
}

struct CalendarDateView: View {
    let date: Date
    @State private var showCircle = false
    
    func dayOfWeekInitial(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E"
        return String(dateFormatter.string(from: date).prefix(1))
    }
    
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
                Color.gray.opacity(0.3)
                    .clipShape(RoundedRectangle(cornerRadius: 70))
                    .frame(width: 40, height: 60)
                if showCircle {
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.red)
                        .padding(.bottom, 20)
                }
                
            }
            .onTapGesture {
                withAnimation {
                    showCircle.toggle()
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
}

struct HorizontalCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalCalendarView()
            .padding()
    }
}


#Preview {
    HorizontalCalendarView()
}
