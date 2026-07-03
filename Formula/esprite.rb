class Esprite < Formula
  desc "ESP32/Arduino firmware simulator with an agent-facing CLI (host-native + QEMU backends)"
  homepage "https://github.com/rvben/esprite"
  version "0.4.0"
  license "MIT"

  on_macos do
    url "https://github.com/rvben/esprite/releases/download/v0.4.0/esprite-0.4.0-darwin-arm64.tar.gz"
    sha256 "44c344ccf2a3badf6717c54ea582e1f309a3de1df0c966ece7c143aa4d52a515"
  end

  on_linux do
    url "https://github.com/rvben/esprite/releases/download/v0.4.0/esprite-0.4.0-linux-x86_64.tar.gz"
    sha256 "e063f7beb1be4d8f8bd63314f35d2d50fbebba2e9f9b6fe097d03d58ec05b922"
  end

  def install
    bin.install "esprite"
  end

  test do
    assert_match "esprite", shell_output("#{bin}/esprite --version")
  end
end
