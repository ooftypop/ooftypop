module SnoopDogg
  extend ActiveSupport::Concern
  private

  included do
    def puts_attributes(include_type = false)
      puts "=" * 88,
           "#{self.class.name} #{self.id}",
           "=" * 88
      self.attributes.sort.each do |k,v|
        row = "#{k}: #{v}"
        row = row + " (#{v.class.name})" if include_type
        puts row
      end
      puts "=" * 88
    end
  end
end
