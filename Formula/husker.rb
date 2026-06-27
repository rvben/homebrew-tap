class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.22"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.22/husker-v0.4.22-aarch64-apple-darwin.tar.gz"
      sha256 "5be2f62074ae4c7772cffafb60e686dd779afee7ad117c79fa9b00d7a3370346"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.22/husker-v0.4.22-x86_64-apple-darwin.tar.gz"
      sha256 "5d44500e804a3ad3f5f607a051bf54c418518730307cda294010a939e951f36e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.22/husker-v0.4.22-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7858fde5874b3263c6b792108f4ca13675ea2f48582852ef0dd82b32844037d6"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.22/husker-v0.4.22-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1a1e06ae7281a741ee4b33e1894c1a40c1e20203250ff2fb4a7963515210665c"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
