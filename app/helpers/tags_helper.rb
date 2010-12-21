module TagsHelper
  
  def render_tag_list(tags)
    if tags.is_a? Array
      output = "".html_safe
      tags.each do |tag|
        output << content_tag(:li, tag)
      end
      content_tag(:ul, output)
    end
  end
  
end
