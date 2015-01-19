module ApplicationHelper

  def my_name
    p "Tish  "
  end

   module ApplicationHelper
   def form_group_tag(errors, &block)
     if errors.any?
       content_tag :div, capture(&block), class: 'form-group has-error'
     else
       content_tag :div, capture(&block), class: 'form-group'
     end
   end
 end
  
end

