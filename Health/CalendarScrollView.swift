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
    
    func dayOfWeekInitial(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E"
        return String(dateFormatter.string(from: date).prefix(1))
    }
    
    var body: some View {
        VStack {
            Text(dayOfWeekInitial(from: date)) // Utiliza la función para obtener la inicial del día
                    .font(.headline)
                    .foregroundColor(isToday(date: date) ? Color.white : Color.gray)
                    .padding(20)
                    .background(
                        Circle()
                            .fill(isToday(date: date) ? Color.black : Color.clear)
                    )
            
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
