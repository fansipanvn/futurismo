# Rakefile for Sphinx documentation
require 'rake/clean'
require 'pp'

CLEAN.include(["*/**/*.~","*/**/\#*"])
CLOBBER.include("*/**/*.txt")

SOURCEDIR     = "src"
BUILDDIR      = "pages"
BUILDCMD      = "org-wk-export-to-wiki"
URL           = "http://futurismo.biz/dokuwiki"

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


##################################################################
# For Sphinx Setting(old)
##################################################################
# SPHINXOPTS    = ""
# SPHINXBUILD   = "sphinx-build"
# ALLSPHINXOPTS = "-d #{BUILDDIR}/doctrees #{SPHINXOPTS} #{SOURCEDIR}"
# BROWSER       = "firefox"

# desc "to make standalone HTML files"
# task :html do
#   cmd = "#{SPHINXBUILD} -b html #{ALLSPHINXOPTS} #{BUILDDIR}/html"
#   if system( cmd )
#     puts "Build finished. The HTML pages are in #{BUILDDIR}/html."
#   end
# end

# desc "send all files to ftp server"
# task :ftp do
#   if system( "ncftpput -R lolipop ./wordpress/sphinx build/html" )
#     puts "FTP finished. Access to http://futurismo.biz/sphinx/html/"
#   end
# end

# desc "open local file"
# task :open do
#   cmd = "#{BROWSER} #{BUILDDIR}/html/index.html"
#   system( cmd )
# end
