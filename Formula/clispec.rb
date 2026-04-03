class Clispec < Formula
  desc "Score CLI tools against The CLI Spec"
  homepage "https://github.com/rvben/clispec-cli"
  version "0.1.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/clispec-cli/releases/download/v0.1.5/clispec-v0.1.5-aarch64-apple-darwin.tar.gz"
      sha256 "6e5e408034391258ba72429db2dd1471f5f47e9cafd4e068dee7e459d7133f72"
    else
      url "https://github.com/rvben/clispec-cli/releases/download/v0.1.5/clispec-v0.1.5-x86_64-apple-darwin.tar.gz"
      sha256 "d4e8370a6d2710f2143a91ca275c3f70b4d06cdf84ccdad0972f5e8cf2b5326b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/clispec-cli/releases/download/v0.1.5/clispec-v0.1.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0270004d55eff271815bdc0bb24395218d012ea5e74b871c6529b9f09019957e"
    else
      url "https://github.com/rvben/clispec-cli/releases/download/v0.1.5/clispec-v0.1.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f84f7c0158e6ebb0970d827f869afe5e0083bd3e3973f2822dc3207d937ff1b4"
    end
  end

  def install
    bin.install "clispec"
  end

  test do
    system "#{bin}/clispec", "--version"
  end
end
