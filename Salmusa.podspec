Pod::Spec.new do |s|
  s.name         = 'Salmusa'
  s.version      = '0.1.0'
  s.summary      = 'Salmusa VIPER template framework.'
  s.description  = <<-DESC
                   Salmusa VIPER template framework.
                   Define connections between components.
                   Provide useful protocols for components.
                   DESC
  s.homepage     = 'https://github.com/Salmusa/Salmusa'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'jasonnam' => 'contact@jasonnam.com' }

  s.source       = { :path => '.' }
  s.source_files = 'Sources/Salmusa/**/*.{swift}'
end
