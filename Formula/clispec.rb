class Clispec < Formula
  desc "Score CLI tools against The CLI Spec"
  homepage "https://github.com/rvben/clispec-cli"
  version "0.2.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/clispec-cli/releases/download/v0.2.9/clispec-v0.2.9-aarch64-apple-darwin.tar.gz"
      sha256 "bbeaa4635df08f1a5fc58c389682dbc7bb6a07474a2e9170bb979b761597e568"
    else
      url "https://github.com/rvben/clispec-cli/releases/download/v0.2.9/clispec-v0.2.9-x86_64-apple-darwin.tar.gz"
      sha256 "11e89c2229a0eb40d4433e51e893c47a2df156857c670f892d8e3d97a6ea8081"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/clispec-cli/releases/download/v0.2.9/clispec-v0.2.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6810b03ac74c4c8139c404fbf2460064e3a67a87cedeab926a57e84081178304"
    else
      url "https://github.com/rvben/clispec-cli/releases/download/v0.2.9/clispec-v0.2.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a9e1f72e0d80d3bfc3c8ccda4156dd7678da75a0076ffd288187ba06f2baf795"
    end
  end

  def install
    bin.install "clispec"
  end

  test do
    system "#{bin}/clispec", "--version"
  end
end
