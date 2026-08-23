class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.47"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.47/husker-v0.4.47-aarch64-apple-darwin.tar.gz"
      sha256 "c98a31c9304d70455c6eef46cfebba5df83bc205cc7a4f24873cc5dc144152b8"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.47/husker-v0.4.47-x86_64-apple-darwin.tar.gz"
      sha256 "27719405f57bac0e92ca413acfb3a66301f872c2233933d892f902e2b6179b41"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.47/husker-v0.4.47-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2909e7eecf3b01eba3716758fac831c5dac0f48ea234786fbffc13e1c94154e3"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.47/husker-v0.4.47-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ca739df0bbea7b0d796970c6cb55bd05f58ad34295598f6228514016685e7523"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
