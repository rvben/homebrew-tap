class Clispec < Formula
  desc "Score CLI tools against The CLI Spec"
  homepage "https://github.com/rvben/clispec-cli"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/clispec-cli/releases/download/v0.1.1/clispec-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "e06eb1cb757a7ac71a85bef26710f98f458277434b588ca5e5b5d9cda325f040"
    else
      url "https://github.com/rvben/clispec-cli/releases/download/v0.1.1/clispec-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "c863f5242de0785f1f36bb3313af261df3299f6cb97935b2cec9aa0eb250eca5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/clispec-cli/releases/download/v0.1.1/clispec-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5095134bfee9b0e01752b753315c72fcbe81349a8dd14e1ae4c2aa0cf6de7eaf"
    else
      url "https://github.com/rvben/clispec-cli/releases/download/v0.1.1/clispec-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "797fd52c7ecd3880868e0151a7220c77ba15f7c3a0e02255b662e70e45bc2cb6"
    end
  end

  def install
    bin.install "clispec"
  end

  test do
    system "#{bin}/clispec", "--version"
  end
end
