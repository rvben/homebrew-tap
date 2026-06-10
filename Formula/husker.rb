class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.0/husker-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "b073adfe0e0508ef386859e7254901a93ba2ce3c9401e06a23446515e6afe908"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.0/husker-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "24bc2606870f52c39ce3e73010edf0a57b030ab10d9c370b50cef35474e3828b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.0/husker-v0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a92b61e543fbe107630bff127f28fd726dfee6cac454d6ee062f1a3f823fe4d3"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.0/husker-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fccd7947eb4898000b5b7e32b7967f9241bab10b49d90d0efd23bdf860f8543d"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
