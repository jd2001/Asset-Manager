module AccessHelper
  def access(employee, business_asset)
    @access = employee.accesses.where(business_asset_id: business_asset.id)
    @access.first
  end
end