module FuelData
  extend ActiveSupport::Concern

  ALCOHOL = { autonomy: 7.0, price: 4.49 }
  GASOLINE = { autonomy: 10.0, price: 5.79 }
  DIESEL = { autonomy: 4.0, price: 4.34 }
end
