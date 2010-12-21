module ApplicationHelper
  
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
  
end
