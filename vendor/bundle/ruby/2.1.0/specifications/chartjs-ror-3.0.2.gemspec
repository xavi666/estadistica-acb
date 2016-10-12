# -*- encoding: utf-8 -*-
# stub: chartjs-ror 3.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "chartjs-ror"
  s.version = "3.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Andy Stewart"]
  s.date = "2016-06-13"
  s.description = "Simplifies using Chart.js in Rails"
  s.email = ["boss@airbladesoftware.com"]
  s.homepage = "https://github.com/airblade/chartjs-ror"
  s.rubygems_version = "2.2.5"
  s.summary = "Simplifies using Chart.js in Rails"

  s.installed_by_version = "2.2.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 3.1"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<rails>, [">= 3.1"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3.1"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
