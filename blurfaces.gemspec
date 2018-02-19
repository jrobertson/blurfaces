Gem::Specification.new do |s|
  s.name = 'blurfaces'
  s.version = '0.1.0'
  s.summary = 'Uses OpenCV to detect faces and RMagick to blur faces.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/blurfaces.rb', 'lib/haarcascade_frontalface_alt.xml']
  s.add_runtime_dependency('ruby-opencv', '~> 0.0', '>=0.0.18')  
  s.add_runtime_dependency('rmagick', '~> 2.16', '>=2.16.0')  
  s.signing_key = '../privatekeys/blurfaces.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/blurfaces'
end
