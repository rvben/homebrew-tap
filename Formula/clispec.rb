class Clispec < Formula
  desc "Score CLI tools against The CLI Spec"
  homepage "https://github.com/rvben/clispec-cli"
  version "0.2.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/clispec-cli/releases/download/v0.2.8/clispec-v0.2.8-aarch64-apple-darwin.tar.gz"
      sha256 "56c0779863340ee6b7575ea174f255e690b01a1848476b46a11cc79f62dc5801"
    else
      url "https://github.com/rvben/clispec-cli/releases/download/v0.2.8/clispec-v0.2.8-x86_64-apple-darwin.tar.gz"
      sha256 "2a9a8d4cb38352e3982af07e053262c4b507adddd2d96ae74f40744a4dddf8dc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/clispec-cli/releases/download/v0.2.8/clispec-v0.2.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ff0108d416e4002dd3e99d5f5e0d3e246c1562fcb1de72f803417034118eb5a5"
    else
      url "https://github.com/rvben/clispec-cli/releases/download/v0.2.8/clispec-v0.2.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5416ddff519433a26dc201170ad4a58279505a4b81e255a57535d55beb373f53"
    end
  end

  def install
    bin.install "clispec"
  end

  test do
    system "#{bin}/clispec", "--version"
  end
end
