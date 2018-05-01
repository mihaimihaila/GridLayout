Pod::Spec.new do |s|
  s.name             = 'GridLayout'
  s.version          = '0.1.1'
  s.summary          = 'Swift library for displaying UI elements in a grid like structure'
 
  s.description      = <<-DESC
Swift library for displaying UI elements in a grid like structure.
A grid can contain a variable number of rows and columns.
Items inside the grid can be placed on any row or column.
                       DESC
 
  s.homepage         = 'https://github.com/mihaimihaila/GridLayout'
  s.license          = 'MIT'
  s.author           = { 'Mihai Mihaila' => 'mihai.mihaila@gmail.com' }
  s.source           = { :git => 'https://github.com/mihaimihaila/GridLayout.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '10.0'
  s.source_files = 'GridLayout/*'
end