module ApplicationHelper
  def format_date(date)
    date.strftime("%d-%m-%Y %H:%M:%S")
  end

  def format_hour(hour)
    hour.strftime("%H:%M")
  end

  def price_mask_real(price)
    number_to_currency(price, unit: 'R$', separator: ',', delimiter: '.')
  end
end
