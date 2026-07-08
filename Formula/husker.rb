class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.36"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.36/husker-v0.4.36-aarch64-apple-darwin.tar.gz"
      sha256 "c0c5e969b75adc9950aa840fefb8974f88c83fefda4d3a093a4627c8fbd7ae7f"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.36/husker-v0.4.36-x86_64-apple-darwin.tar.gz"
      sha256 "d476c0876d5825d275154ced1f88edfef605d2299554fe0877cc1c502d4b6f88"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.36/husker-v0.4.36-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "381b1f46415ae16487bf8359fa11845f384fadb644345fda917ea532caf4898f"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.36/husker-v0.4.36-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f5253754716b017abf7f10a5d67117c80d1eaccbb6684da33200d9b1fdea91b7"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
