package com.sanggit999.lich_viet

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.widget.RemoteViews
import es.antonborri.home_widget.HomeWidgetPlugin

class LunarWidgetProvider : AppWidgetProvider() {
    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray
    ) {
        for (appWidgetId in appWidgetIds) {
            updateAppWidget(context, appWidgetManager, appWidgetId)
        }
    }

    private fun updateAppWidget(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetId: Int
    ) {
        val widgetData = HomeWidgetPlugin.getData(context)
        val views = RemoteViews(context.packageName, R.layout.lunar_widget)

        val lunarDate = widgetData.getString("lunar_date", "Đang tải...")
        val lunarYear = widgetData.getString("lunar_year", "")
        val lunarDay = widgetData.getInt("lunar_day", 1)

        views.setTextViewText(R.id.lunar_day, lunarDay.toString())
        views.setTextViewText(R.id.lunar_month, lunarDate)
        views.setTextViewText(R.id.lunar_year, lunarYear)

        appWidgetManager.updateAppWidget(appWidgetId, views)
    }
}