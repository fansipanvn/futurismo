# Rakefile for Sphinx documentation
require 'rake/clean'
require 'syncftp'
require 'pp'

CLEAN.include(["*/**/*.~","*/**/\#*"])
CLOBBER.include(["pages/**/*.~","pages/**/\#*","pages/**/*.org"])

SOURCEDIR     = "src"
BUILDDIR      = "pages"
REMOTEDIR     = "./wordpress/dokuwiki/data"
BUILDCMD      = "org-wk-export-to-wiki"

BROWSER       = "firefox"
URL           = "http://futurismo.biz/dokuwiki"

SRCS = FileList["**/*.org"]
SRCS.exclude("README.org")
WIKIS = SRCS.ext('txt')

task :default => [:build, :ftp]

directory BUILDDIR
file :build => WIKIS do
  system("rm -rf #{BUILDDIR}")
  system("cp -r #{SOURCEDIR} #{BUILDDIR}")
end

rule '.txt' => '.org' do |t|
  sh "./#{BUILDCMD} #{t.source}"
end

desc "send all files to ftp server"
task :ftp => :clobber do
  if system( "ncftpput -R -m lolipop #{REMOTEDIR} #{BUILDDIR}" )
    puts "FTP finished. Access to #{URL}"
  end
end

desc "open url"
task :open do
  system("#{BROWSER} #{URL}")
end
