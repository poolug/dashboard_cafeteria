class DashboardController < ApplicationController
  def index

    # gráficos de barra
    @sales_by_month = Sale.where('date > ? ', 1.year.ago).group("strftime('%m-%Y', date)").order(date: :asc).sum(:price)
    @sales_by_count_month = Sale.where('date > ? ', 1.year.ago).group("strftime('%m-%Y', date)").order(date: :asc).count
    @sales_by_average_month = Sale.where('date > ? ', 1.year.ago).group("strftime('%m-%Y', date)").order(date: :asc).average(:price)

    # gráficos de torta por origen
    @sales_origin_12 = Product.joins(:sales).where('date > ? ', 1.year.ago).group(:origin).count
    @sales_origin_6 = Product.joins(:sales).where('date > ? ', 6.month.ago).group(:origin).count
    @sales_origin_3 = Product.joins(:sales).where('date > ? ', 3.month.ago).group(:origin).count
    @sales_origin_1 = Product.joins(:sales).where('date > ? ', 1.month.ago).group(:origin).count

    # gráficos de torta por mezcla
    @sales_blend_12 = Product.joins(:sales).where('date > ? ', 1.year.ago).group(:name).count
    @sales_blend_6 = Product.joins(:sales).where('date > ? ', 6.month.ago).group(:name).count
    @sales_blend_3 = Product.joins(:sales).where('date > ? ', 3.month.ago).group(:name).count
    @sales_blend_1 = Product.joins(:sales).where('date > ? ', 1.month.ago).group(:name).count

  end
end
