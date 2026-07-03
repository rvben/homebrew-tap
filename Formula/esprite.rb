class Esprite < Formula
  desc "ESP32/Arduino firmware simulator with an agent-facing CLI (host-native + QEMU backends)"
  homepage "https://github.com/rvben/esprite"
  version "0.4.5"
  license "MIT"

  on_macos do
    url "https://github.com/rvben/esprite/releases/download/v0.4.5/esprite-0.4.5-darwin-arm64.tar.gz"
    sha256 "e2958740d53b6757c7d1d1e0c78c7f594b4f178f1832307239ed22081c3e339d"
  end

  on_linux do
    url "https://github.com/rvben/esprite/releases/download/v0.4.5/esprite-0.4.5-linux-x86_64.tar.gz"
    sha256 "6121e9d743e78e91e91cc54718bed190af6a9e27ac8acc949fa3b76ec38e0b89"
  end

  def install
    bin.install "esprite"
  end

  test do
    assert_match "esprite", shell_output("#{bin}/esprite --version")
  end
end
