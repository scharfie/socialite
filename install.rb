puts "Copying Socialite files..."

# Images
FileUtils.mkdir File.join(RAILS_ROOT, "public", "images", "socialite")

%w{delicious digg email facebook reddit stumbleupon technorati twitter}.each do |site|
  dest_file = File.join(RAILS_ROOT, "public", "images", "socialite", "#{site}.png")
  src_file = File.join(File.dirname(__FILE__) , "assets", "images", "#{site}.png")
  FileUtils.cp_r(src_file, dest_file)
end

puts "Files copied - Installation complete!"
