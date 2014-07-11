# Rakefile for Sphinx documentation
require 'rake/clean'
require 'pp'

CLEAN.include(["*/**/*.~","*/**/\#*"])
CLOBBER.include("*/**/*.txt")

SOURCEDIR     = "src"
BUILDDIR      = "pages"
BUILDCMD      = "org-wk-export-to-wiki"
URL           = "http://futurismo.biz/dokuwiki"

task :default => [:export, :ftp]

desc "export org-file to dokuwiki-file"
task :export do
  cmd = "./#{BUILDCMD} #{SOURCEDIR}/*.org"
  if system( cmd )
    system("mv #{SOURCEDIR}/*.txt #{BUILDDIR}")
    puts "Build finished. The HTML pages are in #{BUILDDIR}"
  end
end

desc "send all files to ftp server"
task :ftp do
  if system( "ncftpput -R lolipop ./wordpress/dokuwiki/data pages" )
    puts "FTP finished. Access to #{URL}"
  end
end
