class FieldPicker

  def initialize(presenter)
    @presenter = presenter
    @fields = @presenter.params[:fields]
  end

  def pick
    # If the `validate_fields` method returns a nil value, use `pickable` instead
    (validate_fields || pickable).each do |field|
      # Check if the `@presenter` object or the object being presented by
      # `@presenter` responds to the method named `field`
      value = (@presenter.respond_to?(field) ? @presenter : @presenter.object).send(field)
      # Store the returned value in the `data` hash of the `@presenter` object
      @presenter.data[field] = value
    end
    # Return the updated `@presenter` object
    @presenter
  end

  private

  def validate_fields
    return nil if @fields.blank?
    validated = @fields.split(',').reject { |f| !pickable.include?(f) }
    validated.any? ? validated : nil
  end

  def pickable
    @pickable ||= @presenter.class.build_attributes
  end
end