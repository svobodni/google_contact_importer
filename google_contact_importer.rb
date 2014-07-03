#!/usr/bin/env ruby

require 'highline/import'
require 'trollop'
require 'active_resource'

 opts = Trollop::options do  
  version "google_contact_importer 0.1 (c) 2014 Pavel Stross"
  banner <<-EOS
  This program fetch contacts from svobodni registry and upload them to your google contacts

  Usage:
        
  EOS

  opt :googleuser, "Your google account name", :type => String, :short => "-g"
  opt :googlepass, "Your google account password", :type => String, :short => "-o"
  opt :svobodniuser, "Your Svobodni username", :type => String, :short => "-u"
  opt :svobodnipass, "Your Svobodni password", :type => String, :short => "-p"
  #opt :generatevcard, "Generate vcard", :type=>Boolean, :short => "-v"
 end

$svobodniuser="corvus"
$svobodnipassword="****"

# models

class Person < ActiveResource::Base
  self.site = "https://registr.svobodni.cz"
  self.user = $svobodniuser
  self.password = $svobodnipassword
  self.format = :json
  
end

class Region < ActiveResource::Base
  self.site = "https://registr.svobodni.cz"
  self.user = $svobodniuser
  self.password = $svobodnipassword
  self.format = :json

end

class Branch < ActiveResource::Base
  self.site = "https://registr.svobodni.cz"
  self.user = $svobodniuser
  self.password = $svobodnipassword
  self.format = :json
  has_many :people 
 end
 
 r = Region.find(10)
 puts "#{r.name}"
 r.branches.each do |b|
  puts "#{b.name}"
 end
 b = Branch.find(108)
 puts "#{b.name}"
 b.people.each do |p|
  puts "#{p.last_name}"
 end
 p = Person.find(2438)
 puts "#{p.last_name}"
 