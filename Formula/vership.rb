class Vership < Formula
  desc "Multi-target release orchestrator"
  homepage "https://github.com/rvben/vership"
  version "0.4.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.4.3/vership-v0.4.3-aarch64-apple-darwin.tar.gz"
      sha256 "ec0a69d726c65d832d09c415e2c5ba70cc47a9c9f5b31b4a7768781609141780"
    else
      url "https://github.com/rvben/vership/releases/download/v0.4.3/vership-v0.4.3-x86_64-apple-darwin.tar.gz"
      sha256 "0ddc21751e31ca070684ba210248dd1a1023527ab67742aa946993c4d1ec6cb5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.4.3/vership-v0.4.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d2c7c8620775a5af4adb852645d7a8238512158cf88ad15fdee76877143cd95f"
    else
      url "https://github.com/rvben/vership/releases/download/v0.4.3/vership-v0.4.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bf06580907d599eb2966d10cf2bdbe126a4e1515094e024ec0512ae4a85426da"
    end
  end

  def install
    bin.install "vership"
  end

  test do
    system "#{bin}/vership", "--version"
  end
end
