class Convert2pdf < Formula
  desc "Command-line tool to convert Office documents to PDF using LibreOffice"
  homepage "https://github.com/shar-mayank/convert2pdf"
  url "https://github.com/shar-mayank/convert2pdf/archive/v1.0.0.tar.gz"
  sha256 "83a4f77a4d6d09943eb5068b1b11682cef9d785de7418dec1f711e694e5a8d6d"
  license "MIT"

  depends_on "libreoffice"

  def install
    bin.install "convert2pdf"
    # Ensure the script is executable
    chmod 0755, bin/"convert2pdf"
  end

  test do
    # Create a simple test document
    (testpath/"test.txt").write("Test document")
    touch testpath/"test.docx"

    # Test help output
    assert_match "Usage: convert2pdf", shell_output("#{bin}/convert2pdf --help")

    # Test error handling for unsupported format
    assert_match "Error: Unsupported file format", shell_output("#{bin}/convert2pdf test.txt 2>&1", 1)

    # Test error handling for non-existent file
    assert_match "Error: Input file", shell_output("#{bin}/convert2pdf nonexistent.docx 2>&1", 1)
  end
end