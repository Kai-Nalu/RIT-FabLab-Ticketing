# -*- encoding: utf-8 -*-
# stub: cocooned 2.0.3 ruby lib

Gem::Specification.new do |s|
  s.name = "cocooned".freeze
  s.version = "2.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "https://rubygems.org", "bug_tracker_uri" => "https://github.com/notus-sh/cocooned/issues", "changelog_uri" => "https://github.com/notus-sh/cocooned/blob/main/CHANGELOG.md", "funding_uri" => "https://opencollective.com/notus-sh", "homepage_uri" => "https://github.com/notus-sh/cocooned", "rubygems_mfa_required" => "true", "source_code_uri" => "https://github.com/notus-sh/cocooned" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ga\u00EBl-Ian Havard".freeze, "Nathan Van der Auwera".freeze]
  s.date = "2023-10-13"
  s.description = " Easier nested form in Rails with capabilities to add, remove, reorder or limit nested items. Works with standard Rails form builder, Formtastic or SimpleForm, and with or without jQuery. ".freeze
  s.email = ["gael-ian@notus.sh".freeze, "nathan@dixis.com".freeze]
  s.homepage = "https://github.com/notus-sh/cocooned".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.6".freeze)
  s.rubygems_version = "3.3.7".freeze
  s.summary = "Form builder agnostic handling of Rails nested forms".freeze

  s.installed_by_version = "3.3.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<rails>.freeze, [">= 6.0", "<= 7.2"])
    s.add_development_dependency(%q<bundler>.freeze, ["~> 2.1"])
    s.add_development_dependency(%q<formtastic>.freeze, ["~> 4.0"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 13.0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.11"])
    s.add_development_dependency(%q<rspec-rails>.freeze, [">= 5.0"])
    s.add_development_dependency(%q<simple_form>.freeze, ["~> 5.1"])
  else
    s.add_dependency(%q<rails>.freeze, [">= 6.0", "<= 7.2"])
    s.add_dependency(%q<bundler>.freeze, ["~> 2.1"])
    s.add_dependency(%q<formtastic>.freeze, ["~> 4.0"])
    s.add_dependency(%q<rake>.freeze, ["~> 13.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.11"])
    s.add_dependency(%q<rspec-rails>.freeze, [">= 5.0"])
    s.add_dependency(%q<simple_form>.freeze, ["~> 5.1"])
  end
end
