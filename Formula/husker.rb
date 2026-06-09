class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.3.1/husker-v0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "571015c3f8e954df3abad418b8e3942223c5adf3673a9c66c7fb94903fa60564"
    else
      url "https://github.com/rvben/husker/releases/download/v0.3.1/husker-v0.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "4684315496e673305fde04721b451127e37b0142280e9042489a4b1390a88daa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.3.1/husker-v0.3.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0f970fe3ead8bcb8d27df72c51275a5f616a58cde8b51f79c7bb8fc39a82b7a5"
    else
      url "https://github.com/rvben/husker/releases/download/v0.3.1/husker-v0.3.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b06c565dad74da77e4c249b8bcfc2b4df4307516944f1b8b8ae6505d111403bb"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
