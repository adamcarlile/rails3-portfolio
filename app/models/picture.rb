class Picture < Asset
  has_one :header
  
  has_attached_file :data,
                    :url  => "/assets/pictures/:id/:style_:basename.:extension",
                    :path => ":rails_root/public/assets/pictures/:id/:style_:basename.:extension",
	                  :styles => { 
	                    :content => '560>', 
	                    :thumb => '80x80#',
	                    :hero => '920x300#',
	                    :large => '800>',
	                    :project_thumb => '200x155#',
	                    :project_large => '920x600#',
	                    :project_widethumb => '440x120#' }
	
	validates_attachment_size :data, :less_than => 5.megabytes
	
	def url_content
	  url(:content)
	end
	
	def to_s
	  "<img src='#{url_thumb}' />".html_safe
	end
	
	def url_thumb
	  url(:thumb)
	end
	
	def to_json(options = {})
	  options[:methods] ||= []
	  options[:methods] << :url_content
	  options[:methods] << :url_thumb
	  super options
  end
end
