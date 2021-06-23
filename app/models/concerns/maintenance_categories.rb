module MaintenanceCategories
  extend ActiveSupport::Concern

  SIZE_50 = { periodic: 10_000, parts_change: 10_000 }
  SIZE_60 = { periodic: 10_000, parts_change: 11_000 }
  SIZE_80 = { periodic: 10_000, parts_change: 12_000 }
  SIZE_250 = { periodic: 20_000, parts_change: 20_000 }
  MESSAGE = { periodic: "Manutenção Periódica",
              parts_change: "Manutenção para troca de peças" }
end
