#Define Post Factories
Factory.define :post, :class => Post do |p|
  p.title "This is my first post"
  p.body "<p>This is some html in my first post</p>"
  p.tag_list ['Ruby', 'Rails', 'Test']
end