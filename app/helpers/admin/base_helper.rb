module Admin::BaseHelper
  
  include AC::TabsHelper
  
  def control_link(label, url)
    link = link_to(label, url)
    if request.url == url
      css_class = 'on'
    end
    content_tag('li', link, :class => css_class)
  end
  
  def tab(*args)
    options = {:label => args.first.to_s.humanize}
    if args.last.is_a?(Hash)
      options = options.merge args.pop
    end

    url = options[:url] || send("admin_#{args.first}_path")
    link = link_to(options[:label], url)
    
    if respond_to?(:parent_type)
      resource_name = parent_type || model_name
    else
      resource_name = 'dashboard'
    end
    
    if url.include?(request.fullpath)
      css_class = 'on'
    end
    content_tag('span', link, :class => css_class)
  end
    
end
