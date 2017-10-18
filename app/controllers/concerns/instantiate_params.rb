module InstantiateParams
  extend ActiveSupport::Concern
  private

  def instantiate_params *args
    args.each do |arg|
      if arg.class.to_s == 'Array'
        if params[arg[0]].present?
          instance_variable_set("@#{arg[0].to_s}", params[arg[0]])
        else
          instance_variable_set("@#{arg[0].to_s}", arg[1])
        end

        next
      end

      if params[arg].present?
        instance_variable_set("@#{arg.to_s}", params[arg])
      end
    end
  end
end
