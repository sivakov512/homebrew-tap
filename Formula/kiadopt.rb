class Kiadopt < Formula
  include Language::Python::Virtualenv

  desc "Copy parts from KiCad 10 libraries into the project library"
  homepage "https://github.com/sivakov512/kiadopt"
  url "https://github.com/sivakov512/kiadopt/releases/download/v0.1.2/kiadopt-0.1.2-py3-none-any.whl", using: :nounzip
  sha256 "43e5011270ace2f6c3f3167e0f1cee12dabe0b17d446512c2824c3c287267df1"
  license "MIT"

  depends_on "python@3.14"

  def install
    # kiadopt is pure Python: the wheel installs as is, nothing to build.
    venv = virtualenv_create(libexec, "python3.14")
    venv.pip_install_and_link buildpath.glob("kiadopt-*-py3-none-any.whl").first
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kiadopt --version")
    output = shell_output("#{bin}/kiadopt -s Device:R --to Local 2>&1", 1)
    assert_match "expected exactly one .kicad_pro", output
  end
end
