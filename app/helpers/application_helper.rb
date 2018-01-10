module ApplicationHelper
  def link_to_add_fields(name, form, association)
    new_object = form.object.send(association).klass.new
    id = new_object.object_id
    fields = form.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", form: builder)
    end
    link_to(name, '#', class: "add_fields button is-warning is-add large-button", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def page_title
    if Admin::SiteInformation.where("name = 'branding'").first.header
      Admin::SiteInformation.where("name = 'branding'").first.header
    else
      "Online Investigator's Guide  |  Office for Clinical Research"
    end
  end

end
