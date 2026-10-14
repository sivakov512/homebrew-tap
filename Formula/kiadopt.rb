class Kiadopt < Formula
  include Language::Python::Virtualenv

  desc "Copy parts from KiCad 10 libraries into the project library"
  homepage "https://github.com/sivakov512/kiadopt"
  url "https://github.com/sivakov512/kiadopt/releases/download/v0.1.1/kiadopt-0.1.1.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "MIT"

  depends_on "python-setuptools" => :build
  depends_on "python@3.14"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kiadopt --version")
    output = shell_output("#{bin}/kiadopt -s Device:R --to Local 2>&1", 1)
    assert_match "expected exactly one .kicad_pro", output
  end
end
