class DashboardController < ApplicationController
  def index

    @last12m_sale = Sale.group_by_month(:sale_date, last: 12, format: '%b -%y' ).order(sale_date: :asc).sum(:price)
    @last12m_sale_count = Sale.group_by_month(:sale_date, last: 12, format: '%b -%y' ).order(sale_date: :asc).count
    @last12m_sale_average = Sale.group_by_month(:sale_date, last: 12, format: '%b -%y' ).order(sale_date: :asc).average(:price)

    # grafico ded torta origi 
    @last12m_sale_pie = Sale.where('sale_date >= ?', 1.year.ago).group(:origin).order(sale_date: :asc).count
                              # Sale.where(sale_date: 1.year.ago..)

    @last6m_sale_pie = Sale.where('sale_date >= ?', 6.month.ago).group(:origin).order(sale_date: :asc).count
    @last3m_sale_pie = Sale.where('sale_date >= ?', 3.month.ago).group(:origin).order(sale_date: :asc).count
    @last1m_sale_pie = Sale.where('sale_date >= ?', 1.month.ago).group(:origin).order(sale_date: :asc).count

  
    @last12m_sale_pie_blend = Sale.where('sale_date >= ?', 1.year.ago).group(:blend).order(sale_date: :asc).count
    # Sale.where(sale_date: 1.year.ago..)

    @last6m_sale_pie_blend = Sale.where('sale_date >= ?', 6.month.ago).group(:blend).order(sale_date: :asc).count
    @last3m_sale_pie_blend = Sale.where('sale_date >= ?', 3.month.ago).group(:blend).order(sale_date: :asc).count
    @last1m_sale_pie_blend = Sale.where('sale_date >= ?', 1.month.ago).group(:blend).order(sale_date: :asc).count


    # con activereccord
    @last12m_sale_active = Sale.where('sale_date >= ?', 12.month.ago).group("strftime('%m-%y', sale_date)").order(sale_date: :asc).sum(:price)




  end
end
