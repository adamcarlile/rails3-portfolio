module ApplicationHelper
  include AC::ToSlug
  
  def user_status
    xhtml = Builder::XmlMarkup.new :target => out=(''), :indent => 2
    xhtml.div(:id => "user_nav") do |x|
      if user_signed_in?
        x << "Signed in as #{current_user.email}. Not you? "
        x << link_to("Sign out", destroy_user_session_path)
      else
        x << link_to("Sign up", new_user_registration_path)
        x << " or "
        x << link_to("Sign in", new_user_session_path)
      end
    end
  end
  
  def google_maps_javascript(version=2)
    if version == 2
      if GOOGLE_MAPS_KEY.is_a?(Hash)
        key = GOOGLE_MAPS_KEY[request.host]
      else
        key = GOOGLE_MAPS_KEY
      end
      %(<script src="http://maps.google.com/maps?file=api&v=2&key=#{key}" type="text/javascript"></script>).html_safe
    else
      %(<script src="http://maps.google.com/maps/api/js?sensor=false" type="text/javascript"></script>).html_safe
    end
  end
  
  def render_tech_list(tags)
    xhtml = Builder::XmlMarkup.new :target => out=(''), :indent => 2
    xhtml.ul(:id => 'tech-tags') do |x|
      tags.each do|tag|
        x.li(:class => tag.to_s.to_url) do |l|
          l << tag.name
        end
      end
    end
  end
  
  def portfolio_rollover_link(object, options={})
    default_options = { :image_type => :project_thumb, 
                        :cycle_array => ['first', 'second', 'third'], 
                        :url => project_path(object),
                        :title => object.title}
    options = default_options.update(options)
    # End Config merge
    
    return unless object.is_a? Project
    xhtml = Builder::XmlMarkup.new :target => out=(''), :indent => 2
    xhtml.li(:class => cycle(*options[:cycle_array])) do |x|
      x << render_portfolio_link(object.attachments.first.asset.url(options[:image_type]), options[:url])
      x.div(:class => 'overlay') do |overlay| 
        overlay << content_tag(:h4, link_to(options[:title], options[:url]))
        overlay << content_tag(:p, link_to(options[:subtitle], options[:url])) unless options[:subtitle].blank?
      end
    end
    
  end
  
  def render_portfolio_link(attachment, url)
    link_to(image_tag(attachment), url)
  end
  
end
