# config/initializers/wicked_pdf.rb

# Define a method to download and install wkhtmltopdf if it's missing
def install_wkhtmltopdf_if_missing
  unless system('which wkhtmltopdf')
    # Download and install wkhtmltopdf
    system('wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.bionic_amd64.deb')
    system('sudo dpkg -i wkhtmltox_0.12.6-1.bionic_amd64.deb')
  end
end

# Check for wkhtmltopdf on Rails startup
install_wkhtmltopdf_if_missing

# WickedPDF Global Configuration
WickedPdf.config = {
  exe_path: '/usr/local/bin/wkhtmltopdf',
  enable_local_file_access: true,
  layout: 'pdf.html',
  use_xvfb: true,
}
