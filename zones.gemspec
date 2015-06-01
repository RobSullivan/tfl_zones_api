# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

GEM::Specification.new do |spec|
	spec.name			= "Robert Sullivan"
	spec.version		= "1.0"
	spec.authors		= ["Robert Sullivan"]
	spec.email			= ["robertjsullivan.esq@gmail.com"]
	spec.summary		= %q{An API for TFL zones}
	spec.description 	= %q{An API that given a longitude and latitude will return the tfl zone where lat & lng sit}
	spec.homepage		= "http://domain.com"
	spec.license		= "MIT"

	spec.files			= ['lib/zones.rb']
	spec.executables 	= ['bin/zones']
	spec.test_files		= ['tests/test_zones.rb']
	spec.require_paths 	= ['lib']