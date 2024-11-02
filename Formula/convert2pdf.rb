class Convert2pdf < Formula
  desc "Command-line tool to convert Office documents to PDF"
  homepage "https://github.com/shar-mayank/convert2pdf"
  url "https://github.com/shar-mayank/convert2pdf/archive/v1.0.0.tar.gz"
  sha256 "83a4f77a4d6d09943eb5068b1b11682cef9d785de7418dec1f711e694e5a8d6d"
  license "MIT"

  depends_on "libreoffice"

  def install
    bin.install "bin/convert2pdf"
  end

  test do
    system "#{bin}/convert2pdf", "--help"
  end
end