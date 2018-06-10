module SmartListingConcern
  extend ActiveSupport::Concern

  private
  # manage_smart_listing takes an array of strings which name private methods in the form of 'list_resource_name'
  # Create lists in this form and include the instance variable '@list' in the smart_listing_update
  # Doing this ensures that ajax requests do not clash with smart_listing
  def manage_smart_listing(methods)
    respond_to do |format|
      format.html do
        methods.each do |method|
          symbol = method.to_sym
          self.send(symbol)
        end
      end

      format.js do
        params.keys.each do |key|
          if key.last(7) == "listing"
            name = key.chomp("_smart_listing")
            symbol = "list_#{name}".to_sym
            self.send(symbol)
            return @list = name.to_sym
          end
        end
      end
    end
  end
end
