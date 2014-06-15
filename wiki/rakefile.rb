# Rakefile for Sphinx documentation
require 'rake/clean'
require 'pp'

CLEAN.include(["*/**/*.~","*/**/\#*"])
CLOBBER.include("*/**/*.txt")

SPHINXOPTS    = ""
SPHINXBUILD   = "sphinx-build"
BUILDDIR      = "build"
SOURCEDIR     = "src"
ALLSPHINXOPTS = "-d #{BUILDDIR}/doctrees #{SPHINXOPTS} #{SOURCEDIR}"
BROWSER       = "firefox"

task :default => :html

desc "to make standalone HTML files"
task :html do
  cmd = "#{SPHINXBUILD} -b html #{ALLSPHINXOPTS} #{BUILDDIR}/html"
  if system( cmd )
    puts "Build finished. The HTML pages are in #{BUILDDIR}/html."
  end
end

desc "send all files to ftp server"
task :ftp do
  if system( "ncftpput -R lolipop ./wordpress/sphinx build/html" )
    puts "FTP finished. Access to http://futurismo.biz/sphinx/html/"
  end
end

desc "open local file"
task :open do
  cmd = "#{BROWSER} #{BUILDDIR}/html/index.html"
  system( cmd )
end
