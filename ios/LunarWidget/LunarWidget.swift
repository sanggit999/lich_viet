import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> LunarEntry {
        LunarEntry(date: Date(), lunarDay: "1", lunarMonth: "Tháng Giêng", lunarYear: "Năm Giáp Thìn")
    }

    func getSnapshot(in context: Context, completion: @escaping (LunarEntry) -> ()) {
        let entry = getLunarEntry()
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let entry = getLunarEntry()

        // Update at midnight
        let midnight = Calendar.current.startOfDay(for: Date().addingTimeInterval(86400))
        let timeline = Timeline(entries: [entry], policy: .after(midnight))

        completion(timeline)
    }

    func getLunarEntry() -> LunarEntry {
        let userDefaults = UserDefaults(suiteName: "group.com.sanggit999.lich_viet")
        let lunarDay = userDefaults?.string(forKey: "lunar_day") ?? "1"
        let lunarMonth = userDefaults?.string(forKey: "lunar_date") ?? "Tháng Giêng"
        let lunarYear = userDefaults?.string(forKey: "lunar_year") ?? "Năm Giáp Thìn"

        return LunarEntry(date: Date(), lunarDay: lunarDay, lunarMonth: lunarMonth, lunarYear: lunarYear)
    }
}

struct LunarEntry: TimelineEntry {
    let date: Date
    let lunarDay: String
    let lunarMonth: String
    let lunarYear: String
}

struct LunarWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color(red: 0.8, green: 0.2, blue: 0.2), Color(red: 1.0, green: 0.6, blue: 0.2)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )

            VStack(spacing: 8) {
                Text(entry.lunarDay)
                    .font(.system(size: 60, weight: .bold))
                    .foregroundColor(.white)

                Text(entry.lunarMonth)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)

                Text(entry.lunarYear)
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.white.opacity(0.8))
            }
            .padding()
        }
    }
}

@main
struct LunarWidget: Widget {
    let kind: String = "LunarWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            LunarWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Lịch Âm Việt")
        .description("Hiển thị ngày âm lịch Việt Nam")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}