ActiveAdmin.register AccountType do
  permit_params :kind, :overdraft_max, :overdraft_min, :rate, :celling
end
