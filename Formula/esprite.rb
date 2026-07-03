class Esprite < Formula
  desc "ESP32/Arduino firmware simulator with an agent-facing CLI (host-native + QEMU backends)"
  homepage "https://github.com/rvben/esprite"
  version "0.4.3"
  license "MIT"

  on_macos do
    url "https://github.com/rvben/esprite/releases/download/v0.4.3/esprite-0.4.3-darwin-arm64.tar.gz"
    sha256 "555d2d99dc8187999e123291124a2748fa3060ad93066804875a614aeec82020"
  end

  on_linux do
    url "https://github.com/rvben/esprite/releases/download/v0.4.3/esprite-0.4.3-linux-x86_64.tar.gz"
    sha256 "2c8cd63fb68e917a0369e12a38f37b68c933939328b705ed5cd3cd2b5b0e5f1f"
  end

  def install
    bin.install "esprite"
  end

  test do
    assert_match "esprite", shell_output("#{bin}/esprite --version")
  end
end
