module ApplicationHelper
  def page_class
    "page-#{ controller_name.dasherize }-#{ action_name.dasherize }"
  end

  def enum_options_for_select(model, enum_name, raw: false, except: [])
    model.send(enum_name.to_s.pluralize).except(*except).map do |k, v|
      [model.human_attribute_name("#{enum_name}.#{k}"), raw ? v : k]
    end
  end
end
