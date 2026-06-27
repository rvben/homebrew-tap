class Clispec < Formula
  desc "Score CLI tools against The CLI Spec"
  homepage "https://github.com/rvben/clispec-cli"
  version "0.2.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/clispec-cli/releases/download/v0.2.7/clispec-v0.2.7-aarch64-apple-darwin.tar.gz"
      sha256 "84c0ab9276d48fe0c444eeef01cbf083527f35553921201c2fac73022d3d264a"
    else
      url "https://github.com/rvben/clispec-cli/releases/download/v0.2.7/clispec-v0.2.7-x86_64-apple-darwin.tar.gz"
      sha256 "687d7b29af7ae7f19d46168c9ac4b49715a6f0dea31238b533cc414d8bb30bcd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/clispec-cli/releases/download/v0.2.7/clispec-v0.2.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f6eda1274bebc805868fcd0dc5e12f624b65c9b9f496542aa8ac3dbf7e69fd35"
    else
      url "https://github.com/rvben/clispec-cli/releases/download/v0.2.7/clispec-v0.2.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fa645ddabf3a6f803b3ffadcb2e11c90381baffbe6dfebcc27ccab2707d0bcdb"
    end
  end

  def install
    bin.install "clispec"
  end

  test do
    system "#{bin}/clispec", "--version"
  end
end
