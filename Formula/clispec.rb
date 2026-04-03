class Clispec < Formula
  desc "Score CLI tools against The CLI Spec"
  homepage "https://github.com/rvben/clispec-cli"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/clispec-cli/releases/download/v0.1.2/clispec-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "022ffc5772e04ac40d5329b3cf0615002eace76af8e99e016b9c81a83e53ab1a"
    else
      url "https://github.com/rvben/clispec-cli/releases/download/v0.1.2/clispec-v0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "612be5689df62673b09216f558807eba19ea08dd86ae226374ad280629d913cd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/clispec-cli/releases/download/v0.1.2/clispec-v0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7039042cbb3941d5c18170ac43ad982e30e66ad668da50dd0e9df05cdee3ddfd"
    else
      url "https://github.com/rvben/clispec-cli/releases/download/v0.1.2/clispec-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1ddd6d22d3ebeb4f3cbccbbb5a4dc7bc58b774c71c39bc1d6a4eb58e291eadc6"
    end
  end

  def install
    bin.install "clispec"
  end

  test do
    system "#{bin}/clispec", "--version"
  end
end
